# 4-bit Register

## Description
A 4-bit Register is a basic sequential memory block consisting of four edge-triggered D flip-flops operating synchronously. It features a load control line (`load`) that dictates whether it updates its contents with the parallel input (`d[3:0]`) or holds the current state.

## Truth Table
| Reset (`rst_n`) | Load (`load`) | Clock | Output Q(t+1) | Description |
|:--------------:|:-------------:|:-----:|:-------------:|-------------|
|       0        |       X       |   X   |    `4'b0000`  | Reset State |
|       1        |       0       |  pos  |    Q(t)       | Hold State  |
|       1        |       1       |  pos  |    d[3:0]     | Load State  |

## Module I/O
| Port Name | Bit Width | Type   | Description |
|-----------|-----------|--------|-------------|
| `clk`     | 1         | input  | Clock input |
| `rst_n`   | 1         | input  | Asynchronous active-low reset |
| `load`    | 1         | input  | Load control line |
| `d`       | 4         | input  | 4-bit parallel data input |
| `q`       | 4         | output | 4-bit register output |

## Files Included
- `src/` (contains Verilog source code)
- `testbench/` (contains self-checking testbench)
- `rtl/` (empty, schematic layout directory)
- `waveform/` (empty, simulation waveform directory)
