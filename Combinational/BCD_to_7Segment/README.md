# BCD to 7-Segment Decoder

## Description
A BCD to 7-Segment Decoder is a combinational logic circuit that accepts a 4-bit Binary Coded Decimal (BCD) digit (`0` through `9`) and decodes it into a 7-bit segment control output (`seg[6:0]`) representing segments `{g, f, e, d, c, b, a}`. This output is used to display the numerical character on a standard active-high 7-segment display.

## Pin Configuration (Ports)
| Port Name | Bit Width | Type   | Description |
|-----------|-----------|--------|-------------|
| `bcd`     | 4         | input  | 4-bit binary input BCD code (`bcd[3]` to `bcd[0]`) |
| `seg`     | 7         | output | 7-bit segment outputs `{g, f, e, d, c, b, a}` |

## 7-Segment Display Layout
```text
      --- a ---
     |         |
     f         b
     |         |
      --- g ---
     |         |
     e         c
     |         |
      --- d ---
```

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

## Expected Testbench Output
```text
Time=0ns | BCD Input: 0 (0000) | 7-Segment Output {g,f,e,d,c,b,a}: 0111111
Time=10ns | BCD Input: 1 (0001) | 7-Segment Output {g,f,e,d,c,b,a}: 0000110
Time=20ns | BCD Input: 2 (0010) | 7-Segment Output {g,f,e,d,c,b,a}: 1011011
Time=30ns | BCD Input: 3 (0011) | 7-Segment Output {g,f,e,d,c,b,a}: 1001111
Time=40ns | BCD Input: 4 (0100) | 7-Segment Output {g,f,e,d,c,b,a}: 1100110
Time=50ns | BCD Input: 5 (0101) | 7-Segment Output {g,f,e,d,c,b,a}: 1101101
Time=60ns | BCD Input: 6 (0110) | 7-Segment Output {g,f,e,d,c,b,a}: 1111101
Time=70ns | BCD Input: 7 (0111) | 7-Segment Output {g,f,e,d,c,b,a}: 0000111
Time=80ns | BCD Input: 8 (1000) | 7-Segment Output {g,f,e,d,c,b,a}: 1111111
Time=90ns | BCD Input: 9 (1001) | 7-Segment Output {g,f,e,d,c,b,a}: 1101111
Time=100ns | BCD Input: 12 (1100) | 7-Segment Output {g,f,e,d,c,b,a}: 0000000
```
