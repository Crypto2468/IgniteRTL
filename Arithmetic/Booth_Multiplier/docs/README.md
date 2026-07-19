# Booth Multiplier (Signed Radix-2 Multiplier)

## Purpose
The Booth Multiplier is a sequential digital arithmetic module that computes the signed $2N$-bit product of two $N$-bit signed numbers (in two's complement form) using Radix-2 Booth's multiplication algorithm.

## Features
- **Parameterized Width**: Supports any bit-width via the `WIDTH` parameter.
- **Two's Complement signed support**: Performs native signed multiplication directly without converting numbers to positive values and then modifying the final sign bit.
- **Optimized shift registers**: Implements an combined accumulator-multiplier shifting structure.

## Inputs
| Port Name | Bit Width | Type | Description |
|-----------|-----------|------|-------------|
| `clk`     | 1         | input| System Clock |
| `rst_n`   | 1         | input| Active-low asynchronous reset |
| `start`   | 1         | input| Starts multiplication |
| `a`       | `WIDTH`   | input| Multiplicand signed vector |
| `b`       | `WIDTH`   | input| Multiplier signed vector |

## Outputs
| Port Name | Bit Width | Type | Description |
|-----------|-----------|------|-------------|
| `product` | `2*WIDTH` | output| Registered signed product vector |
| `ready`   | 1         | output| Active-high indicating multiplier is ready for inputs |
| `done`    | 1         | output| Active-high pulse indicating computation completed |

## Working Principle
Booth's algorithm works by grouping bits in the multiplier to reduce the number of addition steps. For a Radix-2 implementation, it looks at pairs of adjacent bits:
- **Encoding Truth Table**:
  Let the current multiplier bit be $Q[0]$ and the previous bit be $Q_{-1}$ (initialized to `0`):
  | $Q[0]$ | $Q_{-1}$ | Action | Explanation |
  | :---: | :---: | :---: | :---: |
  |   0   |   0   | None | Shift only |
  |   0   |   1   | Add | Accumulator $\leftarrow$ Accumulator + Multiplicand, then shift |
  |   1   |   0   | Subtract | Accumulator $\leftarrow$ Accumulator - Multiplicand, then shift |
  |   1   |   1   | None | Shift only |

### FSM States:
1. **IDLE**: The multiplier stands ready (`ready=1`, `done=0`). When `start` transitions high, operands are stored in `a_reg` and `q_reg`, `accum` is cleared, and `q_minus_one` is reset.
2. **MULT**: In each clock cycle, the FSM checks `{q_reg[0], q_minus_one}`:
   - Evaluates the addition or subtraction, producing `next_accum`.
   - Performs a 1-bit arithmetic right shift of the combined register `{accum, q_reg, q_minus_one}` to keep the sign extension.
   - Increment cycle counter. If cycle count reaches `WIDTH`, transitions to `DONE`.
3. **DONE**: Registers the final accumulator-multiplier state into the output `product` and asserts `done`.

## Applications
- DSP hardware units executing signed convolutions or matrix multiplication.
- Floating-point mantissa multiplication blocks.
- Embedded controller hardware multipliers.

## Expected Simulation Behaviour
- Under active simulation, the sign bit of the product will be correctly extended according to standard two's complement sign conventions.
- Latency is constant at $N+1$ clock cycles.
