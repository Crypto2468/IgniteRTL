# ⏱️ 4-bit Synchronous Down Counter

## 📝 Description
A 4-bit Synchronous Down Counter counts downwards from `15` to `0` synchronously. All stages transition concurrently on the active clock edge. On reset, the counter starts at `0` and rolls over to `15` at the first clock edge.

## 📋 Truth Table


## 🔹 Module I/O
| Port Name | Bit Width | Type   | Description |
|-----------|-----------|--------|-------------|
| `clk`     | 1         | input  | Clock input |
| `rst_n`   | 1         | input  | Asynchronous active-low reset |
| `q`       | 4         | output | 4-bit binary counter value |

## 📁 Files Included
- `src/` (contains Verilog source code)
- `testbench/` (contains self-checking testbench)
- `rtl/` (empty, schematic layout directory)
- `waveform/` (empty, simulation waveform directory)
