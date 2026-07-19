# 3x8 Decoder with Enable

## Description
A 3x8 Decoder is a combinational logic circuit that decodes a 3-bit binary input code (`a[2:0]`) into one of eight mutually exclusive active-high outputs (`y0` to `y7`). This module features an active-high Enable pin (`en`). When `en` is low, all outputs are forced low regardless of the input.

## Truth Table
| Enable (`en`) | Inputs (`a[2]`, `a[1]`, `a[0]`) | Output Active | Description |
|:-------------:|:-----------------------------:|:-------------:|-------------|
|       0       |              XXX              |     None      | All outputs are low |
|       1       |              000              |     `y0`      | `y0` is high |
|       1       |              001              |     `y1`      | `y1` is high |
|       1       |              010              |     `y2`      | `y2` is high |
|       1       |              011              |     `y3`      | `y3` is high |
|       1       |              100              |     `y4`      | `y4` is high |
|       1       |              101              |     `y5`      | `y5` is high |
|       1       |              110              |     `y6`      | `y6` is high |
|       1       |              111              |     `y7`      | `y7` is high |

## Module I/O
| Port Name | Bit Width | Type   | Description |
|-----------|-----------|--------|-------------|
| `a`       | 3         | input  | 3-bit Binary input code (`a[2]`, `a[1]`, `a[0]`) |
| `en`      | 1         | input  | Active-high enable line |
| `y0` to `y7`| 1       | output | Active-high output lines 0 to 7 |

## Files Included
- `src/` (contains Verilog source code)
- `testbench/` (contains self-checking testbench)
- `rtl/` (empty, schematic layout directory)
- `waveform/` (empty, simulation waveform directory)
