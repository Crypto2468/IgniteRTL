# 4-bit Ring Counter

## Description
A Ring Counter is a circular shift register in which the output of the final stage is feedback-routed to the input of the first stage. On reset, it is pre-loaded with a single active bit (`4'b0001`), which then circulates through the register stages continuously.

## Pin Configuration (Ports)
| Port Name | Bit Width | Type   | Description |
|-----------|-----------|--------|-------------|
| `clk`     | 1         | input  | Clock input |
| `rst_n`   | 1         | input  | Asynchronous active-low reset |
| `q`       | 4         | output | 4-bit counter output state |

## State Sequence
1. `0001`
2. `1000`
3. `0100`
4. `0010`
5. `0001` (repeats)

## Expected Testbench Output
```text
Time=0ns | clk=0 rst_n=0 | Output state: Q=0001
Time=15ns | clk=1 rst_n=1 | Output state: Q=0001
Time=35ns | clk=1 rst_n=1 | Output state: Q=1000
Time=55ns | clk=1 rst_n=1 | Output state: Q=0100
Time=75ns | clk=1 rst_n=1 | Output state: Q=0010
Time=95ns | clk=1 rst_n=1 | Output state: Q=0001
```
