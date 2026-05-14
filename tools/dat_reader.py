#!/usr/bin/env python3
"""
FFXIV 1.0 DAT file reader - extracts sheet data from game client files.
Based on Seventh Umbral Workshop's C++ implementation.
"""

import struct
import sys
import os
import xml.etree.ElementTree as ET
from pathlib import Path

GAME_PATH = r"E:\Program Files (x86)\SquareEnix\FINAL FANTASY XIV"
GAME_SCHEMA_FILE_ID = 0x01030000

TYPE_NAMES = {
    's8': 0, 'u8': 1, 's16': 2, 'u16': 3,
    's32': 4, 'u32': 5, 'bool': 6, 'f16': 7,
    'float': 8, 'str': 9
}

TYPE_SIZES = {
    's8': 1, 'u8': 1, 'bool': 1,
    's16': 2, 'u16': 2, 'f16': 2,
    's32': 4, 'u32': 4, 'float': 4,
    'str': -1  # variable
}


def resource_id_to_path(resource_id):
    b3 = (resource_id >> 24) & 0xFF
    b2 = (resource_id >> 16) & 0xFF
    b1 = (resource_id >> 8) & 0xFF
    b0 = resource_id & 0xFF
    return os.path.join(GAME_PATH, "data",
                        f"{b3:02X}", f"{b2:02X}", f"{b1:02X}", f"{b0:02X}.DAT")


def scramble_buffer(data):
    buf = bytearray(data)
    lo = 0
    hi = len(buf) - 1
    while lo < hi:
        buf[lo], buf[hi] = buf[hi], buf[lo]
        lo += 2
        hi -= 2
    return bytes(buf)


def decode_dat(raw_data):
    if len(raw_data) == 0:
        return raw_data

    if raw_data[-1] != 0xF1:
        return raw_data

    encoded_length = len(raw_data) - 1
    buf = bytearray(raw_data[:encoded_length])

    buf = bytearray(scramble_buffer(buf))

    xA = (encoded_length * 7) & 0xFFFF
    if xA >= 0x8000:
        xA -= 0x10000

    xB_bytes = struct.unpack_from('<h', buf, 6)[0] ^ 0x6C6D
    xB = xB_bytes & 0xFFFF

    for i in range(0, encoded_length - 1, 4):
        val = struct.unpack_from('<H', buf, i)[0]
        val ^= (xA & 0xFFFF)
        struct.pack_into('<H', buf, i, val)

    for i in range(2, encoded_length - 1, 4):
        val = struct.unpack_from('<H', buf, i)[0]
        val ^= (xB & 0xFFFF)
        struct.pack_into('<H', buf, i, val)

    if encoded_length & 1:
        buf[encoded_length - 1] ^= (xA & 0xFF)
        buf[encoded_length - 1] ^= (xB & 0xFF)

    return bytes(buf)


def load_dat_file(resource_id):
    path = resource_id_to_path(resource_id)
    if not os.path.exists(path):
        print(f"[WARN] File not found: {path} (resId 0x{resource_id:08X})")
        return None
    with open(path, 'rb') as f:
        raw = f.read()
    return decode_dat(raw)


def load_schema():
    data = load_dat_file(GAME_SCHEMA_FILE_ID)
    if data is None:
        print("ERROR: Cannot load game schema file!")
        sys.exit(1)

    xml_text = data.decode('utf-8-sig', errors='replace')
    end_tag = xml_text.rfind('>')
    if end_tag >= 0:
        xml_text = xml_text[:end_tag + 1]
    root = ET.fromstring(xml_text)

    sheets = {}
    for sheet_node in root.findall('.//sheet'):
        name = sheet_node.get('name', '')
        file_id_str = sheet_node.get('infofile', '0')
        file_id = int(file_id_str)
        sheets[name] = file_id
    return sheets


def load_sheet_info(file_id):
    data = load_dat_file(file_id)
    if data is None:
        return None

    xml_text = data.decode('utf-8-sig', errors='replace')
    end_tag = xml_text.rfind('>')
    if end_tag >= 0:
        xml_text = xml_text[:end_tag + 1]
    root = ET.fromstring(xml_text)

    sub_sheets = []
    for sheet_node in root.findall('.//sheet'):
        info = {
            'name': sheet_node.get('name', ''),
            'mode': sheet_node.get('mode', ''),
            'column_count': int(sheet_node.get('column_count', '0')),
            'type_params': [],
            'blocks': []
        }

        for param in sheet_node.findall('.//type/param'):
            info['type_params'].append(param.text.strip())

        for file_node in sheet_node.findall('.//block/file'):
            block = {
                'begin': int(file_node.get('begin', '0')),
                'count': int(file_node.get('count', '0')),
                'offset': int(file_node.get('offset', '0')),
                'enable': int(file_node.get('enable', '0')),
                'data': int(file_node.text.strip())
            }
            info['blocks'].append(block)

        sub_sheets.append(info)
    return sub_sheets


