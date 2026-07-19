# 1x4 Demultiplexer (1x4 DEMUX)

## Description
A 1x4 Demultiplexer (DEMUX) is a combinational logic circuit that routes a single binary input signal (`i`) to one of four binary output channels (`y0` to `y3`) depending on the binary state of two select lines (`sel[1:0]`).

## Pin Configuration (Ports)
| Port Name | Bit Width | Type   | Description |
|-----------|-----------|--------|-------------|
| `i`       | 1         | input  | Data input line |
| `sel`     | 2         | input  | 2-bit select lines (`sel[1]`, `sel[0]`) |
| `y0` to `y3`| 1       | output | Output lines 0 to 3 |

## Logic Symbol Representation
```text
          +---------+
          |         |---- y0
          |   1x4   |---- y1
   i -----|  DEMUX  |---- y2
          |         |---- y3
          +---------+
               |
            sel[1:0]
```

## Truth Table
| Input (`i`) | Select (`sel[1]`, `sel[0]`) | Output `y3` | Output `y2` | Output `y1` | Output `y0` | Description |
|:-----------:|:--------------------------:|:-----------:|:-----------:|:-----------:|:-----------:|-------------|
|      1      |             00             |      0      |      0      |      0      |      1      | `y0` gets `i` |
|      1      |             01             |      0      |      0      |      1      |      0      | `y1` gets `i` |
|      1      |             10             |      0      |      1      |      0      |      0      | `y2` gets `i` |
|      1      |             11             |      1      |      0      |      0      |      0      | `y3` gets `i` |
|      0      |             XX             |      0      |      0      |      0      |      0      | All outputs `0` |

## Boolean Equations
- $y0 = \overline{sel[1]} \cdot \overline{sel[0]} \cdot i$
- $y1 = \overline{sel[1]} \cdot sel[0] \cdot i$
- $y2 = sel[1] \cdot \overline{sel[0]} \cdot i$
- $y3 = sel[1] \cdot sel[0] \cdot i$

## Working Principle
- When `sel = 00`: Output `y0` gets `i`, while `y1`, `y2`, and `y3` are forced to `0`.
- When `sel = 01`: Output `y1` gets `i`, while `y0`, `y2`, and `y3` are forced to `0`.
- When `sel = 10`: Output `y2` gets `i`, while `y0`, `y1`, and `y3` are forced to `0`.
- When `sel = 11`: Output `y3` gets `i`, while `y0`, `y1`, and `y2` are forced to `0`.

## Expected Testbench Output
```text
Time=0ns | Inputs: i=1 sel=00 | Outputs: y3=0 y2=0 y1=0 y0=1
Time=10ns | Inputs: i=1 sel=01 | Outputs: y3=0 y2=0 y1=1 y0=0
Time=20ns | Inputs: i=1 sel=10 | Outputs: y3=0 y2=1 y1=0 y0=0
Time=30ns | Inputs: i=1 sel=11 | Outputs: y3=1 y2=0 y1=0 y0=0
Time=40ns | Inputs: i=0 sel=00 | Outputs: y3=0 y2=0 y1=0 y0=0
Time=50ns | Inputs: i=0 sel=01 | Outputs: y3=0 y2=0 y1=0 y0=0
Time=60ns | Inputs: i=0 sel=10 | Outputs: y3=0 y2=0 y1=0 y0=0
Time=70ns | Inputs: i=0 sel=11 | Outputs: y3=0 y2=0 y1=0 y0=0
```
