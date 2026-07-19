# NAND-based SR Latch

## Description
An SR (Set-Reset) Latch is a basic level-sensitive 1-bit memory storage element built using cross-coupled NAND gates. In a NAND implementation, the control inputs are active-low (denoted as `s_n` and `r_n`). 

## Pin Configuration (Ports)
| Port Name | Bit Width | Type   | Description |
|-----------|-----------|--------|-------------|
| `s_n`     | 1         | input  | Active-low Set input control line |
| `r_n`     | 1         | input  | Active-low Reset input control line |
| `q`       | 1         | output | Latch output state |
| `q_n`     | 1         | output | Complement output state |

## Logic Symbol Representation
```text
          +---------+
  s_n ----|  NAND   |---- q
  r_n ----|  Latch  |---- q_n
          +---------+
```

## Truth Table
| Input Set (`s_n`) | Input Reset (`r_n`) | Output Q (`q`) | Output Q_n (`q_n`) | Description |
|:----------------:|:------------------:|:-------------:|:-----------------:|-------------|
|        1         |         1          |   No Change   |     No Change     | Hold State  |
|        0         |         1          |       1       |         0         | Set State   |
|        1         |         0          |       0       |         1         | Reset State |
|        0         |         0          |       1       |         1         | Invalid State (Forbidden) |

## Boolean Equations
- $q = \overline{s\_n \cdot q\_n}$
- $q\_n = \overline{r\_n \cdot q}$

## Working Principle
- **Set State**: Asserting the active-low Set line `s_n = 0` (with `r_n = 1`) forces the output of NAND gate 1 `q` high. This high state feeds back to NAND gate 2, maintaining `q_n` low.
- **Hold State**: When both inputs return to idle high (`s_n = 1` and `r_n = 1`), the cross-coupled gate loops hold the previous output state.
- **Reset State**: Asserting the active-low Reset line `r_n = 0` (with `s_n = 1`) forces `q_n` high, which feeds back to NAND gate 1, driving `q` low.
- **Forbidden State**: Driving both inputs low (`s_n = 0` and `r_n = 0`) forces both outputs high (`q = 1` and `q_n = 1`), violating the complementary requirement.

## Expected Testbench Output
```text
Time=0ns | Inputs: S_n=0 R_n=1 | Outputs: Q=1 Q_n=0
Time=10ns | Inputs: S_n=1 R_n=1 | Outputs: Q=1 Q_n=0
Time=20ns | Inputs: S_n=1 R_n=0 | Outputs: Q=0 Q_n=1
Time=30ns | Inputs: S_n=1 R_n=1 | Outputs: Q=0 Q_n=1
Time=40ns | Inputs: S_n=0 R_n=0 | Outputs: Q=1 Q_n=1
```
