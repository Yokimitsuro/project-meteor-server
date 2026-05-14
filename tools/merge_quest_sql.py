"""
Merge all quest data sources into a single gamedata_quests.sql installation file.

Reads:
  1. gamedata_quests.sql        — base quest rows (id, name, class, prereq, level)
  2. quest_complete_update.sql  — extracted names, rewards, GC gates, prerequisites
  3. quest_rewards_data.sql     — hand-verified reward data (takes priority)

Writes:
  gamedata_quests.sql — overwritten with complete data including minGCRank + gcAffiliation columns
"""
import re

BASE_DIR = r"E:\Project Meteor\Data\sql"
BASE_SQL = BASE_DIR + r"\gamedata_quests.sql"
UPDATE_SQL = BASE_DIR + r"\quest_complete_update.sql"
REWARDS_SQL = BASE_DIR + r"\quest_rewards_data.sql"

COLUMNS = ['id','questName','className','prerequisite','minLevel','minGCRank','gcAffiliation',
           'expReward','gilReward',
           'itemReward1','itemReward1Qty','itemReward2','itemReward2Qty',
           'itemReward3','itemReward3Qty','itemReward4','itemReward4Qty']

INT_COLS = set(COLUMNS) - {'questName', 'className'}

quests = {}

def sql_escape(s):
    return s.replace("\\", "\\\\").replace("'", "\\'")

def new_quest(qid, name, cn, prereq, lvl):
    return {
        'id': qid, 'questName': name, 'className': cn,
        'prerequisite': prereq, 'minLevel': lvl,
        'minGCRank': 0, 'gcAffiliation': 0,
        'expReward': 0, 'gilReward': 0,
        'itemReward1': 0, 'itemReward1Qty': 0,
        'itemReward2': 0, 'itemReward2Qty': 0,
        'itemReward3': 0, 'itemReward3Qty': 0,
        'itemReward4': 0, 'itemReward4Qty': 0,
    }

def parse_base():
    with open(BASE_SQL, 'r', encoding='utf-8') as f:
        text = f.read()
    pattern = re.compile(r"\((\d+),\s*'((?:[^'\\]|\\.|'')*)',\s*'(\w+)',\s*(\d+),\s*(\d+)\)")
    for m in pattern.finditer(text):
        qid = int(m.group(1))
        name = m.group(2).replace("\\'", "'").replace("\\\\", "\\")
        quests[qid] = new_quest(qid, name, m.group(3), int(m.group(4)), int(m.group(5)))

def apply_updates(path):
    with open(path, 'r', encoding='utf-8') as f:
        for line in f:
            line = line.strip()
            if not line.startswith('UPDATE'):
                continue
            m_id = re.search(r"WHERE\s+`id`\s*=\s*(\d+)", line)
            if not m_id:
                continue
            qid = int(m_id.group(1))
            if qid not in quests:
                continue
            q = quests[qid]
            sets = re.findall(r"`(\w+)`\s*=\s*(?:'((?:[^'\\]|\\.)*)'|(\d+))", line)
            for col, sval, ival in sets:
                if col == 'name':
                    col = 'questName'
                if col == 'questName':
                    val = sval.replace("\\\\'", "'").replace("\\\\", "\\") if sval else sval
                    if q['questName'] == '[en]' or (val and val != '[en]'):
                        q['questName'] = val
                elif col in q and col in INT_COLS:
                    q[col] = int(ival) if ival else (int(sval) if sval and sval.isdigit() else 0)

