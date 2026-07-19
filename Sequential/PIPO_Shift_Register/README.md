# Parallel-In Parallel-Out (PIPO) Shift Register

## Description
A Parallel-In Parallel-Out (PIPO) Register is a synchronous circuit that accepts a multi-bit parallel input vector (`pi[3:0]`) and transfers it simultaneously to the parallel output lines (`po[3:0]`) on the active edge of the clock.

## Pin Configuration (Ports)
| Port Name | Bit Width | Type   | Description |
|-----------|-----------|--------|-------------|
| `clk`     | 1         | input  | Clock input |
| `rst_n`   | 1         | input  | Asynchronous active-low reset |
| `pi`      | 4         | input  | 4-bit parallel data input |
| `po`      | 4         | output | 4-bit parallel data output |

## Expected Testbench Output
```text
Time=0ns | clk=0 rst_n=0 | pi=0000 | po=0000
Time=15ns | clk=1 rst_n=1 | pi=0000 | po=0000
Time=25ns | clk=1 rst_n=1 | pi=1010 | po=1010
Time=45ns | clk=1 rst_n=1 | pi=0101 | po=0101
Time=65ns | clk=1 rst_n=1 | pi=1111 | po=1111
```
