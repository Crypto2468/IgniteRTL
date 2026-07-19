# ⚖️ 2-bit Magnitude Comparator

## 📝 Description
A 2-bit Magnitude Comparator is a combinational logic circuit that compares two 2-bit binary inputs (`a[1:0]` and `b[1:0]`) and determines their relative magnitude. It outputs three status signals: Equal (`a_eq_b`), Greater Than (`a_gt_b`), and Less Than (`a_lt_b`).

## 📋 Truth Table
| Comparison Condition | Output `a_gt_b` | Output `a_eq_b` | Output `a_lt_b` |
|:---------------------:|:---------------:|:---------------:|:---------------:|
|         $A = B$       |        0        |        1        |        0        |
|         $A > B$       |        1        |        0        |        0        |
|         $A < B$       |        0        |        0        |        1        |

## 🔹 Module I/O
| Port Name | Bit Width | Type   | Description |
|-----------|-----------|--------|-------------|
| `a`       | 2         | input  | 2-bit binary input A (`a[1]`, `a[0]`) |
| `b`       | 2         | input  | 2-bit binary input B (`b[1]`, `b[0]`) |
| `a_eq_b`  | 1         | output | Active-high Equal flag ($A = B$) |
| `a_gt_b`  | 1         | output | Active-high Greater Than flag ($A > B$) |
| `a_lt_b`  | 1         | output | Active-high Less Than flag ($A < B$) |

## 📁 Files Included
- `src/` (contains Verilog source code)
- `testbench/` (contains self-checking testbench)
- `rtl/` (empty, schematic layout directory)
- `waveform/` (empty, simulation waveform directory)
