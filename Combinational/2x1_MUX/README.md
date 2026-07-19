# 2x1 Multiplexer (2x1 MUX)

## Description
A 2x1 Multiplexer (MUX) is a combinational logic circuit that selects one of two binary input channels and routes it to a single output line based on the state of a select input.

## Pin Configuration (Ports)
| Port Name | Bit Width | Type   | Description |
|-----------|-----------|--------|-------------|
| `i0`      | 1         | input  | Data input line 0 |
| `i1`      | 1         | input  | Data input line 1 |
| `sel`     | 1         | input  | Select control line |
| `y`       | 1         | output | Selected data output |

## Logic Symbol Representation
```text
          +-------+
   i0 ----|       |
          |  2x1  |---- y
   i1 ----|  MUX  |
          +-------+
              |
             sel
```

## Truth Table
| Select (`sel`) | Output (`y`) | Description |
|:--------------:|:------------:|-------------|
|       0        |     `i0`     | Output tracks input `i0` |
|       1        |     `i1`     | Output tracks input `i1` |

## Boolean Equation
$$y = (\overline{sel} \cdot i0) + (sel \cdot i1)$$

## Working Principle
- When `sel = 0`: The logic equation simplifies to $y = 1 \cdot i0 + 0 \cdot i1 = i0$. Thus, whatever binary value is present on `i0` is passed directly to the output `y`.
- When `sel = 1`: The logic equation simplifies to $y = 0 \cdot i0 + 1 \cdot i1 = i1$. Thus, the value present on `i1` is passed to the output `y`.

## Expected Testbench Output
The testbench applies combinations of inputs and select lines to verify the routing path. You should see the following outputs in your simulator console:
```text
Time=0ns | Inputs: i0=0 i1=0 sel=0 | Output: y=0
Time=10ns | Inputs: i0=1 i1=0 sel=0 | Output: y=1
Time=20ns | Inputs: i0=0 i1=1 sel=0 | Output: y=0
Time=30ns | Inputs: i0=0 i1=1 sel=1 | Output: y=1
Time=40ns | Inputs: i0=1 i1=0 sel=1 | Output: y=0
Time=50ns | Inputs: i0=1 i1=1 sel=1 | Output: y=1
```
