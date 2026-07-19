# Carry Select Adder

## Purpose
The Carry Select Adder (CSLA) is a high-speed arithmetic adder that reduces carry propagation delay by performing redundant calculations. It precomputes two sets of sum and carry-out values for a block of bits—one assuming a carry-in of `0` and the other assuming a carry-in of `1`—and selects the correct path using a multiplexer when the actual carry-in arrives.

## Features
- **Parallel Carry-In Execution Paths**: Precomputes both possible carry outcomes to eliminate block-to-block serial carry delays.
- **Uniform 4-bit Blocks**: Structured as two 4-bit stages for a balanced delay profile.
- **Low propagation latency**: Outperforms Ripple Carry Adders for large bit-widths at the expense of a moderate area increase.

## Inputs
| Port Name | Bit Width | Type | Description |
|-----------|-----------|------|-------------|
| `a`       | 8         | input| First 8-bit operand vector |
| `b`       | 8         | input| Second 8-bit operand vector |
| `cin`     | 1         | input| Carry-in input to the LSB block |

## Outputs
| Port Name | Bit Width | Type | Description |
|-----------|-----------|------|-------------|
| `sum`     | 8         | output| 8-bit Sum output vector |
| `cout`    | 1         | output| Carry-out output |

## Working Principle
An $N$-bit CSLA is partitioned into smaller bit blocks. This implementation utilizes an 8-bit adder partitioned into two 4-bit blocks:
1. **Lower Block (Bits 3:0)**: A standard ripple carry structure that takes the primary carry-in `cin` and computes the lower sum `sum[3:0]` and the intermediate carry-out `c4`.
2. **Upper Block (Bits 7:4)**: Contains two parallel adder blocks:
   - **Path 0**: Assumes carry-in is `0`. Computes `sum_high_c0` and `cout_c0`.
   - **Path 1**: Assumes carry-in is `1`. Computes `sum_high_c1` and `cout_c1`.
3. **Multiplexer Stage**: When the lower block finishes computing `c4`, it serves as the select line of a multiplexer:
   - If `c4 == 0`, `sum[7:4] = sum_high_c0` and `cout = cout_c0`.
   - If `c4 == 1`, `sum[7:4] = sum_high_c1` and `cout = cout_c1`.

### Performance vs. Area Trade-off
- **Speed**: The latency of an $M$-bit block CSLA is roughly the delay of one block's addition plus a series of multiplexer delays. This reduces carry latency from $O(N)$ to $O(\sqrt{N})$ when block sizes are optimized dynamically.
- **Area**: Approximately $1.5\times$ to $1.8\times$ the gate count of a Ripple Carry Adder due to duplicate adder logic in the upper blocks.

## Applications
- High-frequency arithmetic circuits in microprocessors.
- Time-critical paths in floating-point operations.
- DSP logic designs where Carry Lookahead Adders exceed target power budgets.

## Expected Simulation Behaviour
- Sum outputs are correct behavioral addition outputs.
- Transitioning the lower block carry `c4` (e.g. from `0x0F + 0x01 = 0x10`) causes the upper bits to instantaneously switch to the precomputed carry-in=1 path.
