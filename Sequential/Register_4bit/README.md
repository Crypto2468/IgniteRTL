# 4-bit Register

## Description
A 4-bit Register is a basic sequential memory block consisting of four edge-triggered D flip-flops operating synchronously. It features a load control line (`load`) that dictates whether it updates its contents with the parallel input (`d[3:0]`) or holds the current state.

## Pin Configuration (Ports)
| Port Name | Bit Width | Type   | Description |
|-----------|-----------|--------|-------------|
| `clk`     | 1         | input  | Clock input |
| `rst_n`   | 1         | input  | Asynchronous active-low reset |
| `load`    | 1         | input  | Load control line |
| `d`       | 4         | input  | 4-bit parallel data input |
| `q`       | 4         | output | 4-bit register output |

## Truth Table
| Reset (`rst_n`) | Load (`load`) | Clock | Output Q(t+1) | Description |
|:--------------:|:-------------:|:-----:|:-------------:|-------------|
|       0        |       X       |   X   |    `4'b0000`  | Reset State |
|       1        |       0       |  pos  |    Q(t)       | Hold State  |
|       1        |       1       |  pos  |    d[3:0]     | Load State  |

## Expected Testbench Output
```text
Time=0ns | clk=0 rst_n=0 | load=0 D=0000 | Q=0000
Time=15ns | clk=1 rst_n=1 | load=0 D=0000 | Q=0000
Time=25ns | clk=1 rst_n=1 | load=0 D=1010 | Q=0000
Time=35ns | clk=0 rst_n=1 | load=1 D=1010 | Q=0000
Time=55ns | clk=1 rst_n=1 | load=1 D=1010 | Q=1010
```
