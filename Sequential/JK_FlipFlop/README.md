# JK Flip-Flop

## Description
A JK Flip-Flop is a universal edge-triggered flip-flop that refines the invalid state of the basic SR flip-flop. When both inputs $J$ and $K$ are high, the output toggles to its complement on the active clock edge.

## Truth Table
| Input J | Input K | Clock | Output Q(t+1) | Description |
|:-------:|:-------:|:-----:|:-------------:|-------------|
|    0    |    0    |  pos  |     Q(t)      | Hold State  |
|    0    |    1    |  pos  |       0       | Reset State |
|    1    |    0    |  pos  |       1       | Set State   |
|    1    |    1    |  pos  |    ~Q(t)      | Toggle State|

## Module I/O
| Port Name | Bit Width | Type   | Description |
|-----------|-----------|--------|-------------|
| `clk`     | 1         | input  | Clock signal |
| `rst`     | 1         | input  | Synchronous reset |
| `j`       | 1         | input  | Jump input control line |
| `k`       | 1         | input  | Kill input control line |
| `q`       | 1         | output | Flip-flop output state |
| `q_n`     | 1         | output | Complement output state |

## Files Included
- `src/` (contains Verilog source code)
- `testbench/` (contains self-checking testbench)
- `rtl/` (empty, schematic layout directory)
- `waveform/` (empty, simulation waveform directory)
