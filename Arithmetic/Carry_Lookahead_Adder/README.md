# Carry Lookahead Adder

## Purpose
The Carry Lookahead Adder (CLA) is a high-speed combinational binary adder that reduces carry propagation delay by computing carry signals in parallel. It calculates carry bits prior to the sum calculations using specialized propagate and generate equations.

## Features
- **Parallel Carry Calculation**: Eliminates the serial $O(N)$ carry chain delay, reducing worst-case delay to $O(\log N)$ or $O(1)$ for fixed-width blocks.
- **Hierarchical Hooks**: Outputs Block Propagate (`pg`) and Block Generate (`gg`) pins to allow cascading multiple 4-bit blocks into 16-bit or 64-bit multi-block CLA systems.
- **Synthesizable Verilog-2001**: Implemented using dataflow logic without looping constraints.

## Inputs
| Port Name | Bit Width | Type | Description |
|-----------|-----------|------|-------------|
| `a`       | 4         | input| First 4-bit operand vector |
| `b`       | 4         | input| Second 4-bit operand vector |
| `cin`     | 1         | input| Carry-in input |

## Outputs
| Port Name | Bit Width | Type | Description |
|-----------|-----------|------|-------------|
| `sum`     | 4         | output| 4-bit Sum output vector |
| `cout`    | 1         | output| Carry-out output |
| `pg`      | 1         | output| Block propagate term for cascading |
| `gg`      | 1         | output| Block generate term for cascading |

## Boolean Equations
Let $p_i$ be propagate ($a_i \oplus b_i$) and $g_i$ be generate ($a_i \cdot b_i$):
- $c_1 = g_0 + p_0 \cdot c_0$
- $c_2 = g_1 + p_1 \cdot g_0 + p_1 \cdot p_0 \cdot c_0$
- $c_3 = g_2 + p_2 \cdot g_1 + p_2 \cdot p_1 \cdot g_0 + p_2 \cdot p_1 \cdot p_0 \cdot c_0$
- $c_4 = g_3 + p_3 \cdot g_2 + p_3 \cdot p_2 \cdot g_1 + p_3 \cdot p_2 \cdot p_1 \cdot g_0 + p_3 \cdot p_2 \cdot p_1 \cdot p_0 \cdot c_0$
- $\text{Sum}[i] = p_i \oplus c_i$

## Working Principle
- **Generate ($g_i$)**: The stage will generate a carry-out if both input bits are `1`, regardless of carry-in.
- **Propagate ($p_i$)**: The stage will propagate an incoming carry-in to its carry-out if exactly one input bit is `1`.
- **Parallel Compute**: By substituting $c_i$ equations recursively, all carry signals $c_1 \dots c_4$ are computed as flat SOP (sum of products) equations. Thus, they pass through only two gate levels (AND-OR), creating an extremely fast carry path.

## Applications
- High-performance ALU designs in microprocessors.
- Time-critical adders in arithmetic pipelines.
- Multiplier accumulators (MACs) in digital signal processing (DSP) units.

## Expected Simulation Behaviour
- The output `sum` matches $a + b + cin$.
- The `pg` pin goes high when all bit stages propagate (`a ^ b == 4'b1111`).
- The `gg` pin goes high when the block as a whole generates a carry-out from its internal operands.

## Future Improvements
- Implement a 16-bit Carry Lookahead Adder using four 4-bit CLA blocks and a Lookahead Carry Generator unit (e.g., 74182 logic).
