# Parallel-In Serial-Out (PISO) Shift Register

## Description
A Parallel-In Serial-Out (PISO) Shift Register allows multi-bit parallel data (`pi[3:0]`) to be loaded in a single clock cycle when `load_shift` is high. When `load_shift` is low, the data is shifted out serially one bit at a time via `so`.

## Truth Table


## Module I/O
| Port Name | Bit Width | Type   | Description |
|-----------|-----------|--------|-------------|
| `clk`     | 1         | input  | Clock input |
| `rst_n`   | 1         | input  | Asynchronous active-low reset |
| `load_shift` | 1      | input  | Mode select (1: Parallel Load, 0: Serial Shift) |
| `pi`      | 4         | input  | 4-bit parallel data input |
| `so`      | 1         | output | Serial data output |

## Files Included
- `src/` (contains Verilog source code)
- `testbench/` (contains self-checking testbench)
- `rtl/` (empty, schematic layout directory)
- `waveform/` (empty, simulation waveform directory)
