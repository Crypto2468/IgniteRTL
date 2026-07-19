# Serial-In Parallel-Out (SIPO) Shift Register

## Description
A Serial-In Parallel-Out (SIPO) Shift Register shifts serial input data (`si`) into internal flip-flop stages synchronously. All internal stage outputs are presented concurrently as a multi-bit parallel output vector (`po[3:0]`).

## Truth Table


## Module I/O
| Port Name | Bit Width | Type   | Description |
|-----------|-----------|--------|-------------|
| `clk`     | 1         | input  | Clock input |
| `rst_n`   | 1         | input  | Asynchronous active-low reset |
| `si`      | 1         | input  | Serial data input |
| `po`      | 4         | output | 4-bit parallel data output |

## Files Included
- `src/` (contains Verilog source code)
- `testbench/` (contains self-checking testbench)
- `rtl/` (empty, schematic layout directory)
- `waveform/` (empty, simulation waveform directory)
