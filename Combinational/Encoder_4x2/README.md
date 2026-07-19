# 4x2 Binary Encoder

## Description
A 4x2 Binary Encoder is a combinational logic circuit that performs the reverse operation of a decoder. It takes four binary input lines (`i0` to `i3`) and generates a 2-bit binary output code (`y[1:0]`) representing the active input line, assuming only one input line is active (high) at any given time.

## Pin Configuration (Ports)
| Port Name | Bit Width | Type   | Description |
|-----------|-----------|--------|-------------|
| `i0`      | 1         | input  | Input line 0 |
| `i1`      | 1         | input  | Input line 1 |
| `i2`      | 1         | input  | Input line 2 |
| `i3`      | 1         | input  | Input line 3 |
| `y`       | 2         | output | 2-bit encoded binary output (`y[1]`, `y[0]`) |

## Logic Symbol Representation
```text
          +---------+
   i0 ----|         |
   i1 ----|   4x2   |---- y[1]
   i2 ----| ENCODER |---- y[0]
   i3 ----|         |
          +---------+
```

## Truth Table
| Input `i3` | Input `i2` | Input `i1` | Input `i0` | Output `y[1]` | Output `y[0]` | Description |
|:----------:|:----------:|:----------:|:----------:|:------------:|:------------:|-------------|
|     0      |     0      |     0      |     1      |      0       |      0       | encodes `i0` |
|     0      |     0      |     1      |     0      |      0       |      1       | encodes `i1` |
|     0      |     1      |     0      |     0      |      1       |      0       | encodes `i2` |
|     1      |     0      |     0      |     0      |      1       |      1       | encodes `i3` |

## Boolean Equations
- $y[0] = i1 + i3$
- $y[1] = i2 + i3$
(Under the assumption that only one input is high at a time).

## Working Principle
The encoder monitors the input lines. When one input line is asserted high, it sets the output pins `y[1]` and `y[0]` to the corresponding binary value. For instance, if `i2` is high (`4'b0100`), the outputs are set to `1` and `0` respectively, representing binary `2` ($10_2$).

## Expected Testbench Output
```text
Time=0ns | Inputs: i3=0 i2=0 i1=0 i0=1 | Output: y=00
Time=10ns | Inputs: i3=0 i2=0 i1=1 i0=0 | Output: y=01
Time=20ns | Inputs: i3=0 i2=1 i1=0 i0=0 | Output: y=10
Time=30ns | Inputs: i3=1 i2=0 i1=0 i0=0 | Output: y=11
Time=40ns | Inputs: i3=0 i2=0 i1=0 i0=0 | Output: y=00
```
