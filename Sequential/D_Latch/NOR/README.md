# NOR-based Gated D Latch

## Description
A D Latch is a level-sensitive storage element. When Enable (`en`) is high, the output `q` tracks the data input `d` (transparent phase). When `en` is low, the output is latched and holds its value (hold phase). This variant uses structural NOR gates.

## Truth Table
| Enable (`en`) | Data (`d`) | Output Q | Output Q_n | Description |
|:-------------:|:----------:|:--------:|:----------:|-------------|
|       0       |     X      |  Hold Q  |  Hold Q_n  | Hold State  |
|       1       |     0      |    0     |     1      | Write 0     |
|       1       |     1      |    1     |     0      | Write 1     |

## Module I/O
| Port Name | Bit Width | Type   | Description |
|-----------|-----------|--------|-------------|
| `d`       | 1         | input  | Data input |
| `en`      | 1         | input  | Active-high enable |
| `q`       | 1         | output | Latch output state |
| `q_n`     | 1         | output | Complement output state |

## Files Included
- `src/` (contains Verilog source code)
- `testbench/` (contains self-checking testbench)
- `rtl/` (empty, schematic layout directory)
- `waveform/` (empty, simulation waveform directory)
