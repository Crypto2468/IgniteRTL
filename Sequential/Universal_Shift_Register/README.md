# 4-bit Universal Shift Register

## Description
A Universal Shift Register is a bidirectional shift register capable of shifting data left, shifting data right, loading data in parallel, and holding the current state. The operating mode is controlled by the 2-bit `mode[1:0]` input.

## Pin Configuration (Ports)
| Port Name | Bit Width | Type   | Description |
|-----------|-----------|--------|-------------|
| `clk`     | 1         | input  | Clock input |
| `rst_n`   | 1         | input  | Asynchronous active-low reset |
| `mode`    | 2         | input  | Mode select (`00`:Hold, `01`:Shift Right, `10`:Shift Left, `11`:Load) |
| `srin`    | 1         | input  | Serial input for shift right |
| `slin`    | 1         | input  | Serial input for shift left |
| `d`       | 4         | input  | 4-bit parallel data input |
| `q`       | 4         | output | 4-bit register output |

## Truth Table
| Mode (`mode[1:0]`) | Operation | Output Q(t+1) | Description |
|:-----------------:|:---------:|:-------------:|-------------|
|        00         |   Hold    |    Q(t)       | No change |
|        01         | Shift Right | `{srin, Q[3:1]}` | Shift right, MSB gets `srin` |
|        10         | Shift Left  | `{Q[2:0], slin}` | Shift left, LSB gets `slin` |
|        11         |   Load    |    d[3:0]     | Parallel data load |

## Expected Testbench Output
```text
Time=0ns | clk=0 rst_n=0 | mode=00 Q=0000
Time=15ns | clk=1 rst_n=1 | mode=00 Q=0000
Time=25ns | clk=1 rst_n=1 | mode=11 Q=0000
Time=35ns | clk=0 rst_n=1 | mode=11 Q=1101
Time=55ns | clk=1 rst_n=1 | mode=00 Q=1101
Time=75ns | clk=1 rst_n=1 | mode=01 Q=1110
Time=95ns | clk=1 rst_n=1 | mode=01 Q=0111
Time=115ns | clk=1 rst_n=1 | mode=10 Q=1111
```
