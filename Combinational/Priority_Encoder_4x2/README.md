# 4x2 Priority Encoder

## Description
A 4x2 Priority Encoder is a combinational logic circuit that takes four input lines (`i0` to `i3`) and encodes them into a 2-bit binary code (`y[1:0]`). Unlike a basic binary encoder, it resolves overlapping input conditions by assigning priority levels. The highest-index input line (`i3`) is assigned the highest priority, and a valid flag (`v`) is generated to indicate if any input is asserted.

## Pin Configuration (Ports)
| Port Name | Bit Width | Type   | Description |
|-----------|-----------|--------|-------------|
| `i0`      | 1         | input  | Input line 0 (Lowest priority) |
| `i1`      | 1         | input  | Input line 1 |
| `i2`      | 1         | input  | Input line 2 |
| `i3`      | 1         | input  | Input line 3 (Highest priority) |
| `y`       | 2         | output | 2-bit encoded binary output (`y[1]`, `y[0]`) |
| `v`       | 1         | output | Valid output flag (high if any input is `1`) |

## Logic Symbol Representation
```text
          +----------+
   i0 ----|          |
   i1 ----| Priority |---- y[1]
   i2 ----| Encoder  |---- y[0]
   i3 ----|          |---- v
          +----------+
```

## Truth Table
| Input `i3` | Input `i2` | Input `i1` | Input `i0` | Output `y[1]` | Output `y[0]` | Valid (`v`) | Description |
|:----------:|:----------:|:----------:|:----------:|:------------:|:------------:|:-----------:|-------------|
|     0      |     0      |     0      |     0      |      0       |      0       |      0      | No active inputs |
|     0      |     0      |     0      |     1      |      0       |      0       |      1      | `i0` is active |
|     0      |     0      |     1      |     X      |      0       |      1       |      1      | `i1` has priority |
|     0      |     1      |     X      |     X      |      1       |      0       |      1      | `i2` has priority |
|     1      |     X      |     X      |     X      |      1       |      1       |      1      | `i3` has highest priority |

*Note: 'X' denotes don't-care values.*

## Boolean Equations
- $y[0] = i3 + i1 \cdot \overline{i2}$
- $y[1] = i3 + i2$
- $v = i3 + i2 + i1 + i0$

## Expected Testbench Output
```text
Time=0ns | Inputs: i3=0 i2=0 i1=0 i0=0 | Outputs: y=00 v=0
Time=10ns | Inputs: i3=0 i2=0 i1=0 i0=1 | Outputs: y=00 v=1
Time=20ns | Inputs: i3=0 i2=0 i1=1 i0=0 | Outputs: y=01 v=1
Time=30ns | Inputs: i3=0 i2=0 i1=1 i0=1 | Outputs: y=01 v=1
Time=40ns | Inputs: i3=0 i2=1 i1=0 i0=1 | Outputs: y=10 v=1
Time=50ns | Inputs: i3=1 i2=1 i1=1 i0=1 | Outputs: y=11 v=1
```
