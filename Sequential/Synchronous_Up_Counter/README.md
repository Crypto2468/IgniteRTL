# 4-bit Synchronous Up Counter

## Description
A 4-bit Synchronous Up Counter counts upwards from `0` to `15` synchronously. All flip-flop stages share the same clock input, causing their outputs to transition simultaneously without ripple delays.

## Truth Table


## Module I/O
| Port Name | Bit Width | Type   | Description |
|-----------|-----------|--------|-------------|
| `clk`     | 1         | input  | Clock input |
| `rst_n`   | 1         | input  | Asynchronous active-low reset |
| `q`       | 4         | output | 4-bit binary counter value |

## Files Included
- `src/` (contains Verilog source code)
- `testbench/` (contains self-checking testbench)
- `rtl/` (empty, schematic layout directory)
- `waveform/` (empty, simulation waveform directory)
