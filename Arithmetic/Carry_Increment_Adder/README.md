# Carry Increment Adder

## Purpose
The Carry Increment Adder (CIA) is an optimized high-speed combinational adder designed to reduce the hardware area overhead of Carry Select Adders while maintaining high speed. It computes additions assuming a carry-in of `0` and then increments the sum conditionally using a half-adder chain when the actual carry-in arrives.

## Features
- **Area-Efficient Dual-Path Alternative**: Replaces the second adder block of a Carry Select Adder (CSLA) with simple half-adder incrementer stages.
- **Decoupled Carry Paths**: Allows addition of higher order blocks to run in parallel with lower order blocks.
- **Low Area Overhead**: Slices gate count by up to 30% compared to equivalent Carry Select designs.

## Inputs
| Port Name | Bit Width | Type | Description |
|-----------|-----------|------|-------------|
| `a`       | 8         | input| First 8-bit operand vector |
| `b`       | 8         | input| Second 8-bit operand vector |
| `cin`     | 1         | input| Carry-in input |

## Outputs
| Port Name | Bit Width | Type | Description |
|-----------|-----------|------|-------------|
| `sum`     | 8         | output| 8-bit Sum output vector |
| `cout`    | 1         | output| Carry-out output |

## Working Principle
The 8-bit Carry Increment Adder is divided into two 4-bit blocks:
1. **Lower Block (Bits 3:0)**: A standard ripple carry adder that evaluates the lower sum bits `sum[3:0]` and the intermediate carry `c4`.
2. **Upper Block (Bits 7:4)**: Performs the addition of `a[7:4]` and `b[7:4]` with a hardwired carry-in of `0`, producing raw outputs `sum_high_raw` and `c_high_raw[4]`.
3. **Incrementer Block**: When the carry-out `c4` from the lower block is resolved:
   - If `c4 == 0`, the upper sum remains `sum_high_raw`.
   - If `c4 == 1`, `sum_high_raw` is incremented by 1 using a ripple half-adder chain.
   - The final carry-out `cout` is the logical OR of the raw carry-out and the incrementer's carry-out:
     $$\text{cout} = c_{\text{high\_raw}}[4] \mid \text{inc\_carry}[3]$$

### Area & Delay Analysis
- **Area**: A CSLA requires two 4-bit adders for the upper block. A CIA requires only one 4-bit adder and a 4-bit half-adder chain, saving gates.
- **Delay**: The critical path delay is equal to the delay of the lower block addition plus the serial propagation delay of the half-adder increment chain.

## Applications
- Area-constrained, high-speed ALUs in DSPs.
- Low-power floating-point units.
- Address generators in DMA controllers.

## Expected Simulation Behaviour
- Sum outputs are correct behavioral addition outputs.
- Transitioning the lower block carry `c4` causes the upper bits to update via the half-adder incrementer path.
