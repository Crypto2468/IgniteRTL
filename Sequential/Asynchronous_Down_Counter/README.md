# 4-bit Asynchronous Down Counter

## Description
An Asynchronous (Ripple) Down Counter counts downwards from `15` to `0`. Each stage is clocked by the primary output (`q`) of the preceding stage. On reset, the counter starts at `0` and instantly rolls over to `15` upon the first active clock transition.

## Truth Table


## Module I/O
| Port Name | Bit Width | Type   | Description |
|-----------|-----------|--------|-------------|
| `clk`     | 1         | input  | Clock input to first stage |
| `rst_n`   | 1         | input  | Asynchronous active-low reset |
| `q`       | 4         | output | 4-bit binary counter value |

## Files Included
- `src/` (contains Verilog source code)
- `testbench/` (contains self-checking testbench)
- `rtl/` (empty, schematic layout directory)
- `waveform/` (empty, simulation waveform directory)
