# 🎚️ D Flip-Flop with Asynchronous Reset

## 📝 Description
A D (Data) Flip-Flop is an edge-triggered memory element that captures the value of the D input at the rising edge of the clock. This design features an active-low asynchronous reset (`rst_n`), which is standard practice in digital design.

## 📋 Truth Table
| Reset (`rst_n`) | Clock (`clk`) | Data (`d`) | Output Q(t+1) | Output Q_n(t+1) |
|:--------------:|:-------------:|:----------:|:-------------:|:---------------:|
|       0        |       X       |     X      |       0       |        1        |
|       1        |    posedge    |     0      |       0       |        1        |
|       1        |    posedge    |     1      |       1       |        0        |
|       1        |    stable     |     X      |     Q(t)      |     Q_n(t)      |

## 🔹 Module I/O
| Port Name | Bit Width | Type   | Description |
|-----------|-----------|--------|-------------|
| `clk`     | 1         | input  | Clock input |
| `rst_n`   | 1         | input  | Asynchronous active-low reset |
| `d`       | 1         | input  | Data input |
| `q`       | 1         | output | Output Q |
| `q_n`     | 1         | output | Complement output Q_n |

## 📁 Files Included
- `src/` (contains Verilog source code)
- `testbench/` (contains self-checking testbench)
- `rtl/` (empty, schematic layout directory)
- `waveform/` (empty, simulation waveform directory)
