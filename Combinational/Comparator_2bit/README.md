# 2-bit Magnitude Comparator

## Description
A 2-bit Magnitude Comparator is a combinational logic circuit that compares two 2-bit binary inputs (`a[1:0]` and `b[1:0]`) and determines their relative magnitude. It outputs three status signals: Equal (`a_eq_b`), Greater Than (`a_gt_b`), and Less Than (`a_lt_b`).

## Pin Configuration (Ports)
| Port Name | Bit Width | Type   | Description |
|-----------|-----------|--------|-------------|
| `a`       | 2         | input  | 2-bit binary input A (`a[1]`, `a[0]`) |
| `b`       | 2         | input  | 2-bit binary input B (`b[1]`, `b[0]`) |
| `a_eq_b`  | 1         | output | Active-high Equal flag ($A = B$) |
| `a_gt_b`  | 1         | output | Active-high Greater Than flag ($A > B$) |
| `a_lt_b`  | 1         | output | Active-high Less Than flag ($A < B$) |

## Logic Symbol Representation
```text
          +------------+
   a[1] --|            |
   a[0] --|   2-bit    |---- a_eq_b
          | Comparator |---- a_gt_b
   b[1] --|            |---- a_lt_b
   b[0] --+------------+
```

## Truth Table Summary
| Comparison Condition | Output `a_gt_b` | Output `a_eq_b` | Output `a_lt_b` |
|:---------------------:|:---------------:|:---------------:|:---------------:|
|         $A = B$       |        0        |        1        |        0        |
|         $A > B$       |        1        |        0        |        0        |
|         $A < B$       |        0        |        0        |        1        |

## Boolean Equations
Let $A = \{a_1, a_0\}$ and $B = \{b_1, b_0\}$:
- **Equivalence of individual bits**:
  - $x_1 = \overline{a_1 \oplus b_1}$
  - $x_0 = \overline{a_0 \oplus b_0}$
- **Outputs**:
  - $\text{a\_eq\_b} = x_1 \cdot x_0$
  - $\text{a\_gt\_b} = a_1 \cdot \overline{b_1} + x_1 \cdot a_0 \cdot \overline{b_0}$
  - $\text{a\_lt\_b} = \overline{a_1} \cdot b_1 + x_1 \cdot \overline{a_0} \cdot b_0$

## Expected Testbench Output
```text
Time=0ns | Inputs: a=0 b=0 | Outputs: A=B:1 A>B:0 A<B:0
Time=10ns | Inputs: a=1 b=0 | Outputs: A=B:0 A>B:1 A<B:0
Time=20ns | Inputs: a=0 b=2 | Outputs: A=B:0 A>B:0 A<B:1
Time=30ns | Inputs: a=2 b=2 | Outputs: A=B:1 A>B:0 A<B:0
Time=40ns | Inputs: a=3 b=1 | Outputs: A=B:0 A>B:1 A<B:0
Time=50ns | Inputs: a=1 b=3 | Outputs: A=B:0 A>B:0 A<B:1
Time=60ns | Inputs: a=3 b=3 | Outputs: A=B:1 A>B:0 A<B:0
```
