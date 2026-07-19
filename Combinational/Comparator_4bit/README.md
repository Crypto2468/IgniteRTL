# 4-bit Magnitude Comparator

## Description
A 4-bit Magnitude Comparator is a combinational logic circuit that compares two 4-bit binary inputs (`a[3:0]` and `b[3:0]`) and outputs three binary status flags indicating if $A = B$ (`a_eq_b`), $A > B$ (`a_gt_b`), or $A < B$ (`a_lt_b`).

## Truth Table
| Comparison Condition | Output `a_gt_b` | Output `a_eq_b` | Output `a_lt_b` |
|:---------------------:|:---------------:|:---------------:|:---------------:|
|         $A = B$       |        0        |        1        |        0        |
|         $A > B$       |        1        |        0        |        0        |
|         $A < B$       |        0        |        0        |        1        |

## Module I/O
| Port Name | Bit Width | Type   | Description |
|-----------|-----------|--------|-------------|
| `a`       | 4         | input  | 4-bit binary input A (`a[3]` to `a[0]`) |
| `b`       | 4         | input  | 4-bit binary input B (`b[3]` to `b[0]`) |
| `a_eq_b`  | 1         | output | Active-high Equal flag ($A = B$) |
| `a_gt_b`  | 1         | output | Active-high Greater Than flag ($A > B$) |
| `a_lt_b`  | 1         | output | Active-high Less Than flag ($A < B$) |

## Files Included
- `src/` (contains Verilog source code)
- `testbench/` (contains self-checking testbench)
- `rtl/` (empty, schematic layout directory)
- `waveform/` (empty, simulation waveform directory)
