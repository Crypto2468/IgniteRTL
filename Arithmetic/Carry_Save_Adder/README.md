# Carry Save Adder

## Description
The Carry Save Adder (CSA) is a specialized combinational digital circuit designed to add three multi-bit numbers in parallel. Rather than performing carry-propagation immediately, it reduces three input vectors to two vectors (a sum vector and a carry vector) with a constant delay of one full adder cell ($O(1)$).

## Truth Table


## Module I/O
| Port Name | Bit Width | Type | Description |
|-----------|-----------|------|-------------|
| `a`       | `WIDTH`   | input| First $N$-bit input vector |
| `b`       | `WIDTH`   | input| Second $N$-bit input vector |
| `c`       | `WIDTH`   | input| Third $N$-bit input vector |
| `sum`     | `WIDTH`   | output| Un-propagated Sum vector |
| `carry`   | `WIDTH`   | output| Un-propagated Carry vector |

## Files Included
- `src/` (contains Verilog source code)
- `testbench/` (contains self-checking testbench)
- `rtl/` (empty, schematic layout directory)
- `waveform/` (empty, simulation waveform directory)
