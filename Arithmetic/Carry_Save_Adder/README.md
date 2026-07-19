# Carry Save Adder

## Purpose
The Carry Save Adder (CSA) is a specialized combinational digital circuit designed to add three multi-bit numbers in parallel. Rather than performing carry-propagation immediately, it reduces three input vectors to two vectors (a sum vector and a carry vector) with a constant delay of one full adder cell ($O(1)$).

## Features
- **Parameterized Width**: Supports any operand bit-width via the `WIDTH` parameter.
- **O(1) Propagation Delay**: Bypasses carry-ripple and lookahead delays by storing carries at each column.
- **Efficient Reduction**: Acts as a 3:2 compressor block, key to high-speed multiplication architectures.

## Inputs
| Port Name | Bit Width | Type | Description |
|-----------|-----------|------|-------------|
| `a`       | `WIDTH`   | input| First $N$-bit input vector |
| `b`       | `WIDTH`   | input| Second $N$-bit input vector |
| `c`       | `WIDTH`   | input| Third $N$-bit input vector |

## Outputs
| Port Name | Bit Width | Type | Description |
|-----------|-----------|------|-------------|
| `sum`     | `WIDTH`   | output| Un-propagated Sum vector |
| `carry`   | `WIDTH`   | output| Un-propagated Carry vector |

## Working Principle
In standard carry-propagate adders, adding multiple numbers is slow because carry bits must ripple through each stage before proceeding to the next addition. 

The Carry Save Adder resolves this by adding each column independently:
- **Sum Output (`sum[i]`)**: $a[i] \oplus b[i] \oplus c[i]$
- **Carry Output (`carry[i]`)**: $(a[i] \cdot b[i]) + (b[i] \cdot c[i]) + (c[i] \cdot a[i])$

The resulting sum and carry vectors can be added using a fast carry-propagate adder (like CLA) with a one-bit left-shifted carry:
$$\text{Total Sum} = \text{sum} + (\text{carry} \ll 1)$$
By deferring carry propagation to the very end of multi-operand additions (e.g. in multi-operand accumulation or partial product summation), total latency is significantly reduced.

## Applications
- High-speed multipliers (e.g., Wallace-tree and Dadda structures).
- DSP filters requiring multi-operand accumulation.
- Cryptographic co-processors (RSA, Elliptic Curve Cryptography).

## Expected Simulation Behaviour
- The outputs `sum` and `carry` will reflect the independent bit-wise XOR and majority-logic functions.
- Reconstructed sum $\text{sum} + (\text{carry} \ll 1)$ will match $a + b + c$ for all inputs.
