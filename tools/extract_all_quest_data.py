#!/usr/bin/env python3
"""
Comprehensive quest data extraction from FFXIV 1.0 client DAT files.
Generates SQL for: names, rewards, GC ranks, prerequisites, and schema changes.
"""

import sys
import os
import re
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from dat_reader import load_schema, load_sheet_info, read_sheet_data

EXP_BASE_PER_UNIT = {
    5: 40, 10: 80, 15: 100, 17: 120, 18: 130,
    20: 170, 21: 200, 24: 250, 25: 270,
    30: 380, 31: 450, 35: 560,
    40: 710, 45: 890, 50: 1100
}


def interpolate_exp_base(level):
    if level in EXP_BASE_PER_UNIT:
        return EXP_BASE_PER_UNIT[level]
    keys = sorted(EXP_BASE_PER_UNIT.keys())
    if level <= keys[0]:
        return EXP_BASE_PER_UNIT[keys[0]]
    if level >= keys[-1]:
        return EXP_BASE_PER_UNIT[keys[-1]]
    lo, hi = keys[0], keys[-1]
    for k in keys:
        if k <= level: lo = k
        if k >= level: hi = k; break
    if hi == lo: return EXP_BASE_PER_UNIT[lo]
    frac = (level - lo) / (hi - lo)
    return int(EXP_BASE_PER_UNIT[lo] + frac * (EXP_BASE_PER_UNIT[hi] - EXP_BASE_PER_UNIT[lo]))


def extract_rewards(reward_row, quest_level):
    exp, gil, items = 0, 0, []
    for slot in range(16):
        base = slot * 13
        status, rtype = reward_row[base], reward_row[base + 1]
        c3 = reward_row[base + 3]
        vals = reward_row[base + 5:base + 9]
        if status not in (100, 302): continue
        if rtype == -12 and vals[0] > 0:
            exp = max(exp, vals[0])
        elif rtype == -13 and vals[0] > 0 and quest_level > 0:
            exp = max(exp, interpolate_exp_base(quest_level) * vals[0])
        elif rtype == -2 and vals[0] > 0:
            gil = max(gil, vals[0])
        elif rtype in (-4, -8, -10) and c3 > 0 and status == 100:
            qty = max(1, vals[0]) if vals[0] > 0 else 1
            if len(items) < 4: items.append((c3, qty))
    return exp, gil, items


def read_server_quests(sql_path):
    quests = {}
    with open(sql_path, 'r', encoding='utf-8') as f:
        for line in f:
            m = re.search(r"\((\d+),\s*'([^']*)',\s*'([^']*)',\s*(\d+),\s*(\d+)\)", line)
            if m:
                qid = int(m.group(1))
                quests[qid] = {
                    'name': m.group(2),
                    'className': m.group(3),
                    'prerequisite': int(m.group(4)),
                    'minLevel': int(m.group(5))
                }
    return quests


MSQ_CHAINS = {
    'limsa': [110001, 110002, 110003, 110004],
    'gridania': [110005, 110006, 110007, 110008],
    'uldah': [110009, 110010, 110011, 110012],
    'merged': [110013, 110014, 110015, 110016, 110017, 110018, 110019, 110020, 110021],
}


def derive_prerequisites(server_quests):
    prereqs = {}

    for chain_name, chain in MSQ_CHAINS.items():
        for i in range(1, len(chain)):
            prereqs[chain[i]] = chain[i - 1]

    if 110013 in server_quests:
        prereqs[110013] = 110004

    chains = {}
    for qid, data in server_quests.items():
        cn = data['className']
        prefix = re.match(r'^([A-Za-z]+)', cn)
        if not prefix: continue
        p = prefix.group(1)
        if p in ('Man', 'Trl', 'Dft', 'Wld'): continue
        if p not in chains: chains[p] = []
        chains[p].append(qid)

    for prefix, qids in chains.items():
        qids.sort()
        for i in range(1, len(qids)):
            if qids[i] not in prereqs:
                prereqs[qids[i]] = qids[i - 1]

    return prereqs


