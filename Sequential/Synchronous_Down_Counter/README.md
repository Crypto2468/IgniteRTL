# 4-bit Synchronous Down Counter

## Description
A 4-bit Synchronous Down Counter counts downwards from `15` to `0` synchronously. All stages transition concurrently on the active clock edge. On reset, the counter starts at `0` and rolls over to `15` at the first clock edge.

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
Time=35ns | clk=1 rst_n=1 | Counter value=15
Time=55ns | clk=1 rst_n=1 | Counter value=14
Time=75ns | clk=1 rst_n=1 | Counter value=13
```
