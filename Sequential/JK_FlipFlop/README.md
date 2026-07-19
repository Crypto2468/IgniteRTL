# JK Flip-Flop

## Description
A JK Flip-Flop is a universal edge-triggered flip-flop that refines the invalid state of the basic SR flip-flop. When both inputs $J$ and $K$ are high, the output toggles to its complement on the active clock edge.

## Pin Configuration (Ports)
| Port Name | Bit Width | Type   | Description |
|-----------|-----------|--------|-------------|
| `clk`     | 1         | input  | Clock signal |
| `rst`     | 1         | input  | Synchronous reset |
| `j`       | 1         | input  | Jump input control line |
| `k`       | 1         | input  | Kill input control line |
| `q`       | 1         | output | Flip-flop output state |
| `q_n`     | 1         | output | Complement output state |

## Truth Table
| Input J | Input K | Clock | Output Q(t+1) | Description |
|:-------:|:-------:|:-----:|:-------------:|-------------|
|    0    |    0    |  pos  |     Q(t)      | Hold State  |
|    0    |    1    |  pos  |       0       | Reset State |
|    1    |    0    |  pos  |       1       | Set State   |
|    1    |    1    |  pos  |    ~Q(t)      | Toggle State|

## Expected Testbench Output
```text
Time=0ns | clk=0 rst=1 | J=0 K=0 | Q=x Q_n=x
Time=10ns | clk=1 rst=1 | J=0 K=0 | Q=0 Q_n=1
Time=15ns | clk=1 rst=0 | J=0 K=0 | Q=0 Q_n=1
Time=30ns | clk=1 rst=0 | J=1 K=0 | Q=1 Q_n=0
Time=50ns | clk=1 rst=0 | J=0 K=0 | Q=1 Q_n=0
Time=70ns | clk=1 rst=0 | J=0 K=1 | Q=0 Q_n=1
Time=90ns | clk=1 rst=0 | J=1 K=1 | Q=1 Q_n=0
Time=110ns | clk=1 rst=0 | J=1 K=1 | Q=0 Q_n=1
```
