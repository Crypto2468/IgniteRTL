# 4-bit Asynchronous Down Counter

## Description
An Asynchronous (Ripple) Down Counter counts downwards from `15` to `0`. Each stage is clocked by the primary output (`q`) of the preceding stage. On reset, the counter starts at `0` and instantly rolls over to `15` upon the first active clock transition.

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
Time=35ns | clk=1 rst_n=1 | Counter value=15 (1111)
Time=55ns | clk=1 rst_n=1 | Counter value=14 (1110)
Time=75ns | clk=1 rst_n=1 | Counter value=13 (1101)
```
