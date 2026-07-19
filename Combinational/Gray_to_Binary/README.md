# Gray to Binary Code Converter

## Description
A Gray to Binary Code Converter is a combinational logic circuit that translates a 4-bit Gray code input (`gray[3:0]`) back into its standard 4-bit binary equivalent (`bin[3:0]`). Gray code is widely used in position encoders, sensors, and asynchronous clock boundary signals, but must be converted back to standard binary to perform normal arithmetic calculations.

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

## Module I/O
| Port Name | Bit Width | Type   | Description |
|-----------|-----------|--------|-------------|
| `gray`    | 4         | input  | 4-bit Gray code input |
| `bin`     | 4         | output | 4-bit standard binary output |

## Files Included
- `src/` (contains Verilog source code)
- `testbench/` (contains self-checking testbench)
- `rtl/` (empty, schematic layout directory)
- `waveform/` (empty, simulation waveform directory)
