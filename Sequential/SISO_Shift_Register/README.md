# 📂 Serial-In Serial-Out (SISO) Shift Register

## 📝 Description
A Serial-In Serial-Out (SISO) Shift Register is a synchronous sequential circuit that shifts a single data bit into its first stage on each clock edge and outputs the shifted bit from its final stage. It introduces a fixed clock delay for the data (4 clock cycles for a 4-bit register).

## 📋 Truth Table


## 🔹 Module I/O
| Port Name | Bit Width | Type   | Description |
|-----------|-----------|--------|-------------|
| `clk`     | 1         | input  | Clock input |
| `rst_n`   | 1         | input  | Asynchronous active-low reset |
| `si`      | 1         | input  | Serial data input |
| `so`      | 1         | output | Serial data output |

## 📁 Files Included
- `src/` (contains Verilog source code)
- `testbench/` (contains self-checking testbench)
- `rtl/` (empty, schematic layout directory)
- `waveform/` (empty, simulation waveform directory)
