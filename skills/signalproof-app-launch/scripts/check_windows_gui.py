#!/usr/bin/env python3
"""Static Windows PE GUI-subsystem check. Not a target-OS runtime test."""
import struct
import sys
from pathlib import Path

def subsystem(data):
    if len(data) < 64 or data[:2] != b"MZ":
        raise ValueError("not a PE executable")
    pe = struct.unpack_from("<I", data, 0x3C)[0]
    if pe < 64 or pe + 24 > len(data) or data[pe:pe+4] != b"PE\0\0":
        raise ValueError("invalid or truncated PE header")
    opt = pe + 24
    size = struct.unpack_from("<H", data, pe+20)[0]
    if size < 70 or opt + size > len(data):
        raise ValueError("truncated optional header")
    if struct.unpack_from("<H", data, opt)[0] not in (0x10b, 0x20b):
        raise ValueError("unknown optional header")
    return struct.unpack_from("<H", data, opt+68)[0]

def main(argv):
    if len(argv) != 2:
        print("usage: check_windows_gui.py <final-windows-exe>", file=sys.stderr)
        return 2
    try:
        n = subsystem(Path(argv[1]).read_bytes())
    except (ValueError, OSError) as exc:
        print(f"FAIL: {exc}", file=sys.stderr)
        return 2
    if n != 2:
        print(f"FAIL: Windows PE subsystem {n} (expected GUI=2)")
        return 2
    print("PASS: Windows GUI subsystem=2 (STATIC ONLY; target Windows launch and human acceptance pending)")
    return 0

if __name__ == "__main__":
    raise SystemExit(main(sys.argv))
