# 8x1 Multiplexer (8x1 MUX)

## Description
An 8x1 Multiplexer (MUX) is a combinational circuit that selects one of eight binary input lines (`i0` to `i7`) and routes it to a single output line (`y`) based on the binary state of three select lines (`sel[2:0]`).

## Pin Configuration (Ports)
| Port Name | Bit Width | Type   | Description |
|-----------|-----------|--------|-------------|
| `i0` to `i7`| 1       | input  | Data input lines 0 to 7 |
| `sel`     | 3         | input  | 3-bit select lines (`sel[2]`, `sel[1]`, `sel[0]`) |
| `y`       | 1         | output | Selected data output |

## Logic Symbol Representation
```text
          +-------+
   i0 ----|       |
   i1 ----|       |
   i2 ----|  8x1  |
   i3 ----|  MUX  |---- y
   i4 ----|       |
   i5 ----|       |
   i6 ----|       |
   i7 ----|       |
          +-------+
              |
           sel[2:0]
```

## Truth Table
| Select Bits (`sel[2:0]`) | Output (`y`) | Description |
|:------------------------:|:------------:|-------------|
|           000            |     `i0`     | Output tracks input `i0` |
|           001            |     `i1`     | Output tracks input `i1` |
|           010            |     `i2`     | Output tracks input `i2` |
|           011            |     `i3`     | Output tracks input `i3` |
|           100            |     `i4`     | Output tracks input `i4` |
|           101            |     `i5`     | Output tracks input `i5` |
|           110            |     `i6`     | Output tracks input `i6` |
|           111            |     `i7`     | Output tracks input `i7` |

## Boolean Equation
$$y = \overline{s_2}\ \overline{s_1}\ \overline{s_0}\ i_0 + \overline{s_2}\ \overline{s_1}\ s_0\ i_1 + \overline{s_2}\ s_1\ \overline{s_0}\ i_2 + \overline{s_2}\ s_1\ s_0\ i_3 + s_2\ \overline{s_1}\ \overline{s_0}\ i_4 + s_2\ \overline{s_1}\ s_0\ i_5 + s_2\ s_1\ \overline{s_0}\ i_6 + s_2\ s_1\ s_0\ i_7$$
where $s_i$ represents `sel[i]`.

## Expected Testbench Output
```text
Time=0ns | Inputs: i0=0 i1=1 i2=0 i3=1 i4=0 i5=1 i6=0 i7=1 sel=000 | Output: y=0
Time=10ns | Inputs: i0=0 i1=1 i2=0 i3=1 i4=0 i5=1 i6=0 i7=1 sel=001 | Output: y=1
Time=20ns | Inputs: i0=0 i1=1 i2=0 i3=1 i4=0 i5=1 i6=0 i7=1 sel=010 | Output: y=0
Time=30ns | Inputs: i0=0 i1=1 i2=0 i3=1 i4=0 i5=1 i6=0 i7=1 sel=011 | Output: y=1
Time=40ns | Inputs: i0=0 i1=1 i2=0 i3=1 i4=0 i5=1 i6=0 i7=1 sel=100 | Output: y=0
Time=50ns | Inputs: i0=0 i1=1 i2=0 i3=1 i4=0 i5=1 i6=0 i7=1 sel=101 | Output: y=1
Time=60ns | Inputs: i0=0 i1=1 i2=0 i3=1 i4=0 i5=1 i6=0 i7=1 sel=110 | Output: y=0
Time=70ns | Inputs: i0=0 i1=1 i2=0 i3=1 i4=0 i5=1 i6=0 i7=1 sel=111 | Output: y=1
```
