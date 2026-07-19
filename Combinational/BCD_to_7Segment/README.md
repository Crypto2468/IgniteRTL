# BCD to 7-Segment Decoder

## Description
A BCD to 7-Segment Decoder is a combinational logic circuit that accepts a 4-bit Binary Coded Decimal (BCD) digit (`0` through `9`) and decodes it into a 7-bit segment control output (`seg[6:0]`) representing segments `{g, f, e, d, c, b, a}`. This output is used to display the numerical character on a standard active-high 7-segment display.

## Truth Table
| BCD Input (`bcd[3:0]`) | Decimal Equivalent | Segments `{g, f, e, d, c, b, a}` |
|:----------------------:|:------------------:|:-------------------------------:|
|          0000          |         0          |             0111111             |
|          0001          |         1          |             0000110             |
|          0010          |         2          |             1011011             |
|          0011          |         3          |             1001111             |
|          0100          |         4          |             1100110             |
|          0101          |         5          |             1101101             |
|          0110          |         6          |             1111101             |
|          0111          |         7          |             0000111             |
|          1000          |         8          |             1111111             |
|          1001          |         9          |             1101111             |
|         Others         |      Invalid       |             0000000 (Blank)     |

## Module I/O
| Port Name | Bit Width | Type   | Description |
|-----------|-----------|--------|-------------|
| `bcd`     | 4         | input  | 4-bit binary input BCD code (`bcd[3]` to `bcd[0]`) |
| `seg`     | 7         | output | 7-bit segment outputs `{g, f, e, d, c, b, a}` |

## Files Included
- `src/` (contains Verilog source code)
- `testbench/` (contains self-checking testbench)
- `rtl/` (empty, schematic layout directory)
- `waveform/` (empty, simulation waveform directory)
