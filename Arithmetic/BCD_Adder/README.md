# 🔢 BCD Adder

## 📝 Description
A BCD (Binary Coded Decimal) Adder is a combinational circuit that adds two 4-bit BCD input digits (`a[3:0]` and `b[3:0]`) along with a carry-in (`cin`) and produces a 4-bit BCD sum (`sum[3:0]`) and a carry-out bit (`cout`).

## 📋 Truth Table


## 🔹 Module I/O
| Port Name | Bit Width | Type   | Description |
|-----------|-----------|--------|-------------|
| `a`       | 4         | input  | 4-bit BCD input digit A (0-9) |
| `b`       | 4         | input  | 4-bit BCD input digit B (0-9) |
| `cin`     | 1         | input  | Carry-in signal |
| `sum`     | 4         | output | 4-bit BCD sum digit output (0-9) |
| `cout`    | 1         | output | BCD Carry-out signal (high if sum exceeds 9) |

## 📁 Files Included
- `src/` (contains Verilog source code)
- `testbench/` (contains self-checking testbench)
- `rtl/` (empty, schematic layout directory)
- `waveform/` (empty, simulation waveform directory)
