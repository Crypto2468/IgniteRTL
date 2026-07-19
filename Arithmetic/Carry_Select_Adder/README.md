# 🔀 Carry Select Adder

## 📝 Description
The Carry Select Adder (CSLA) is a high-speed arithmetic adder that reduces carry propagation delay by performing redundant calculations. It precomputes two sets of sum and carry-out values for a block of bits—one assuming a carry-in of `0` and the other assuming a carry-in of `1`—and selects the correct path using a multiplexer when the actual carry-in arrives.

## 📋 Truth Table


## 🔹 Module I/O
| Port Name | Bit Width | Type | Description |
|-----------|-----------|------|-------------|
| `a`       | 8         | input| First 8-bit operand vector |
| `b`       | 8         | input| Second 8-bit operand vector |
| `cin`     | 1         | input| Carry-in input to the LSB block |
| `sum`     | 8         | output| 8-bit Sum output vector |
| `cout`    | 1         | output| Carry-out output |

## 📁 Files Included
- `src/` (contains Verilog source code)
- `testbench/` (contains self-checking testbench)
- `rtl/` (empty, schematic layout directory)
- `waveform/` (empty, simulation waveform directory)
