# ⏱️ 4-bit Ring Counter

## 📝 Description
A Ring Counter is a circular shift register in which the output of the final stage is feedback-routed to the input of the first stage. On reset, it is pre-loaded with a single active bit (`4'b0001`), which then circulates through the register stages continuously.

## 📋 Truth Table


## 🔹 Module I/O
| Port Name | Bit Width | Type   | Description |
|-----------|-----------|--------|-------------|
| `clk`     | 1         | input  | Clock input |
| `rst_n`   | 1         | input  | Asynchronous active-low reset |
| `q`       | 4         | output | 4-bit counter output state |

## 📁 Files Included
- `src/` (contains Verilog source code)
- `testbench/` (contains self-checking testbench)
- `rtl/` (empty, schematic layout directory)
- `waveform/` (empty, simulation waveform directory)
