# Array Multiplier

## Description
The Array Multiplier is a parameterized, purely combinational digital multiplier. It computes the $2N$-bit product of two $N$-bit unsigned numbers in a single clock cycle by laying out a 2D matrix of partial-product AND gates and adder cells structurally in parallel.

## Truth Table


## Module I/O
| Port Name | Bit Width | Type | Description |
|-----------|-----------|------|-------------|
| `a`       | `WIDTH`   | input| Multiplicand input vector |
| `b`       | `WIDTH`   | input| Multiplier input vector |
| `product` | `2*WIDTH` | output| Product output vector ($a \times b$) |

## Files Included
- `src/` (contains Verilog source code)
- `testbench/` (contains self-checking testbench)
- `rtl/` (empty, schematic layout directory)
- `waveform/` (empty, simulation waveform directory)
