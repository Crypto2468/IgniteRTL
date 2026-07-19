# NAND-based SR Flip-Flop

## Description
An SR Flip-Flop is an edge-triggered storage element. This implementation utilizes cross-coupled NAND gates configured in a Master-Slave topology to operate as a positive-edge triggered flip-flop.

## Pin Configuration (Ports)
| Port Name | Bit Width | Type   | Description |
|-----------|-----------|--------|-------------|
| `clk`     | 1         | input  | Clock signal |
| `s`       | 1         | input  | Set input control line |
| `r`       | 1         | input  | Reset input control line |
| `q`       | 1         | output | Flip-flop output state |
| `q_n`     | 1         | output | Complement output state |

## Logic Symbol Representation
```text
          +---------+
   s -----|   SR    |---- q
   clk ---|  Flip  |
   r -----|  Flop   |---- q_n
          +---------+
```

## Truth Table
| Input S | Input R | Clock | Output Q(t+1) | Output Q_n(t+1) | Description |
|:-------:|:-------:|:-----:|:-------------:|:---------------:|-------------|
|    0    |    0    |  pos  |     Q(t)      |     Q_n(t)      | Hold State  |
|    0    |    1    |  pos  |       0       |        1        | Reset State |
|    1    |    0    |  pos  |       1       |        0        | Set State   |
|    1    |    1    |  pos  |   Undefined   |    Undefined    | Invalid     |

## Expected Testbench Output
```text
Time=0ns | clk=0 | S=0 R=0 | Q=x Q_n=x
Time=10ns | clk=1 | S=0 R=0 | Q=x Q_n=x
Time=15ns | clk=1 | S=1 R=0 | Q=x Q_n=x
Time=20ns | clk=0 | S=1 R=0 | Q=x Q_n=x
Time=30ns | clk=1 | S=1 R=0 | Q=1 Q_n=0
Time=35ns | clk=1 | S=0 R=0 | Q=1 Q_n=0
Time=40ns | clk=0 | S=0 R=0 | Q=1 Q_n=0
```
