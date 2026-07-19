# 1-bit Magnitude Comparator

## Description
A 1-bit Magnitude Comparator is a combinational logic circuit that compares two single-bit binary inputs (`a` and `b`) and determines their relative magnitude relationship. It generates three active-high status outputs: Equal (`a_eq_b`), Greater Than (`a_gt_b`), and Less Than (`a_lt_b`).

## Pin Configuration (Ports)
| Port Name | Bit Width | Type   | Description |
|-----------|-----------|--------|-------------|
| `a`       | 1         | input  | 1-bit binary input A |
| `b`       | 1         | input  | 1-bit binary input B |
| `a_eq_b`  | 1         | output | Active-high Equal flag ($A = B$) |
| `a_gt_b`  | 1         | output | Active-high Greater Than flag ($A > B$) |
| `a_lt_b`  | 1         | output | Active-high Less Than flag ($A < B$) |

## Logic Symbol Representation
```text
          +------------+
   a -----|   1-bit    |---- a_eq_b
   b -----| Comparator |---- a_gt_b
          |            |---- a_lt_b
          +------------+
```

## Truth Table
| Input `a` | Input `b` | Output `a_gt_b` | Output `a_eq_b` | Output `a_lt_b` | Description |
|:---------:|:---------:|:---------------:|:---------------:|:---------------:|-------------|
|     0     |     0     |        0        |        1        |        0        | $A$ is equal to $B$ |
|     0     |     1     |        0        |        0        |        1        | $A$ is less than $B$ |
|     1     |     0     |        1        |        0        |        0        | $A$ is greater than $B$ |
|     1     |     1     |        0        |        1        |        0        | $A$ is equal to $B$ |

## Boolean Equations
- $\text{a\_eq\_b} = \overline{a \oplus b}$ (XNOR gate)
- $\text{a\_gt\_b} = a \cdot \overline{b}$
- $\text{a\_lt\_b} = \overline{a} \cdot b$

## Expected Testbench Output
```text
Time=0ns | Inputs: a=0 b=0 | Outputs: A=B:1 A>B:0 A<B:0
Time=10ns | Inputs: a=0 b=1 | Outputs: A=B:0 A>B:0 A<B:1
Time=20ns | Inputs: a=1 b=0 | Outputs: A=B:0 A>B:1 A<B:0
Time=30ns | Inputs: a=1 b=1 | Outputs: A=B:1 A>B:0 A<B:0
```
