# NOR-based SR Flip-Flop

## Description
An SR Flip-Flop is an edge-triggered storage element. This implementation utilizes cross-coupled NOR gates and logic gates configured in a Master-Slave topology to operate as a positive-edge triggered flip-flop.

## Truth Table
| Input S | Input R | Clock | Output Q(t+1) | Output Q_n(t+1) | Description |
|:-------:|:-------:|:-----:|:-------------:|:---------------:|-------------|
|    0    |    0    |  pos  |     Q(t)      |     Q_n(t)      | Hold State  |
|    0    |    1    |  pos  |       0       |        1        | Reset State |
|    1    |    0    |  pos  |       1       |        0        | Set State   |
|    1    |    1    |  pos  |   Undefined   |    Undefined    | Invalid     |

## Module I/O
| Port Name | Bit Width | Type   | Description |
|-----------|-----------|--------|-------------|
| `clk`     | 1         | input  | Clock signal |
| `s`       | 1         | input  | Set input control line |
| `r`       | 1         | input  | Reset input control line |
| `q`       | 1         | output | Flip-flop output state |
| `q_n`     | 1         | output | Complement output state |

## Files Included
- `src/` (contains Verilog source code)
- `testbench/` (contains self-checking testbench)
- `rtl/` (empty, schematic layout directory)
- `waveform/` (empty, simulation waveform directory)
