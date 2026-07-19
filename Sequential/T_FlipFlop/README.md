# 🎚️ T Flip-Flop

## 📝 Description
A T (Toggle) Flip-Flop is an edge-triggered storage element. When the toggle input `t` is high, the output state changes (`q <= ~q`) at the active clock edge. When `t` is low, the output holds its current state.

## 📋 Truth Table
| Reset (`rst_n`) | Clock (`clk`) | Toggle (`t`) | Output Q(t+1) | Description |
|:--------------:|:-------------:|:------------:|:-------------:|-------------|
|       0        |       X       |      X       |       0       | Reset State |
|       1        |    posedge    |      0       |     Q(t)      | Hold State  |
|       1        |    posedge    |      1       |    ~Q(t)      | Toggle State|

## 🔹 Module I/O
| Port Name | Bit Width | Type   | Description |
|-----------|-----------|--------|-------------|
| `clk`     | 1         | input  | Clock input |
| `rst_n`   | 1         | input  | Asynchronous active-low reset |
| `t`       | 1         | input  | Toggle control line |
| `q`       | 1         | output | Output Q |
| `q_n`     | 1         | output | Complement output Q_n |

## 📁 Files Included
- `src/` (contains Verilog source code)
- `testbench/` (contains self-checking testbench)
- `rtl/` (empty, schematic layout directory)
- `waveform/` (empty, simulation waveform directory)
