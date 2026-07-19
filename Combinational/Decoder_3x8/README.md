# 3x8 Decoder with Enable

## Description
A 3x8 Decoder is a combinational logic circuit that decodes a 3-bit binary input code (`a[2:0]`) into one of eight mutually exclusive active-high outputs (`y0` to `y7`). This module features an active-high Enable pin (`en`). When `en` is low, all outputs are forced low regardless of the input.

## Pin Configuration (Ports)
| Port Name | Bit Width | Type   | Description |
|-----------|-----------|--------|-------------|
| `a`       | 3         | input  | 3-bit Binary input code (`a[2]`, `a[1]`, `a[0]`) |
| `en`      | 1         | input  | Active-high enable line |
| `y0` to `y7`| 1       | output | Active-high output lines 0 to 7 |

## Logic Symbol Representation
```text
          +---------+
   a[2] --|         |---- y0
   a[1] --|         |---- y1
   a[0] --|   3x8   |---- y2
          | DECODER |---- y3
   en  --|         |---- y4
          |         |---- y5
          |         |---- y6
          |         |---- y7
          +---------+
```

## Truth Table
| Enable (`en`) | Inputs (`a[2]`, `a[1]`, `a[0]`) | Output Active | Description |
|:-------------:|:-----------------------------:|:-------------:|-------------|
|       0       |              XXX              |     None      | All outputs are low |
|       1       |              000              |     `y0`      | `y0` is high |
|       1       |              001              |     `y1`      | `y1` is high |
|       1       |              010              |     `y2`      | `y2` is high |
|       1       |              011              |     `y3`      | `y3` is high |
|       1       |              100              |     `y4`      | `y4` is high |
|       1       |              101              |     `y5`      | `y5` is high |
|       1       |              110              |     `y6`      | `y6` is high |
|       1       |              111              |     `y7`      | `y7` is high |

## Boolean Equations
Under the condition `en = 1`:
- $y_0 = \overline{a_2} \cdot \overline{a_1} \cdot \overline{a_0} \cdot en$
- $y_1 = \overline{a_2} \cdot \overline{a_1} \cdot a_0 \cdot en$
- $y_2 = \overline{a_2} \cdot a_1 \cdot \overline{a_0} \cdot en$
- $y_3 = \overline{a_2} \cdot a_1 \cdot a_0 \cdot en$
- $y_4 = a_2 \cdot \overline{a_1} \cdot \overline{a_0} \cdot en$
- $y_5 = a_2 \cdot \overline{a_1} \cdot a_0 \cdot en$
- $y_6 = a_2 \cdot a_1 \cdot \overline{a_0} \cdot en$
- $y_7 = a_2 \cdot a_1 \cdot a_0 \cdot en$

## Expected Testbench Output
```text
Time=0ns | Inputs: en=0 a=000 | Outputs: y7=0 y6=0 y5=0 y4=0 y3=0 y2=0 y1=0 y0=0
Time=10ns | Inputs: en=0 a=111 | Outputs: y7=0 y6=0 y5=0 y4=0 y3=0 y2=0 y1=0 y0=0
Time=20ns | Inputs: en=1 a=000 | Outputs: y7=0 y6=0 y5=0 y4=0 y3=0 y2=0 y1=0 y0=1
Time=30ns | Inputs: en=1 a=001 | Outputs: y7=0 y6=0 y5=0 y4=0 y3=0 y2=0 y1=1 y0=0
Time=40ns | Inputs: en=1 a=010 | Outputs: y7=0 y6=0 y5=0 y4=0 y3=0 y2=1 y1=0 y0=0
...
Time=90ns | Inputs: en=1 a=111 | Outputs: y7=1 y6=0 y5=0 y4=0 y3=0 y2=0 y1=0 y0=0
```
