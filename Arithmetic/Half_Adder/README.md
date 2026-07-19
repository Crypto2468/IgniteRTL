# ➕ Half Adder

## 📝 Description
The Half Adder is a fundamental combinational arithmetic circuit that performs the addition of two 1-bit binary numbers. It is the building block of all binary addition architectures.

## 📋 Truth Table
| Input `a` | Input `b` | Output `sum` | Output `co` |
| :---: | :---: | :---: | :---: |
|   0   |   0   |   0   |   0   |
|   0   |   1   |   1   |   0   |
|   1   |   0   |   1   |   0   |
|   1   |   1   |   0   |   1   |

## 🔹 Module I/O
| Port Name | Bit Width | Type | Description |
|-----------|-----------|------|-------------|
| `a`       | 1         | input| First binary input operand |
| `b`       | 1         | input| Second binary input operand |
| `sum`     | 1         | output| Least significant bit of addition (Sum) |
| `co`      | 1         | output| Most significant bit of addition (Carry-out) |

## 📁 Files Included
- `src/` (contains Verilog source code)
- `testbench/` (contains self-checking testbench)
- `rtl/` (empty, schematic layout directory)
- `waveform/` (empty, simulation waveform directory)
