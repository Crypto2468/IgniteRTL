# Wallace Tree Multiplier

## Purpose
The Wallace Tree Multiplier is a high-speed, purely combinational binary multiplier. It utilizes a Wallace reduction tree composed of Full Adders (acting as 3:2 compressors) and Half Adders (acting as 2:2 compressors) to reduce the partial product matrix to two intermediate vectors in logarithmic $O(\log N)$ stages, which are then summed using a standard adder.

## Features
- **4x4 Multiplier**: Optimized for 4-bit unsigned inputs, producing an 8-bit output.
- **Logarithmic Reduction Latency**: Reduces propagation delay of partial products to $O(\log N)$ instead of the linear $O(N)$ delay of array multipliers.
- **Highly Parallel Structural Layout**: Implemented structural gate logic for minimized logic depth.

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
The Wallace Tree Multiplier operates in three distinct phases:
1. **Partial Product Generation**: Generates 16 partial products ($p_{ij} = a_j \cdot b_i$) using AND gates.
2. **Wallace Reduction Tree**: Operates on columns of partial products to reduce them. A column is reduced by taking groups of 3 bits and running them through Full Adders (outputs a sum bit in the same column, and a carry bit in the next-higher column) and groups of 2 bits through Half Adders. This process is repeated until each column contains at most 2 bits.
   - For a $4\times4$ tree, reduction is completed in a single stage, reducing the maximum column depth from 4 to 2.
3. **Vector Addition Stage**: The remaining two 8-bit vectors ($x$ and $y$) are added together using a fast carry-propagate adder to yield the final product.

### Reduction Delay Comparison
- **Array Multiplier**: Uses a linear array of adders, yielding a critical path delay proportional to $O(N)$.
- **Wallace Tree**: Uses parallel tree reduction, reducing logic depth to $O(\log N)$. For large bit-widths (e.g., $64\times 64$), Wallace reduction is significantly faster.

## Applications
- High-speed DSP filters and multipliers.
- Floating-point processing units (FPUs) in high-performance CPUs and GPUs.
- Floating-point multiplication in machine learning accelerators (TPUs).

## Expected Simulation Behaviour
- The product output combinationally stabilizes to $a \times b$ in a single cycle.
- Tested exhaustively across all 256 inputs.
