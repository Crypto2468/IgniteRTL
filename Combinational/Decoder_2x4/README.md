# 2x4 Decoder with Enable

## Description
A 2x4 Decoder is a combinational logic circuit that converts a 2-bit binary input code (`a[1:0]`) into one of four mutually exclusive active outputs (`y0` to `y3`). This module features an active-high Enable line (`en`). When `en` is low, all outputs are forced low regardless of the input.

## Pin Configuration (Ports)
| Port Name | Bit Width | Type   | Description |
|-----------|-----------|--------|-------------|
| `a`       | 2         | input  | 2-bit Binary input code (`a[1]`, `a[0]`) |
| `en`      | 1         | input  | Active-high enable line |
| `y0` to `y3`| 1       | output | Active-high output lines 0 to 3 |

## Logic Symbol Representation
```text
          +---------+
   a[1] --|         |---- y0
   a[0] --|   2x4   |---- y1
          | DECODER |---- y2
   en  --|         |---- y3
          +---------+
```

## Truth Table
| Enable (`en`) | Input `a[1]` | Input `a[0]` | Output `y3` | Output `y2` | Output `y1` | Output `y0` | Description |
|:-------------:|:------------:|:------------:|:-----------:|:-----------:|:-----------:|:-----------:|-------------|
|       0       |      X       |      X       |      0      |      0      |      0      |      0      | Disabled, all outputs 0 |
|       1       |      0       |      0       |      0      |      0      |      0      |      1      | `y0` goes active |
|       1       |      0       |      1       |      0      |      0      |      1      |      0      | `y1` goes active |
|       1       |      1       |      0       |      0      |      1      |      0      |      0      | `y2` goes active |
|       1       |      1       |      1       |      1      |      0      |      0      |      0      | `y3` goes active |

## Boolean Equations
Under the condition `en = 1`:
- $y0 = \overline{a[1]} \cdot \overline{a[0]} \cdot en$
- $y1 = \overline{a[1]} \cdot a[0] \cdot en$
- $y2 = a[1] \cdot \overline{a[0]} \cdot en$
- $y3 = a[1] \cdot a[0] \cdot en$

## Expected Testbench Output
```text
Time=0ns | Inputs: en=0 a=00 | Outputs: y3=0 y2=0 y1=0 y0=0
Time=10ns | Inputs: en=0 a=01 | Outputs: y3=0 y2=0 y1=0 y0=0
Time=20ns | Inputs: en=0 a=10 | Outputs: y3=0 y2=0 y1=0 y0=0
Time=30ns | Inputs: en=0 a=11 | Outputs: y3=0 y2=0 y1=0 y0=0
Time=40ns | Inputs: en=1 a=00 | Outputs: y3=0 y2=0 y1=0 y0=1
Time=50ns | Inputs: en=1 a=01 | Outputs: y3=0 y2=0 y1=1 y0=0
Time=60ns | Inputs: en=1 a=10 | Outputs: y3=0 y2=1 y1=0 y0=0
Time=70ns | Inputs: en=1 a=11 | Outputs: y3=1 y2=0 y1=0 y0=0
```
