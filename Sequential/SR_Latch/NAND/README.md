# NAND-based SR Latch

## Description
An SR (Set-Reset) Latch is a basic level-sensitive 1-bit memory storage element built using cross-coupled NAND gates. In a NAND implementation, the control inputs are active-low (denoted as `s_n` and `r_n`).

## Truth Table
| Input Set (`s_n`) | Input Reset (`r_n`) | Output Q (`q`) | Output Q_n (`q_n`) | Description |
|:----------------:|:------------------:|:-------------:|:-----------------:|-------------|
|        1         |         1          |   No Change   |     No Change     | Hold State  |
|        0         |         1          |       1       |         0         | Set State   |
|        1         |         0          |       0       |         1         | Reset State |
|        0         |         0          |       1       |         1         | Invalid State (Forbidden) |

## Module I/O
| Port Name | Bit Width | Type   | Description |
|-----------|-----------|--------|-------------|
| `s_n`     | 1         | input  | Active-low Set input control line |
| `r_n`     | 1         | input  | Active-low Reset input control line |
| `q`       | 1         | output | Latch output state |
| `q_n`     | 1         | output | Complement output state |

## Files Included
- `src/` (contains Verilog source code)
- `testbench/` (contains self-checking testbench)
- `rtl/` (empty, schematic layout directory)
- `waveform/` (empty, simulation waveform directory)
