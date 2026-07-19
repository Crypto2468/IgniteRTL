# 4-bit Asynchronous Up Counter

## Description
An Asynchronous (Ripple) Up Counter is a sequential circuit where each stage's toggle flip-flop is clocked by the complement output (`q_n`) of the preceding stage. This causes changes to ripple through the counter bit by bit, which saves gating logic but introduces cumulative propagation delays.

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
