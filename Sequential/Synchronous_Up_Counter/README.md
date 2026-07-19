# 4-bit Synchronous Up Counter

## Description
A 4-bit Synchronous Up Counter counts upwards from `0` to `15` synchronously. All flip-flop stages share the same clock input, causing their outputs to transition simultaneously without ripple delays.

## Pin Configuration (Ports)
| Port Name | Bit Width | Type   | Description |
|-----------|-----------|--------|-------------|
| `clk`     | 1         | input  | Clock input |
| `rst_n`   | 1         | input  | Asynchronous active-low reset |
| `q`       | 4         | output | 4-bit binary counter value |

## Expected Testbench Output
```text
Time=0ns | clk=0 rst_n=0 | Counter value= 0
Time=15ns | clk=1 rst_n=1 | Counter value= 0
Time=35ns | clk=1 rst_n=1 | Counter value= 1
Time=55ns | clk=1 rst_n=1 | Counter value= 2
Time=75ns | clk=1 rst_n=1 | Counter value= 3
```