def read_row(type_params, data, offset):
    row = []
    pos = offset
    for tp in type_params:
        if tp in ('s8',):
            val = struct.unpack_from('<b', data, pos)[0]
            row.append(val)
            pos += 1
        elif tp in ('u8', 'bool'):
            val = struct.unpack_from('<B', data, pos)[0]
            row.append(val)
            pos += 1
        elif tp in ('s16',):
            val = struct.unpack_from('<h', data, pos)[0]
            row.append(val)
            pos += 2
        elif tp in ('u16', 'f16'):
            val = struct.unpack_from('<H', data, pos)[0]
            row.append(val)
            pos += 2
        elif tp in ('s32',):
            val = struct.unpack_from('<i', data, pos)[0]
            row.append(val)
            pos += 4
        elif tp in ('u32',):
            val = struct.unpack_from('<I', data, pos)[0]
            row.append(val)
            pos += 4
        elif tp == 'float':
            val = struct.unpack_from('<f', data, pos)[0]
            row.append(val)
            pos += 4
        elif tp == 'str':
            str_len = struct.unpack_from('<H', data, pos)[0]
            pos += 2
            unknown = data[pos]
            pos += 1
            str_data = bytearray(data[pos:pos + str_len - 1])
            for i in range(len(str_data)):
                str_data[i] ^= 0x73
            text = str_data.rstrip(b'\x00').decode('utf-8', errors='replace')
            row.append(text)
            pos += str_len - 1
        else:
            print(f"[WARN] Unknown type: {tp}")
            row.append(None)
    return row, pos


def read_sheet_data(sub_sheet):
    type_params = sub_sheet['type_params']
    rows = {}

    for block in sub_sheet['blocks']:
        enable_data = load_dat_file(block['enable'])
        data_file = load_dat_file(block['data'])

        if enable_data is None or data_file is None:
            print(f"  [WARN] Missing enable/data file for block (enable=0x{block['enable']:08X}, data=0x{block['data']:08X})")
            continue

        enable_pos = 0
        data_pos = 0

        while enable_pos + 8 <= len(enable_data):
            start_id = struct.unpack_from('<i', enable_data, enable_pos)[0]
            num_ids = struct.unpack_from('<i', enable_data, enable_pos + 4)[0]
            enable_pos += 8

            if start_id == 0 and num_ids == 0 and enable_pos >= len(enable_data):
                break

            for i in range(num_ids):
                if data_pos >= len(data_file):
                    break
                try:
                    row, data_pos = read_row(type_params, data_file, data_pos)
                    rows[start_id + i] = row
                except (struct.error, IndexError) as e:
                    print(f"  [WARN] Error reading row {start_id + i}: {e}")
                    break

    return rows


def list_sheets():
    print("Loading game schema...")
    sheets = load_schema()
    print(f"\nFound {len(sheets)} sheets:\n")
    for name in sorted(sheets.keys()):
        fid = sheets[name]
        print(f"  {name:40s}  0x{fid:08X}  ({resource_id_to_path(fid)})")
    return sheets


