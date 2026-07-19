# 📂 Parallel-In Parallel-Out (PIPO) Shift Register

## 📝 Description
A Parallel-In Parallel-Out (PIPO) Register is a synchronous circuit that accepts a multi-bit parallel input vector (`pi[3:0]`) and transfers it simultaneously to the parallel output lines (`po[3:0]`) on the active edge of the clock.

## 📋 Truth Table


## 🔹 Module I/O
| Port Name | Bit Width | Type   | Description |
|-----------|-----------|--------|-------------|
| `clk`     | 1         | input  | Clock input |
| `rst_n`   | 1         | input  | Asynchronous active-low reset |
| `pi`      | 4         | input  | 4-bit parallel data input |
| `po`      | 4         | output | 4-bit parallel data output |

## 📁 Files Included
- `src/` (contains Verilog source code)
- `testbench/` (contains self-checking testbench)
- `rtl/` (empty, schematic layout directory)
- `waveform/` (empty, simulation waveform directory)
