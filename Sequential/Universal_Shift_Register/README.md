# 📂 4-bit Universal Shift Register

## 📝 Description
A Universal Shift Register is a bidirectional shift register capable of shifting data left, shifting data right, loading data in parallel, and holding the current state. The operating mode is controlled by the 2-bit `mode[1:0]` input.

## 📋 Truth Table
| Mode (`mode[1:0]`) | Operation | Output Q(t+1) | Description |
|:-----------------:|:---------:|:-------------:|-------------|
|        00         |   Hold    |    Q(t)       | No change |
|        01         | Shift Right | `{srin, Q[3:1]}` | Shift right, MSB gets `srin` |
|        10         | Shift Left  | `{Q[2:0], slin}` | Shift left, LSB gets `slin` |
|        11         |   Load    |    d[3:0]     | Parallel data load |

## 🔹 Module I/O
| Port Name | Bit Width | Type   | Description |
|-----------|-----------|--------|-------------|
| `clk`     | 1         | input  | Clock input |
| `rst_n`   | 1         | input  | Asynchronous active-low reset |
| `mode`    | 2         | input  | Mode select (`00`:Hold, `01`:Shift Right, `10`:Shift Left, `11`:Load) |
| `srin`    | 1         | input  | Serial input for shift right |
| `slin`    | 1         | input  | Serial input for shift left |
| `d`       | 4         | input  | 4-bit parallel data input |
| `q`       | 4         | output | 4-bit register output |

## 📁 Files Included
- `src/` (contains Verilog source code)
- `testbench/` (contains self-checking testbench)
- `rtl/` (empty, schematic layout directory)
- `waveform/` (empty, simulation waveform directory)
