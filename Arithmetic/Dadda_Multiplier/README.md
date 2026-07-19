# Dadda Multiplier

## Purpose
The Dadda Multiplier is a high-speed, purely combinational binary multiplier. It utilizes a Dadda carry-save reduction tree composed of Full Adders and Half Adders to compress the partial product matrix to two intermediate vectors. Unlike the Wallace Tree, Dadda reduction compresses columns only to the threshold defined by the Dadda sequence, minimizing the number of adder cells and routing complexity.

## Features
- **4x4 Multiplier**: Formulated for 4-bit unsigned inputs, producing an 8-bit output.
- **Dadda Sequence Optimization**: Reduces columns systematically (4 $\rightarrow$ 3 $\rightarrow$ 2) to minimize gate counts.
- **Minimized Area**: Requires fewer adders than an equivalent Wallace Tree.

## Inputs
| Port Name | Bit Width | Type | Description |
|-----------|-----------|------|-------------|
| `a`       | 4         | input| 4-bit input operand A |
| `b`       | 4         | input| 4-bit input operand B |

## Outputs
| Port Name | Bit Width | Type | Description |
|-----------|-----------|------|-------------|
| `product` | 8         | output| 8-bit Product output vector ($a \times b$) |

## Working Principle
Dadda's algorithm differs from Wallace's algorithm by postponing reduction steps. The columns are only reduced to match the heights in the Dadda sequence:
$$\{d\} = 2, 3, 4, 6, 8, 12, 16, 24, 32, 48, 64 \dots$$
For a $4\times 4$ multiplier, the maximum column height is 4. The reduction steps are:
1. **Stage 1 (Max Height 3)**:
   - Identify columns with more than 3 elements (Column 3 has 4 elements, Column 4 has 3).
   - Use a Half Adder on Column 3 to reduce it to 3. Its carry-out propagates to Column 4 (height becomes 4).
   - Use a Half Adder on Column 4 to reduce it to 3. Its carry-out propagates to Column 5 (height becomes 3).
   - Now all columns have a height of 3 or less.
2. **Stage 2 (Max Height 2)**:
   - Compress all columns with height 3 to height 2 using Full Adders.
   - Now all columns have a height of 2 or less.
3. **Vector Addition**:
   - The remaining two vectors are added using a standard carry-propagate adder to get the final 8-bit product.

### Wallace vs. Dadda Comparison
- **Gate Count**: Dadda multipliers generally require fewer adder cells than Wallace multipliers because reduction is performed only when a column height exceeds the next sequence value.
- **Speed**: Both have the same theoretical critical path delay ($O(\log N)$ stages), but Dadda's routing is slightly less complex due to fewer intermediate adders.

## Applications
- High-performance ALU arithmetic systems.
- Float and integer DSP engines.
- Custom neural network accelerators where low gate area is vital.

## Expected Simulation Behaviour
- The product combinationally resolves to $a \times b$ in a single cycle.
- Checked exhaustively across all 256 inputs.
