# Full Adder

## Purpose
The Full Adder is a combinational circuit that adds three 1-bit binary digits (two operand bits and one carry-in bit from a previous stage) and outputs a Sum and a Carry-out.

## Features
- **3-bit Addition**: Adds two data inputs (`a`, `b`) and one carry-in input (`cin`).
- **Dataflow Modeling**: Implemented using optimized boolean equations for high performance.
- **Low-Latency**: Direct, parallel gate execution path for minimized critical path delay.

## Inputs
| Port Name | Bit Width | Type | Description |
|-----------|-----------|------|-------------|
| `a`       | 1         | input| First binary input operand |
| `b`       | 1         | input| Second binary input operand |
| `cin`     | 1         | input| Carry-in from previous bit stage |

## Outputs
| Port Name | Bit Width | Type | Description |
|-----------|-----------|------|-------------|
| `sum`     | 1         | output| Least significant bit of addition (Sum) |
| `cout`    | 1         | output| Carry-out to next bit stage |

## Truth Table
| Input `a` | Input `b` | Input `cin` | Output `sum` | Output `cout` |
| :---: | :---: | :---: | :---: | :---: |
|   0   |   0   |   0   |   0   |   0   |
|   0   |   0   |   1   |   1   |   0   |
|   0   |   1   |   0   |   1   |   0   |
|   0   |   1   |   1   |   0   |   1   |
|   1   |   0   |   0   |   1   |   0   |
|   1   |   0   |   1   |   0   |   1   |
|   1   |   1   |   0   |   0   |   1   |
|   1   |   1   |   1   |   1   |   1   |

## Boolean Equations
- $\text{Sum} = a \oplus b \oplus cin$
- $\text{Carry-out (cout)} = (a \cdot b) + (cin \cdot (a \oplus b))$

## Working Principle
- **Sum**: Calculated using a 3-input XOR logic. The output is `1` if there is an odd number of `1` inputs.
- **Carry-out (`cout`)**: Calculated by taking the majority function of the three inputs. It is `1` if at least two inputs are `1`. This output represents the overflow to the next binary column.

## Applications
- Core arithmetic cells in Ripple Carry Adders, Carry Lookahead Adders, and multipliers.
- Part of floating-point arithmetic units.
- Logic units in processors for address and offset calculation.

## Expected Simulation Behaviour
- Sum should toggle high whenever an odd number of inputs are high.
- Cout should toggle high whenever two or three inputs are high.
- Signals propagate with nominal delay.

## Future Improvements
- Chain multiple Full Adders to create multi-bit adder architectures (such as Ripple Carry or Carry Lookahead).
- Design a dynamic logic (e.g., Domino logic) implementation for high-frequency architectures.
