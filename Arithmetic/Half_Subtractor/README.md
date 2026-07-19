# Half Subtractor

## Description
The Half Subtractor is a fundamental combinational circuit used to subtract one single-bit binary number from another. It computes the difference and borrow-out of the subtraction.

## Truth Table
| Input `a` | Input `b` | Output `diff` | Output `bout` |
| :---: | :---: | :---: | :---: |
|   0   |   0   |   0   |   0   |
|   0   |   1   |   1   |   1   |
|   1   |   0   |   1   |   0   |
|   1   |   1   |   0   |   0   |

## Module I/O
| Port Name | Bit Width | Type | Description |
|-----------|-----------|------|-------------|
| `a`       | 1         | input| Minuend input |
| `b`       | 1         | input| Subtrahend input (to be subtracted from `a`) |
| `diff`    | 1         | output| Difference output ($a - b$) |
| `bout`    | 1         | output| Borrow-out output |

## Files Included
- `src/` (contains Verilog source code)
- `testbench/` (contains self-checking testbench)
- `rtl/` (empty, schematic layout directory)
- `waveform/` (empty, simulation waveform directory)