def write_output():
    sorted_quests = sorted(quests.values(), key=lambda q: q['id'])
    count = len(sorted_quests)
    col_list = ', '.join(f'`{c}`' for c in COLUMNS)

    lines = []
    for i, q in enumerate(sorted_quests):
        name_esc = sql_escape(q['questName'])
        vals = (
            f"({q['id']}, '{name_esc}', '{q['className']}', "
            f"{q['prerequisite']}, {q['minLevel']}, {q['minGCRank']}, {q['gcAffiliation']}, "
            f"{q['expReward']}, {q['gilReward']}, "
            f"{q['itemReward1']}, {q['itemReward1Qty']}, "
            f"{q['itemReward2']}, {q['itemReward2Qty']}, "
            f"{q['itemReward3']}, {q['itemReward3Qty']}, "
            f"{q['itemReward4']}, {q['itemReward4Qty']})"
        )
        sep = ',' if i < count - 1 else ';'
        lines.append(f'\t{vals}{sep}')

    with open(BASE_SQL, 'w', encoding='utf-8', newline='\n') as f:
        f.write(f"""-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.6.17 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             10.1.0.5464
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for ffxiv_server
CREATE DATABASE IF NOT EXISTS `ffxiv_server` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `ffxiv_server`;

-- Dumping structure for table ffxiv_server.gamedata_quests
DROP TABLE IF EXISTS `gamedata_quests`;
CREATE TABLE IF NOT EXISTS `gamedata_quests` (
  `id` int(11) unsigned NOT NULL,
  `questName` varchar(50) NOT NULL,
  `className` varchar(10) NOT NULL,
  `prerequisite` int(11) unsigned NOT NULL DEFAULT 0,
  `minLevel` smallint(5) unsigned NOT NULL DEFAULT 0,
  `minGCRank` smallint(5) unsigned NOT NULL DEFAULT 0,
  `gcAffiliation` smallint(5) unsigned NOT NULL DEFAULT 0,
  `expReward` int(11) unsigned NOT NULL DEFAULT 0,
  `gilReward` int(11) unsigned NOT NULL DEFAULT 0,
  `itemReward1` int(11) unsigned NOT NULL DEFAULT 0,
  `itemReward1Qty` smallint(5) unsigned NOT NULL DEFAULT 0,
  `itemReward2` int(11) unsigned NOT NULL DEFAULT 0,
  `itemReward2Qty` smallint(5) unsigned NOT NULL DEFAULT 0,
  `itemReward3` int(11) unsigned NOT NULL DEFAULT 0,
  `itemReward3Qty` smallint(5) unsigned NOT NULL DEFAULT 0,
  `itemReward4` int(11) unsigned NOT NULL DEFAULT 0,
  `itemReward4Qty` smallint(5) unsigned NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table ffxiv_server.gamedata_quests: ~{count} rows (approximately)
/*!40000 ALTER TABLE `gamedata_quests` DISABLE KEYS */;
REPLACE INTO `gamedata_quests` ({col_list}) VALUES
""")
        f.write('\n'.join(lines))
        f.write('\n')
        f.write("""/*!40000 ALTER TABLE `gamedata_quests` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
""")

# --- main ---
print("1. Parsing base gamedata_quests.sql...")
parse_base()
print(f"   {len(quests)} quests loaded")

print("2. Applying quest_complete_update.sql (names, rewards, GC, prereqs)...")
apply_updates(UPDATE_SQL)

print("3. Applying quest_rewards_data.sql (hand-verified rewards, higher priority)...")
apply_updates(REWARDS_SQL)

stats_gc = sum(1 for q in quests.values() if q['minGCRank'] > 0 or q['gcAffiliation'] > 0)
stats_rew = sum(1 for q in quests.values() if q['expReward'] > 0 or q['gilReward'] > 0 or q['itemReward1'] > 0)
stats_pre = sum(1 for q in quests.values() if q['prerequisite'] > 0)
stats_named = sum(1 for q in quests.values() if q['questName'] != '[en]')

print(f"\n   Stats: {stats_named} named, {stats_rew} with rewards, {stats_pre} with prereqs, {stats_gc} GC-gated")

print("\n4. Writing merged gamedata_quests.sql...")
write_output()
print(f"   Done. {len(quests)} quests written.")
