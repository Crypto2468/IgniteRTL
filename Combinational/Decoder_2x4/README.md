# 2x4 Decoder with Enable

## Description
A 2x4 Decoder is a combinational logic circuit that converts a 2-bit binary input code (`a[1:0]`) into one of four mutually exclusive active outputs (`y0` to `y3`). This module features an active-high Enable line (`en`). When `en` is low, all outputs are forced low regardless of the input.

## Truth Table
| Enable (`en`) | Input `a[1]` | Input `a[0]` | Output `y3` | Output `y2` | Output `y1` | Output `y0` | Description |
|:-------------:|:------------:|:------------:|:-----------:|:-----------:|:-----------:|:-----------:|-------------|
|       0       |      X       |      X       |      0      |      0      |      0      |      0      | Disabled, all outputs 0 |
|       1       |      0       |      0       |      0      |      0      |      0      |      1      | `y0` goes active |
|       1       |      0       |      1       |      0      |      0      |      1      |      0      | `y1` goes active |
|       1       |      1       |      0       |      0      |      1      |      0      |      0      | `y2` goes active |
|       1       |      1       |      1       |      1      |      0      |      0      |      0      | `y3` goes active |

## Module I/O
| Port Name | Bit Width | Type   | Description |
|-----------|-----------|--------|-------------|
| `a`       | 2         | input  | 2-bit Binary input code (`a[1]`, `a[0]`) |
| `en`      | 1         | input  | Active-high enable line |
| `y0` to `y3`| 1       | output | Active-high output lines 0 to 3 |

## Files Included
- `src/` (contains Verilog source code)
- `testbench/` (contains self-checking testbench)
- `rtl/` (empty, schematic layout directory)
- `waveform/` (empty, simulation waveform directory)
