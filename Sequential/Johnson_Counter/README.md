# 4-bit Johnson Counter

## Description
A Johnson Counter (also known as a switch-tail or twisted ring counter) is a circular shift register where the inverted output of the final stage is fed back as input to the first stage. This doubles the number of states relative to a standard ring counter ($2N$ states for $N$ stages).

## Pin Configuration (Ports)
| Port Name | Bit Width | Type   | Description |
|-----------|-----------|--------|-------------|
| `clk`     | 1         | input  | Clock input |
| `rst_n`   | 1         | input  | Asynchronous active-low reset |
| `q`       | 4         | output | 4-bit counter output state |

## State Sequence
1. `0000`
2. `1000`
3. `1100`
4. `1110`
5. `1111`
6. `0111`
7. `0011`
8. `0001`
9. `0000` (repeats)

## Expected Testbench Output
```text
Time=0ns | clk=0 rst_n=0 | Output state: Q=0000
Time=15ns | clk=1 rst_n=1 | Output state: Q=0000
Time=35ns | clk=1 rst_n=1 | Output state: Q=1000
Time=55ns | clk=1 rst_n=1 | Output state: Q=1100
Time=75ns | clk=1 rst_n=1 | Output state: Q=1110
Time=95ns | clk=1 rst_n=1 | Output state: Q=1111
Time=115ns | clk=1 rst_n=1 | Output state: Q=0111
Time=135ns | clk=1 rst_n=1 | Output state: Q=0011
Time=155ns | clk=1 rst_n=1 | Output state: Q=0001
Time=175ns | clk=1 rst_n=1 | Output state: Q=0000
```
