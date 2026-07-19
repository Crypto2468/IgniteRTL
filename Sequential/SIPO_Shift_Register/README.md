# Serial-In Parallel-Out (SIPO) Shift Register

## Description
A Serial-In Parallel-Out (SIPO) Shift Register shifts serial input data (`si`) into internal flip-flop stages synchronously. All internal stage outputs are presented concurrently as a multi-bit parallel output vector (`po[3:0]`).

## Pin Configuration (Ports)
| Port Name | Bit Width | Type   | Description |
|-----------|-----------|--------|-------------|
| `clk`     | 1         | input  | Clock input |
| `rst_n`   | 1         | input  | Asynchronous active-low reset |
| `si`      | 1         | input  | Serial data input |
| `po`      | 4         | output | 4-bit parallel data output |

## Expected Testbench Output
```text
Time=0ns | clk=0 rst_n=0 | si=0 | po=0000
Time=15ns | clk=1 rst_n=1 | si=0 | po=0000
Time=25ns | clk=1 rst_n=1 | si=1 | po=1000
Time=45ns | clk=1 rst_n=1 | si=1 | po=1100
Time=65ns | clk=1 rst_n=1 | si=0 | po=0110
Time=85ns | clk=1 rst_n=1 | si=1 | po=1011
```
