# Full Subtractor

## Purpose
The Full Subtractor is a combinational logic circuit that performs subtraction on three 1-bit inputs: minuend (`a`), subtrahend (`b`), and borrow-in (`bin`) from a previous stage. It outputs a Difference and a Borrow-out.

## Features
- **3-bit Subtraction**: Subtracts `b` and `bin` from `a`.
- **Dataflow Modeling**: Modeled with continuous assignment for efficient digital synthesis.
- **Low propagation delay**: Optimized parallel expression path.

## Inputs
| Port Name | Bit Width | Type | Description |
|-----------|-----------|------|-------------|
| `a`       | 1         | input| Minuend input |
| `b`       | 1         | input| Subtrahend input (to be subtracted from `a`) |
| `bin`     | 1         | input| Borrow-in from previous stage |

## Outputs
| Port Name | Bit Width | Type | Description |
|-----------|-----------|------|-------------|
| `diff`    | 1         | output| Difference output ($a - b - bin$) |
| `bout`    | 1         | output| Borrow-out output |

## Truth Table
| Input `a` | Input `b` | Input `bin` | Output `diff` | Output `bout` |
| :---: | :---: | :---: | :---: | :---: |
|   0   |   0   |   0   |   0   |   0   |
|   0   |   0   |   1   |   1   |   1   |
|   0   |   1   |   0   |   1   |   1   |
|   0   |   1   |   1   |   0   |   1   |
|   1   |   0   |   0   |   1   |   0   |
|   1   |   0   |   1   |   0   |   0   |
|   1   |   1   |   0   |   0   |   0   |
|   1   |   1   |   1   |   1   |   1   |

## Boolean Equations
- $\text{Difference (diff)} = a \oplus b \oplus bin$
- $\text{Borrow-out (bout)} = (\bar{a} \cdot b) + (\bar{a} \cdot bin) + (b \cdot bin)$

## Working Principle
- **Difference (`diff`)**: Implemented using a 3-input XOR operator. The logic is identical to a Full Adder's sum because binary addition and subtraction share the same XOR parity check.
- **Borrow-out (`bout`)**: Implemented using negated `a` gates. The borrow bit is high when the total sum of `b + bin` is greater than the input `a`. This indicates that the current column has insufficient value and must borrow from the next higher-order bit.

## Applications
- ALU subtraction blocks in central processing units.
- Sign detection and comparison logic.
- Floating-point subtraction blocks.

## Expected Simulation Behaviour
- Difference output should follow XOR parity logic.
- Borrow-out output should trigger high when minuend `a` is smaller than subtrahends `b + bin`.

## Future Improvements
- Chain multiple Full Subtractors to implement multi-bit subtraction.
- Optimize using dynamic logic families.
