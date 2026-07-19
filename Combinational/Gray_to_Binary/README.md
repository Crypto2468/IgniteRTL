# Gray to Binary Code Converter

## Description
A Gray to Binary Code Converter is a combinational logic circuit that translates a 4-bit Gray code input (`gray[3:0]`) back into its standard 4-bit binary equivalent (`bin[3:0]`). Gray code is widely used in position encoders, sensors, and asynchronous clock boundary signals, but must be converted back to standard binary to perform normal arithmetic calculations.

## Pin Configuration (Ports)
| Port Name | Bit Width | Type   | Description |
|-----------|-----------|--------|-------------|
| `gray`    | 4         | input  | 4-bit Gray code input |
| `bin`     | 4         | output | 4-bit standard binary output |

## Logic Symbol Representation
```text
          +-----------+
  gray ---|  Gray to  |
  [3:0]   |  Binary   |--- bin
          | Converter |  [3:0]
          +-----------+
```

## Truth Table
| Gray Code Input (`gray[3:0]`) | Binary Output (`bin[3:0]`) | Decimal Equivalent |
|:----------------------------:|:-------------------------:|:------------------:|
|             0000             |           0000            |         0          |
|             0001             |           0001            |         1          |
|             0011             |           0010            |         2          |
|             0010             |           0011            |         3          |
|             0110             |           0100            |         4          |
|             0111             |           0101            |         5          |
|             0101             |           0110            |         6          |
|             0100             |           0111            |         7          |
|             1100             |           1000            |         8          |
|             1101             |           1001            |         9          |
|             1111             |           1010            |        10          |
|             1110             |           1011            |        11          |
|             1010             |           1100            |        12          |
|             1011             |           1101            |        13          |
|             1001             |           1110            |        14          |
|             1000             |           1111            |        15          |

## Boolean Equations
Let $G = \{g_3, g_2, g_1, g_0\}$ represent Gray inputs and $B = \{b_3, b_2, b_1, b_0\}$ represent Binary outputs:
- $b_3 = g_3$
- $b_2 = b_3 \oplus g_2 = g_3 \oplus g_2$
- $b_1 = b_2 \oplus g_1 = g_3 \oplus g_2 \oplus g_1$
- $b_0 = b_1 \oplus g_0 = g_3 \oplus g_2 \oplus g_1 \oplus g_0$

## Expected Testbench Output
```text
Time=0ns | Gray Input=0000 | Binary Output=0000 (0)
Time=10ns | Gray Input=0001 | Binary Output=0001 (1)
Time=20ns | Gray Input=0010 | Binary Output=0011 (3)
Time=30ns | Gray Input=0011 | Binary Output=0010 (2)
Time=40ns | Gray Input=0110 | Binary Output=0100 (4)
Time=50ns | Gray Input=0100 | Binary Output=0111 (7)
Time=60ns | Gray Input=1100 | Binary Output=1000 (8)
Time=70ns | Gray Input=1010 | Binary Output=1100 (12)
Time=80ns | Gray Input=1000 | Binary Output=1111 (15)
```