def dump_sheet(sheet_name, max_rows=50):
    sheets = load_schema()
    if sheet_name not in sheets:
        print(f"ERROR: Sheet '{sheet_name}' not found. Use 'list' to see available sheets.")
        return

    file_id = sheets[sheet_name]
    print(f"Loading sheet '{sheet_name}' (info file 0x{file_id:08X})...")

    sub_sheets = load_sheet_info(file_id)
    if sub_sheets is None:
        print("ERROR: Could not load sheet info file.")
        return

    for idx, ss in enumerate(sub_sheets):
        print(f"\n--- Sub-sheet {idx}: '{ss['name']}' ---")
        print(f"  Mode: {ss['mode']}")
        print(f"  Columns ({ss['column_count']}): {', '.join(ss['type_params'])}")
        print(f"  Blocks: {len(ss['blocks'])}")
        for b in ss['blocks']:
            print(f"    begin={b['begin']} count={b['count']} enable=0x{b['enable']:08X} data=0x{b['data']:08X}")

        print(f"\n  Reading data...")
        rows = read_sheet_data(ss)
        print(f"  Total rows: {len(rows)}")

        count = 0
        for row_id in sorted(rows.keys()):
            if count >= max_rows:
                print(f"  ... (showing first {max_rows} rows, use --max to see more)")
                break
            row = rows[row_id]
            row_display = []
            for i, val in enumerate(row):
                tp = ss['type_params'][i] if i < len(ss['type_params']) else '?'
                if tp == 'str':
                    row_display.append(f'"{val}"')
                else:
                    row_display.append(str(val))
            print(f"  [{row_id}] {', '.join(row_display)}")
            count += 1

    return sub_sheets


def export_sheet_csv(sheet_name, output_path, column_names=None):
    sheets = load_schema()
    if sheet_name not in sheets:
        print(f"ERROR: Sheet '{sheet_name}' not found.")
        return

    file_id = sheets[sheet_name]
    sub_sheets = load_sheet_info(file_id)
    if sub_sheets is None:
        return

    for idx, ss in enumerate(sub_sheets):
        rows = read_sheet_data(ss)
        suffix = f"_{idx}" if len(sub_sheets) > 1 else ""
        out_file = output_path.replace('.csv', f'{suffix}.csv')

        with open(out_file, 'w', encoding='utf-8') as f:
            header = ['id']
            if column_names and len(column_names) == len(ss['type_params']):
                header.extend(column_names)
            else:
                header.extend([f"col{i}_{ss['type_params'][i]}" for i in range(len(ss['type_params']))])
            f.write(','.join(header) + '\n')

            for row_id in sorted(rows.keys()):
                row = rows[row_id]
                vals = [str(row_id)]
                for i, val in enumerate(row):
                    tp = ss['type_params'][i] if i < len(ss['type_params']) else '?'
                    if tp == 'str':
                        vals.append('"' + str(val).replace('"', '""') + '"')
                    else:
                        vals.append(str(val))
                f.write(','.join(vals) + '\n')

        print(f"Exported {len(rows)} rows to {out_file}")


def main():
    if len(sys.argv) < 2:
        print("FFXIV 1.0 DAT Sheet Reader")
        print(f"Game path: {GAME_PATH}")
        print()
        print("Usage:")
        print("  python dat_reader.py list                     - List all sheets")
        print("  python dat_reader.py dump <sheet_name> [max]  - Dump sheet data")
        print("  python dat_reader.py csv <sheet_name> <out>   - Export to CSV")
        print("  python dat_reader.py info <sheet_name>        - Show sheet structure only")
        return

    cmd = sys.argv[1]

    if cmd == 'list':
        list_sheets()
    elif cmd == 'dump':
        if len(sys.argv) < 3:
            print("Usage: python dat_reader.py dump <sheet_name> [max_rows]")
            return
        max_rows = int(sys.argv[3]) if len(sys.argv) > 3 else 50
        dump_sheet(sys.argv[2], max_rows)
    elif cmd == 'csv':
        if len(sys.argv) < 4:
            print("Usage: python dat_reader.py csv <sheet_name> <output.csv>")
            return
        export_sheet_csv(sys.argv[2], sys.argv[3])
    elif cmd == 'info':
        if len(sys.argv) < 3:
            print("Usage: python dat_reader.py info <sheet_name>")
            return
        sheets = load_schema()
        name = sys.argv[2]
        if name not in sheets:
            print(f"Sheet '{name}' not found.")
            return
        file_id = sheets[name]
        sub_sheets = load_sheet_info(file_id)
        if sub_sheets:
            for idx, ss in enumerate(sub_sheets):
                print(f"Sub-sheet {idx}: '{ss['name']}'")
                print(f"  Mode: {ss['mode']}")
                print(f"  Columns: {ss['column_count']}")
                print(f"  Types: {ss['type_params']}")
                print(f"  Blocks: {len(ss['blocks'])}")
                for b in ss['blocks']:
                    print(f"    begin={b['begin']} count={b['count']} enable=0x{b['enable']:08X} data=0x{b['data']:08X}")
    else:
        print(f"Unknown command: {cmd}")


if __name__ == '__main__':
    main()
