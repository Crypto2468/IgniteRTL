# 4-bit Asynchronous Up Counter

## Description
An Asynchronous (Ripple) Up Counter is a sequential circuit where each stage's toggle flip-flop is clocked by the complement output (`q_n`) of the preceding stage. This causes changes to ripple through the counter bit by bit, which saves gating logic but introduces cumulative propagation delays.

## Pin Configuration (Ports)
| Port Name | Bit Width | Type   | Description |
|-----------|-----------|--------|-------------|
| `clk`     | 1         | input  | Clock input to first stage |
| `rst_n`   | 1         | input  | Asynchronous active-low reset |
| `q`       | 4         | output | 4-bit binary counter value |

## Expected Testbench Output
```text
Time=0ns | clk=0 rst_n=0 | Counter value= 0 (0000)
Time=15ns | clk=1 rst_n=1 | Counter value= 0 (0000)
Time=35ns | clk=1 rst_n=1 | Counter value= 1 (0001)
Time=55ns | clk=1 rst_n=1 | Counter value= 2 (0010)
Time=75ns | clk=1 rst_n=1 | Counter value= 3 (0011)
Time=95ns | clk=1 rst_n=1 | Counter value= 4 (0100)
```
