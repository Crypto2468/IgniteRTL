# 🔄 Binary to Gray Code Converter

## 📝 Description
A Binary to Gray Code Converter is a combinational logic circuit that converts a standard 4-bit binary number (`bin[3:0]`) into its equivalent 4-bit Gray code representation (`gray[3:0]`). Gray code is an unweighted code where two successive values differ by only one bit, which is useful in error correction and clock domain crossings (such as in asynchronous FIFOs).

## 📋 Truth Table
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

## 🔹 Module I/O
| Port Name | Bit Width | Type   | Description |
|-----------|-----------|--------|-------------|
| `bin`     | 4         | input  | 4-bit standard binary input |
| `gray`    | 4         | output | 4-bit Gray code output |

## 📁 Files Included
- `src/` (contains Verilog source code)
- `testbench/` (contains self-checking testbench)
- `rtl/` (empty, schematic layout directory)
- `waveform/` (empty, simulation waveform directory)
