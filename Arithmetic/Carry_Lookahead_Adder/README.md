# Carry Lookahead Adder

## Description
The Carry Lookahead Adder (CLA) is a high-speed combinational binary adder that reduces carry propagation delay by computing carry signals in parallel. It calculates carry bits prior to the sum calculations using specialized propagate and generate equations.

## Truth Table


## Module I/O
| Port Name | Bit Width | Type | Description |
|-----------|-----------|------|-------------|
| `a`       | 4         | input| First 4-bit operand vector |
| `b`       | 4         | input| Second 4-bit operand vector |
| `cin`     | 1         | input| Carry-in input |
| `sum`     | 4         | output| 4-bit Sum output vector |
| `cout`    | 1         | output| Carry-out output |
| `pg`      | 1         | output| Block propagate term for cascading |
| `gg`      | 1         | output| Block generate term for cascading |

## Files Included
- `src/` (contains Verilog source code)
- `testbench/` (contains self-checking testbench)
- `rtl/` (empty, schematic layout directory)
- `waveform/` (empty, simulation waveform directory)
