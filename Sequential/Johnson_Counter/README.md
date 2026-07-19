# ⏱️ 4-bit Johnson Counter

## 📝 Description
A Johnson Counter (also known as a switch-tail or twisted ring counter) is a circular shift register where the inverted output of the final stage is fed back as input to the first stage. This doubles the number of states relative to a standard ring counter ($2N$ states for $N$ stages).

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
