# 1x2 Demultiplexer (1x2 DEMUX)

## Description
A 1x2 Demultiplexer (DEMUX) is a combinational logic circuit that routes a single binary input data signal (`i`) to one of two binary output channels (`y0`, `y1`) depending on the binary state of a select line (`sel`).

## Pin Configuration (Ports)
| Port Name | Bit Width | Type   | Description |
|-----------|-----------|--------|-------------|
| `i`       | 1         | input  | Data input line |
| `sel`     | 1         | input  | Select control line |
| `y0`      | 1         | output | Output line 0 |
| `y1`      | 1         | output | Output line 1 |

## Logic Symbol Representation
```text
          +---------+
          |         |---- y0
   i -----|   1x2   |
          |  DEMUX  |---- y1
          +---------+
               |
              sel
```

## Truth Table
| Input (`i`) | Select (`sel`) | Output `y1` | Output `y0` | Description |
|:-----------:|:--------------:|:-----------:|:-----------:|-------------|
|      0      |       0        |      0      |      0      | `y0` gets `i` (0) |
|      1      |       0        |      0      |      1      | `y0` gets `i` (1) |
|      0      |       1        |      0      |      0      | `y1` gets `i` (0) |
|      1      |       1        |      1      |      0      | `y1` gets `i` (1) |

## Boolean Equations
- $y0 = \overline{sel} \cdot i$
- $y1 = sel \cdot i$

## Working Principle
- When `sel = 0`: Output `y0` gets the value of input `i` ($y0 = 1 \cdot i = i$), while output `y1` is forced to logic `0` ($y1 = 0 \cdot i = 0$).
- When `sel = 1`: Output `y1` gets the value of input `i` ($y1 = 1 \cdot i = i$), while output `y0` is forced to logic `0` ($y0 = 0 \cdot i = 0$).

## Expected Testbench Output
```text
Time=0ns | Inputs: i=0 sel=0 | Outputs: y0=0 y1=0
Time=10ns | Inputs: i=1 sel=0 | Outputs: y0=1 y1=0
Time=20ns | Inputs: i=1 sel=1 | Outputs: y0=0 y1=1
Time=30ns | Inputs: i=0 sel=1 | Outputs: y0=0 y1=0
```
