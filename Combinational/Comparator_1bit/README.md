# 1-bit Magnitude Comparator

## Description
A 1-bit Magnitude Comparator is a combinational logic circuit that compares two single-bit binary inputs (`a` and `b`) and determines their relative magnitude relationship. It generates three active-high status outputs: Equal (`a_eq_b`), Greater Than (`a_gt_b`), and Less Than (`a_lt_b`).

## Truth Table
| Input `a` | Input `b` | Output `a_gt_b` | Output `a_eq_b` | Output `a_lt_b` | Description |
|:---------:|:---------:|:---------------:|:---------------:|:---------------:|-------------|
|     0     |     0     |        0        |        1        |        0        | $A$ is equal to $B$ |
|     0     |     1     |        0        |        0        |        1        | $A$ is less than $B$ |
|     1     |     0     |        1        |        0        |        0        | $A$ is greater than $B$ |
|     1     |     1     |        0        |        1        |        0        | $A$ is equal to $B$ |

## Module I/O
| Port Name | Bit Width | Type   | Description |
|-----------|-----------|--------|-------------|
| `a`       | 1         | input  | 1-bit binary input A |
| `b`       | 1         | input  | 1-bit binary input B |
| `a_eq_b`  | 1         | output | Active-high Equal flag ($A = B$) |
| `a_gt_b`  | 1         | output | Active-high Greater Than flag ($A > B$) |
| `a_lt_b`  | 1         | output | Active-high Less Than flag ($A < B$) |

## Files Included
- `src/` (contains Verilog source code)
- `testbench/` (contains self-checking testbench)
- `rtl/` (empty, schematic layout directory)
- `waveform/` (empty, simulation waveform directory)
