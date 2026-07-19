# Carry Completion Adder

## Purpose
The Carry Completion Adder (CCA) is an asynchronous, self-timed combinational adder. Unlike synchronous adders that must wait for a fixed, worst-case carry propagation time, the CCA dynamically generates a completion (`done`) signal as soon as the carry propagation has settled across all bits.

## Features
- **Dual-Rail Carry Logic**: Uses two complementary lines per carry bit (`c_one` and `c_zero`) to detect when a carry has resolved to either `1` or `0`.
- **Precharge/Evaluation Protocol**: Controlled by a `start` input to clear internal carry states (`start=0`) and trigger self-timed evaluation (`start=1`).
- **Done Completion Output**: Asserts `done` when all bit stages have fully settled, allowing asynchronous handshaking.

## Inputs
| Port Name | Bit Width | Type | Description |
|-----------|-----------|------|-------------|
| `start`   | 1         | input| Control input (high = evaluate, low = clear carry lines) |
| `a`       | `WIDTH`   | input| First input operand vector |
| `b`       | `WIDTH`   | input| Second input operand vector |
| `cin`     | 1         | input| Carry-in input |

## Outputs
| Port Name | Bit Width | Type | Description |
|-----------|-----------|------|-------------|
| `sum`     | `WIDTH`   | output| Sum output vector |
| `cout`    | 1         | output| Carry-out output |
| `done`    | 1         | output| Active-high completion signal |

## Working Principle
In synchronous architectures, the clock period is set according to the worst-case carry path ($O(N)$ logic gates). However, the average carry propagation length for random additions is only $O(\log N)$ bits.

The Carry Completion Adder exploits this by detecting when the carry has resolved at every stage:
1. **Carry-One (`c_one[i+1]`)**: Resolves high if the stage generates a carry ($a_i \cdot b_i$) or propagates a carry from the previous stage ($p_i \cdot c\_one_i$).
2. **Carry-Zero (`c_zero[i+1]`)**: Resolves high if the stage kills a carry ($\bar{a}_i \cdot \bar{b}_i$) or propagates a zero carry from the previous stage ($p_i \cdot c\_zero_i$).
3. **Stage Completion**: Since a carry bit must either be `1` or `0`, a stage has completed when:
   $$\text{complete}[i] = c\_one[i+1] \oplus c\_zero[i+1]$$
4. **Global Completion**: The `done` signal is asserted when all stage completes are high:
   $$\text{done} = \text{start} \cdot \left( \prod_{i=0}^{WIDTH-1} \text{complete}[i] \right)$$

This handshaking signal allows the downstream logic to sample the sum immediately upon completion, achieving average-case latency.

## Applications
- Asynchronous and self-timed processors.
- Data-dependent, variable-latency arithmetic pipelines.
- Ultra-low electromagnetic interference (EMI) systems (asynchronous logic distributes power consumption evenly across time).

## Expected Simulation Behaviour
- When `start = 0`, `sum = 0`, `cout = 0`, and `done = 0`.
- When `start = 1`, `done` goes high, and `sum`/`cout` reflect the correct mathematical sum.