def main():
    output_file = sys.argv[1] if len(sys.argv) > 1 else None
    out = open(output_file, 'w', encoding='utf-8') if output_file else sys.stdout

    print("Loading game data...", file=sys.stderr)
    sheets = load_schema()

    quest_sub = load_sheet_info(sheets['quest'])
    quest_rows = read_sheet_data(quest_sub[0])

    reward_sub = load_sheet_info(sheets['quest_new_reward'])
    reward_rows = read_sheet_data(reward_sub[0])

    text_sub = load_sheet_info(sheets['xtx/quest'])
    text_rows = read_sheet_data(text_sub[1])

    server_quests = read_server_quests(r"E:\Project Meteor\Data\sql\gamedata_quests.sql")
    prerequisites = derive_prerequisites(server_quests)

    out.write("-- ============================================================\n")
    out.write("-- FFXIV 1.0 Complete Quest Data Update\n")
    out.write("-- Auto-extracted from client DAT files\n")
    out.write("-- ============================================================\n\n")

    # Section 0: Schema changes
    out.write("-- SECTION 0: Schema changes\n")
    out.write("ALTER TABLE `gamedata_quests` ADD COLUMN IF NOT EXISTS `minGCRank` smallint(5) unsigned NOT NULL DEFAULT 0 AFTER `minLevel`;\n")
    out.write("ALTER TABLE `gamedata_quests` ADD COLUMN IF NOT EXISTS `gcAffiliation` smallint(5) unsigned NOT NULL DEFAULT 0 AFTER `minGCRank`;\n\n")

    # Section 1: Quest Names
    out.write("-- SECTION 1: Quest Names (fill [en] placeholders)\n\n")
    name_count = 0
    for qid in sorted(text_rows.keys()):
        if qid < 110000: continue
        name = text_rows[qid][0]
        if not name or name == "[en]": continue
        escaped = name.replace("'", "\\'").replace("\\", "\\\\")
        out.write(f"UPDATE `gamedata_quests` SET `name` = '{escaped}' WHERE `id` = {qid} AND `name` = '[en]';\n")
        name_count += 1
    out.write(f"\n-- {name_count} quest names\n\n")

    # Section 2: Rewards
    out.write("-- SECTION 2: Quest Rewards\n\n")
    reward_count = 0
    for qid in sorted(quest_rows.keys()):
        if qid < 110000 or qid not in reward_rows: continue
        quest_level = quest_rows[qid][2]
        exp, gil, items = extract_rewards(reward_rows[qid], quest_level)
        if exp == 0 and gil == 0 and len(items) == 0: continue
        quest_name = text_rows.get(qid, [''])[0] if qid in text_rows else ''
        parts = []
        if exp > 0: parts.append(f"`expReward` = {exp}")
        if gil > 0: parts.append(f"`gilReward` = {gil}")
        for i, (item_id, qty) in enumerate(items):
            parts.append(f"`itemReward{i+1}` = {item_id}")
            parts.append(f"`itemReward{i+1}Qty` = {qty}")
        if parts:
            comment = f" -- {quest_name} (Lv{quest_level})" if quest_name else ""
            out.write(f"UPDATE `gamedata_quests` SET {', '.join(parts)} WHERE `id` = {qid};{comment}\n")
            reward_count += 1
    out.write(f"\n-- {reward_count} quest rewards\n\n")

    # Section 3: GC Rank Requirements
    out.write("-- SECTION 3: Grand Company Rank Requirements\n\n")
    gc_count = 0
    for qid in sorted(quest_rows.keys()):
        if qid < 110000: continue
        row = quest_rows[qid]
        gc_rank = row[4]
        gc_affil = row[3] if row[3] in (201, 202, 203, 204) else 0
        if gc_rank > 0 or gc_affil > 0:
            quest_name = text_rows.get(qid, [''])[0] if qid in text_rows else ''
            gc_names = {201: 'Maelstrom', 202: 'Serpents', 203: 'Flames', 204: 'Cross-GC'}
            gc_label = gc_names.get(gc_affil, '')
            parts = []
            if gc_rank > 0: parts.append(f"`minGCRank` = {gc_rank}")
            if gc_affil > 0: parts.append(f"`gcAffiliation` = {gc_affil}")
            comment = f" -- {quest_name} [{gc_label}]" if quest_name else ""
            out.write(f"UPDATE `gamedata_quests` SET {', '.join(parts)} WHERE `id` = {qid};{comment}\n")
            gc_count += 1
    out.write(f"\n-- {gc_count} GC-gated quests\n\n")

    # Section 4: Prerequisites
    out.write("-- SECTION 4: Quest Prerequisites (chain ordering)\n\n")
    prereq_count = 0
    for qid in sorted(prerequisites.keys()):
        prereq = prerequisites[qid]
        if prereq > 0:
            quest_name = text_rows.get(qid, [''])[0] if qid in text_rows else ''
            prereq_name = text_rows.get(prereq, [''])[0] if prereq in text_rows else ''
            comment = f" -- {quest_name} requires {prereq_name}" if quest_name else ""
            out.write(f"UPDATE `gamedata_quests` SET `prerequisite` = {prereq} WHERE `id` = {qid};{comment}\n")
            prereq_count += 1
    out.write(f"\n-- {prereq_count} prerequisites\n")

    if output_file: out.close()
    print(f"Done: {name_count} names, {reward_count} rewards, {gc_count} GC gates, {prereq_count} prerequisites", file=sys.stderr)


if __name__ == '__main__':
    main()
