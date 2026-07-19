# Carry Bypass Adder

## Purpose
The Carry Bypass Adder (CBA) is a multi-bit combinational adder designed for high-performance addition. It reduces carry propagation latency by dividing a 16-bit word length into four 4-bit stages and utilizing bypass multiplexers to route carry-in inputs directly around blocks when all stage propagate bits are active.

## Features
- **16-bit Word Length**: Configured as a 16-bit adder using four 4-bit blocks.
- **Cascaded Bypass Paths**: Shows how bypass multiplexers connect in series to form a rapid multi-stage carry bypass network.
- **Low area overhead**: Balances the performance benefits of lookahead structures with the low area of ripple adders.

## Inputs
| Port Name | Bit Width | Type | Description |
|-----------|-----------|------|-------------|
| `a`       | 16        | input| First 16-bit input vector |
| `b`       | 16        | input| Second 16-bit input vector |
| `cin`     | 1         | input| Carry-in input |

## Outputs
| Port Name | Bit Width | Type | Description |
|-----------|-----------|------|-------------|
| `sum`     | 16        | output| 16-bit Sum output vector |
| `cout`    | 1         | output| Carry-out output |

## Working Principle
The Carry Bypass Adder uses the bit-wise propagate signal $p_i = a_i \oplus b_i$. 
It partitions the 16-bit word length into four 4-bit blocks:
- **Block 0 (bits 3:0)**: Computes sum and checks if all bits propagate ($P_{\text{block0}} = p_0 \cdot p_1 \cdot p_2 \cdot p_3$). The carry-out is:
  $$c_4 = (P_{\text{block0}}) ? cin : c_{\text{ripple\_b0}}[4]$$
- **Block 1 (bits 7:4)**: Receives $c_4$ as carry-in. The carry-out is:
  $$c_8 = (P_{\text{block1}}) ? c_4 : c_{\text{ripple\_b1}}[4]$$
- **Block 2 (bits 11:8)**: Receives $c_8$ as carry-in. The carry-out is:
  $$c_{12} = (P_{\text{block2}}) ? c_8 : c_{\text{ripple\_b2}}[4]$$
- **Block 3 (bits 15:12)**: Receives $c_{12}$ as carry-in. The final carry-out is:
  $$cout = (P_{\text{block3}}) ? c_{12} : c_{\text{ripple\_b3}}[4]$$

If a carry must propagate from the first bit to the last bit, it skips all four blocks via a rapid chain of four 2-to-1 multiplexers, dramatically reducing delay compared to a 16-bit Ripple Carry Adder.

## Applications
- High-order integer addition pipelines.
- Arithmetic registers.
- Low-power DSP units.

## Expected Simulation Behaviour
- Sum outputs are correct behavioral addition outputs.
- When `a ^ b == 16'hFFFF`, changing `cin` propagates to `cout` almost instantaneously through the bypass multiplexers, skipping the ripple adder delays.
