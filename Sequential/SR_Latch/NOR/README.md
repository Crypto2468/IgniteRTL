# NOR-based SR Latch

## Description
An SR (Set-Reset) Latch is a basic level-sensitive 1-bit memory storage element built using cross-coupled NOR gates. It has two control inputs: Set (`s`) and Reset (`r`), and two outputs: `q` and `q_n` (complement of Q).

## Pin Configuration (Ports)
| Port Name | Bit Width | Type   | Description |
|-----------|-----------|--------|-------------|
| `s`       | 1         | input  | Set input control line |
| `r`       | 1         | input  | Reset input control line |
| `q`       | 1         | output | Latch output state |
| `q_n`     | 1         | output | Complement output state |

## Logic Symbol Representation
```text
          +---------+
   s -----|   SR    |---- q
   r -----|  Latch  |---- q_n
          +---------+
```

## Truth Table
| Input Set (`s`) | Input Reset (`r`) | Output Q (`q`) | Output Q_n (`q_n`) | Description |
|:--------------:|:----------------:|:-------------:|:-----------------:|-------------|
|       0        |        0         |   No Change   |     No Change     | Hold State  |
|       0        |        1         |       0       |         1         | Reset State |
|       1        |        0         |       1       |         0         | Set State   |
|       1        |        1         |       0       |         0         | Invalid State (Forbidden) |

## Boolean Equations
- $q = \overline{r + q\_n}$
- $q\_n = \overline{s + q}$

## Working Principle
- **Set State**: When `s = 1` and `r = 0`, output `q_n` goes low, which feedback-loops to NOR gate 1, driving `q` high.
- **Hold State**: When both inputs return to `s = 0` and `r = 0`, the latch maintains its current state through cross-coupled gate loop feedback.
- **Reset State**: When `s = 0` and `r = 1`, NOR gate 1 output `q` is pulled low, feeding back to NOR gate 2 to drive `q_n` high.
- **Forbidden State**: When `s = 1` and `r = 1`, both NOR gates outputs are forced low (`q = 0` and `q_n = 0`), which violates the complementary relationship of the outputs.

## Expected Testbench Output
```text
Time=0ns | Inputs: S=1 R=0 | Outputs: Q=1 Q_n=0
Time=10ns | Inputs: S=0 R=0 | Outputs: Q=1 Q_n=0
Time=20ns | Inputs: S=0 R=1 | Outputs: Q=0 Q_n=1
Time=30ns | Inputs: S=0 R=0 | Outputs: Q=0 Q_n=1
Time=40ns | Inputs: S=1 R=1 | Outputs: Q=0 Q_n=0
```
