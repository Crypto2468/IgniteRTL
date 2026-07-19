# T Flip-Flop

## Description
A T (Toggle) Flip-Flop is an edge-triggered storage element. When the toggle input `t` is high, the output state changes (`q <= ~q`) at the active clock edge. When `t` is low, the output holds its current state.

## Pin Configuration (Ports)
| Port Name | Bit Width | Type   | Description |
|-----------|-----------|--------|-------------|
| `clk`     | 1         | input  | Clock input |
| `rst_n`   | 1         | input  | Asynchronous active-low reset |
| `t`       | 1         | input  | Toggle control line |
| `q`       | 1         | output | Output Q |
| `q_n`     | 1         | output | Complement output Q_n |

## Truth Table
| Reset (`rst_n`) | Clock (`clk`) | Toggle (`t`) | Output Q(t+1) | Description |
|:--------------:|:-------------:|:------------:|:-------------:|-------------|
|       0        |       X       |      X       |       0       | Reset State |
|       1        |    posedge    |      0       |     Q(t)      | Hold State  |
|       1        |    posedge    |      1       |    ~Q(t)      | Toggle State|

## Expected Testbench Output
```text
Time=0ns | clk=0 rst_n=0 | T=0 | Q=0 Q_n=1
Time=15ns | clk=1 rst_n=1 | T=0 | Q=0 Q_n=1
Time=25ns | clk=1 rst_n=1 | T=1 | Q=0 Q_n=1
Time=30ns | clk=0 rst_n=1 | T=1 | Q=0 Q_n=1
Time=50ns | clk=1 rst_n=1 | T=1 | Q=1 Q_n=0
Time=70ns | clk=1 rst_n=1 | T=1 | Q=0 Q_n=1
```
