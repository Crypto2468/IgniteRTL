# 4-bit Magnitude Comparator

## Description
A 4-bit Magnitude Comparator is a combinational logic circuit that compares two 4-bit binary inputs (`a[3:0]` and `b[3:0]`) and outputs three binary status flags indicating if $A = B$ (`a_eq_b`), $A > B$ (`a_gt_b`), or $A < B$ (`a_lt_b`).

## Pin Configuration (Ports)
| Port Name | Bit Width | Type   | Description |
|-----------|-----------|--------|-------------|
| `a`       | 4         | input  | 4-bit binary input A (`a[3]` to `a[0]`) |
| `b`       | 4         | input  | 4-bit binary input B (`b[3]` to `b[0]`) |
| `a_eq_b`  | 1         | output | Active-high Equal flag ($A = B$) |
| `a_gt_b`  | 1         | output | Active-high Greater Than flag ($A > B$) |
| `a_lt_b`  | 1         | output | Active-high Less Than flag ($A < B$) |

## Logic Symbol Representation
```text
          +------------+
   a[3:0] -|   4-bit    |---- a_eq_b
          | Comparator |---- a_gt_b
   b[3:0] -|            |---- a_lt_b
          +------------+
```

## Truth Table Summary
| Comparison Condition | Output `a_gt_b` | Output `a_eq_b` | Output `a_lt_b` |
|:---------------------:|:---------------:|:---------------:|:---------------:|
|         $A = B$       |        0        |        1        |        0        |
|         $A > B$       |        1        |        0        |        0        |
|         $A < B$       |        0        |        0        |        1        |

## Boolean Equations
Let $A = \{a_3, a_2, a_1, a_0\}$ and $B = \{b_3, b_2, b_1, b_0\}$:
- **Equivalence of individual bits**:
  - $x_i = \overline{a_i \oplus b_i}$ (XNOR gate outputs)
- **Outputs**:
  - $\text{a\_eq\_b} = x_3 \cdot x_2 \cdot x_1 \cdot x_0$
  - $\text{a\_gt\_b} = a_3 \cdot \overline{b_3} + x_3 \cdot a_2 \cdot \overline{b_2} + x_3 \cdot x_2 \cdot a_1 \cdot \overline{b_1} + x_3 \cdot x_2 \cdot x_1 \cdot a_0 \cdot \overline{b_0}$
  - $\text{a\_lt\_b} = \overline{a_3} \cdot b_3 + x_3 \cdot \overline{a_2} \cdot b_2 + x_3 \cdot x_2 \cdot \overline{a_1} \cdot b_1 + x_3 \cdot x_2 \cdot x_1 \cdot \overline{a_0} \cdot b_0$

## Expected Testbench Output
```text
Time=0ns | Inputs: a=0 b=0 | Outputs: A=B:1 A>B:0 A<B:0
Time=10ns | Inputs: a=5 b=2 | Outputs: A=B:0 A>B:1 A<B:0
Time=20ns | Inputs: a=3 b=7 | Outputs: A=B:0 A>B:0 A<B:1
Time=30ns | Inputs: a=12 b=12 | Outputs: A=B:1 A>B:0 A<B:0
Time=40ns | Inputs: a=15 b=0 | Outputs: A=B:0 A>B:1 A<B:0
Time=50ns | Inputs: a=0 b=15 | Outputs: A=B:0 A>B:0 A<B:1
Time=60ns | Inputs: a=15 b=15 | Outputs: A=B:1 A>B:0 A<B:0
```
