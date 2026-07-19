# 🎚️ NOR-based SR Latch

## 📝 Description
An SR (Set-Reset) Latch is a basic level-sensitive 1-bit memory storage element built using cross-coupled NOR gates. It has two control inputs: Set (`s`) and Reset (`r`), and two outputs: `q` and `q_n` (complement of Q).

## 📋 Truth Table
| Input Set (`s`) | Input Reset (`r`) | Output Q (`q`) | Output Q_n (`q_n`) | Description |
|:--------------:|:----------------:|:-------------:|:-----------------:|-------------|
|       0        |        0         |   No Change   |     No Change     | Hold State  |
|       0        |        1         |       0       |         1         | Reset State |
|       1        |        0         |       1       |         0         | Set State   |
|       1        |        1         |       0       |         0         | Invalid State (Forbidden) |

## 🔹 Module I/O
| Port Name | Bit Width | Type   | Description |
|-----------|-----------|--------|-------------|
| `s`       | 1         | input  | Set input control line |
| `r`       | 1         | input  | Reset input control line |
| `q`       | 1         | output | Latch output state |
| `q_n`     | 1         | output | Complement output state |

## 📁 Files Included
- `src/` (contains Verilog source code)
- `testbench/` (contains self-checking testbench)
- `rtl/` (empty, schematic layout directory)
- `waveform/` (empty, simulation waveform directory)
