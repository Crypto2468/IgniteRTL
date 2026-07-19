# Binary to Gray Code Converter

## Description
A Binary to Gray Code Converter is a combinational logic circuit that converts a standard 4-bit binary number (`bin[3:0]`) into its equivalent 4-bit Gray code representation (`gray[3:0]`). Gray code is an unweighted code where two successive values differ by only one bit, which is useful in error correction and clock domain crossings (such as in asynchronous FIFOs).

## Pin Configuration (Ports)
| Port Name | Bit Width | Type   | Description |
|-----------|-----------|--------|-------------|
| `bin`     | 4         | input  | 4-bit standard binary input |
| `gray`    | 4         | output | 4-bit Gray code output |

## Logic Symbol Representation
```text
          +-----------+
   bin ---| Binary to |
  [3:0]   | Gray Code |--- gray
          | Converter |  [3:0]
          +-----------+
```

## Truth Table
| Binary Input (`bin[3:0]`) | Decimal Value | Gray Code Output (`gray[3:0]`) |
|:------------------------:|:-------------:|:-----------------------------:|
|           0000           |       0       |             0000              |
|           0001           |       1       |             0001              |
|           0010           |       2       |             0011              |
|           0011           |       3       |             0010              |
|           0100           |       4       |             0110              |
|           0101           |       5       |             0111              |
|           0110           |       6       |             0101              |
|           0111           |       7       |             0100              |
|           1000           |       8       |             1100              |
|           1001           |       9       |             1101              |
|           1010           |      10       |             1111              |
|           1011           |      11       |             1110              |
|           1100           |      12       |             1010              |
|           1101           |      13       |             1011              |
|           1110           |      14       |             1001              |
|           1111           |      15       |             1000              |

## Boolean Equations
- $gray[3] = bin[3]$
- $gray[2] = bin[3] \oplus bin[2]$
- $gray[1] = bin[2] \oplus bin[1]$
- $gray[0] = bin[1] \oplus bin[0]$

## Expected Testbench Output
```text
Time=0ns | Binary Input=0000 (0) | Gray Output=0000
Time=10ns | Binary Input=0001 (1) | Gray Output=0001
Time=20ns | Binary Input=0010 (2) | Gray Output=0011
Time=30ns | Binary Input=0011 (3) | Gray Output=0010
Time=40ns | Binary Input=0100 (4) | Gray Output=0110
Time=50ns | Binary Input=0111 (7) | Gray Output=0100
Time=60ns | Binary Input=1000 (8) | Gray Output=1100
Time=70ns | Binary Input=1100 (12) | Gray Output=1010
Time=80ns | Binary Input=1111 (15) | Gray Output=1000
```
