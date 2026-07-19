# NOR-based Gated D Latch

## Description
A D Latch is a level-sensitive storage element. When Enable (`en`) is high, the output `q` tracks the data input `d` (transparent phase). When `en` is low, the output is latched and holds its value (hold phase). This variant uses structural NOR gates.

## Pin Configuration (Ports)
| Port Name | Bit Width | Type   | Description |
|-----------|-----------|--------|-------------|
| `d`       | 1         | input  | Data input |
| `en`      | 1         | input  | Active-high enable |
| `q`       | 1         | output | Latch output state |
| `q_n`     | 1         | output | Complement output state |

## Truth Table
| Enable (`en`) | Data (`d`) | Output Q | Output Q_n | Description |
|:-------------:|:----------:|:--------:|:----------:|-------------|
|       0       |     X      |  Hold Q  |  Hold Q_n  | Hold State  |
|       1       |     0      |    0     |     1      | Write 0     |
|       1       |     1      |    1     |     0      | Write 1     |

## Expected Testbench Output
```text
Time=0ns | Inputs: en=0 D=1 | Outputs: Q=x Q_n=x
Time=10ns | Inputs: en=0 D=0 | Outputs: Q=x Q_n=x
Time=20ns | Inputs: en=1 D=1 | Outputs: Q=1 Q_n=0
Time=30ns | Inputs: en=1 D=0 | Outputs: Q=0 Q_n=1
Time=40ns | Inputs: en=1 D=1 | Outputs: Q=1 Q_n=0
Time=50ns | Inputs: en=0 D=0 | Outputs: Q=1 Q_n=0
```
