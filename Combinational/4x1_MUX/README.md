# 4x1 Multiplexer (4x1 MUX)

## Description
A 4x1 Multiplexer (MUX) is a combinational circuit that selects one of four binary input lines (`i0`, `i1`, `i2`, `i3`) and routes it to a single output line (`y`) based on the binary state of two select lines (`sel[1:0]`).

## Pin Configuration (Ports)
| Port Name | Bit Width | Type   | Description |
|-----------|-----------|--------|-------------|
| `i0`      | 1         | input  | Data input line 0 |
| `i1`      | 1         | input  | Data input line 1 |
| `i2`      | 1         | input  | Data input line 2 |
| `i3`      | 1         | input  | Data input line 3 |
| `sel`     | 2         | input  | 2-bit select lines (`sel[1]`, `sel[0]`) |
| `y`       | 1         | output | Selected data output |

## Logic Symbol Representation
```text
          +-------+
   i0 ----|       |
   i1 ----|  4x1  |---- y
   i2 ----|  MUX  |
   i3 ----|       |
          +-------+
              |
           sel[1:0]
```

## Truth Table
| Select Bits (`sel[1]`, `sel[0]`) | Output (`y`) | Description |
|:--------------------------------:|:------------:|-------------|
|                00                |     `i0`     | Output tracks input `i0` |
|                01                |     `i1`     | Output tracks input `i1` |
|                10                |     `i2`     | Output tracks input `i2` |
|                11                |     `i3`     | Output tracks input `i3` |

## Boolean Equation
$$y = (\overline{sel[1]} \cdot \overline{sel[0]} \cdot i0) + (\overline{sel[1]} \cdot sel[0] \cdot i1) + (sel[1] \cdot \overline{sel[0]} \cdot i2) + (sel[1] \cdot sel[0] \cdot i3)$$

## Expected Testbench Output
```text
Time=0ns | Inputs: i0=1 i1=0 i2=1 i3=0 sel=00 | Output: y=1
Time=10ns | Inputs: i0=1 i1=0 i2=1 i3=0 sel=01 | Output: y=0
Time=20ns | Inputs: i0=1 i1=0 i2=1 i3=0 sel=10 | Output: y=1
Time=30ns | Inputs: i0=1 i1=0 i2=1 i3=0 sel=11 | Output: y=0
Time=40ns | Inputs: i0=1 i1=1 i2=1 i3=0 sel=01 | Output: y=1
Time=50ns | Inputs: i0=1 i1=1 i2=1 i3=1 sel=11 | Output: y=1
```
