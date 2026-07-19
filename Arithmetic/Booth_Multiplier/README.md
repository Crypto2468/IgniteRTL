# Booth Multiplier (Signed Radix-2 Multiplier)

## Description
The Booth Multiplier is a sequential digital arithmetic module that computes the signed $2N$-bit product of two $N$-bit signed numbers (in two's complement form) using Radix-2 Booth's multiplication algorithm.

## Truth Table


## Module I/O
| Port Name | Bit Width | Type | Description |
|-----------|-----------|------|-------------|
| `clk`     | 1         | input| System Clock |
| `rst_n`   | 1         | input| Active-low asynchronous reset |
| `start`   | 1         | input| Starts multiplication |
| `a`       | `WIDTH`   | input| Multiplicand signed vector |
| `b`       | `WIDTH`   | input| Multiplier signed vector |
| `product` | `2*WIDTH` | output| Registered signed product vector |
| `ready`   | 1         | output| Active-high indicating multiplier is ready for inputs |
| `done`    | 1         | output| Active-high pulse indicating computation completed |

## Files Included
- `src/` (contains Verilog source code)
- `testbench/` (contains self-checking testbench)
- `rtl/` (empty, schematic layout directory)
- `waveform/` (empty, simulation waveform directory)
