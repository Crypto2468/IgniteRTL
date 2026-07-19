# Full Adder

## Description
The Full Adder is a combinational circuit that adds three 1-bit binary digits (two operand bits and one carry-in bit from a previous stage) and outputs a Sum and a Carry-out.

## Truth Table
| Input `a` | Input `b` | Input `cin` | Output `sum` | Output `cout` |
| :---: | :---: | :---: | :---: | :---: |
|   0   |   0   |   0   |   0   |   0   |
|   0   |   0   |   1   |   1   |   0   |
|   0   |   1   |   0   |   1   |   0   |
|   0   |   1   |   1   |   0   |   1   |
|   1   |   0   |   0   |   1   |   0   |
|   1   |   0   |   1   |   0   |   1   |
|   1   |   1   |   0   |   0   |   1   |
|   1   |   1   |   1   |   1   |   1   |

## Module I/O
| Port Name | Bit Width | Type | Description |
|-----------|-----------|------|-------------|
| `a`       | 1         | input| First binary input operand |
| `b`       | 1         | input| Second binary input operand |
| `cin`     | 1         | input| Carry-in from previous bit stage |
| `sum`     | 1         | output| Least significant bit of addition (Sum) |
| `cout`    | 1         | output| Carry-out to next bit stage |

## Files Included
- `src/` (contains Verilog source code)
- `testbench/` (contains self-checking testbench)
- `rtl/` (empty, schematic layout directory)
- `waveform/` (empty, simulation waveform directory)
