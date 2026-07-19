# Full Subtractor

## Description
The Full Subtractor is a combinational logic circuit that performs subtraction on three 1-bit inputs: minuend (`a`), subtrahend (`b`), and borrow-in (`bin`) from a previous stage. It outputs a Difference and a Borrow-out.

## Truth Table
| Input `a` | Input `b` | Input `bin` | Output `diff` | Output `bout` |
| :---: | :---: | :---: | :---: | :---: |
|   0   |   0   |   0   |   0   |   0   |
|   0   |   0   |   1   |   1   |   1   |
|   0   |   1   |   0   |   1   |   1   |
|   0   |   1   |   1   |   0   |   1   |
|   1   |   0   |   0   |   1   |   0   |
|   1   |   0   |   1   |   0   |   0   |
|   1   |   1   |   0   |   0   |   0   |
|   1   |   1   |   1   |   1   |   1   |

## Module I/O
| Port Name | Bit Width | Type | Description |
|-----------|-----------|------|-------------|
| `a`       | 1         | input| Minuend input |
| `b`       | 1         | input| Subtrahend input (to be subtracted from `a`) |
| `bin`     | 1         | input| Borrow-in from previous stage |
| `diff`    | 1         | output| Difference output ($a - b - bin$) |
| `bout`    | 1         | output| Borrow-out output |

## Files Included
- `src/` (contains Verilog source code)
- `testbench/` (contains self-checking testbench)
- `rtl/` (empty, schematic layout directory)
- `waveform/` (empty, simulation waveform directory)
