# 4-bit Synchronous Up/Down Counter

## Description
A 4-bit Synchronous Up/Down Counter counts either upwards or downwards depending on the state of the control line `up_down`. When `up_down` is `1`, it increments; when `up_down` is `0`, it decrements. All stage transitions occur simultaneously on the active clock edge.

## Truth Table


## Module I/O
| Port Name | Bit Width | Type   | Description |
|-----------|-----------|--------|-------------|
| `clk`     | 1         | input  | Clock input |
| `rst_n`   | 1         | input  | Asynchronous active-low reset |
| `up_down` | 1         | input  | Direction control (1: Up, 0: Down) |
| `q`       | 4         | output | 4-bit binary counter output |

## Files Included
- `src/` (contains Verilog source code)
- `testbench/` (contains self-checking testbench)
- `rtl/` (empty, schematic layout directory)
- `waveform/` (empty, simulation waveform directory)
