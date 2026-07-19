# Array Multiplier

## Purpose
The Array Multiplier is a parameterized, purely combinational digital multiplier. It computes the $2N$-bit product of two $N$-bit unsigned numbers in a single clock cycle by laying out a 2D matrix of partial-product AND gates and adder cells structurally in parallel.

## Features
- **Parameterized Operand Width**: Scales dynamically for any bit-width using the `WIDTH` parameter.
- **Single-Cycle Latency**: Implemented combinationally with no clock dependencies.
- **Synthesizable 2D Array Loop**: Formulated using nested `generate` loops for structured, predictable gate synthesis in standard cell ASIC flows.

## Inputs
| Port Name | Bit Width | Type | Description |
|-----------|-----------|------|-------------|
| `a`       | `WIDTH`   | input| Multiplicand input vector |
| `b`       | `WIDTH`   | input| Multiplier input vector |

## Outputs
| Port Name | Bit Width | Type | Description |
|-----------|-----------|------|-------------|
| `product` | `2*WIDTH` | output| Product output vector ($a \times b$) |

## Working Principle
The array multiplier maps the pencil-and-paper binary multiplication algorithm directly to hardware gates:
1. **Partial Product Matrix ($pp_{i,j}$)**: For inputs $a$ and $b$, there are $N \times N$ partial product bits computed using an array of 2D AND gates:
   $$pp[i][j] = a[j] \cdot b[i]$$
2. **Shifted Addition Grid**: Adders sum the partial products by shifting row $i$ left by $i$ positions. The structural grid connects:
   - Sum output from row $i-1$ (at column $j+1$) to the input of the adder in row $i$ (at column $j$).
   - Carry output from column $j-1$ in the same row $i$ to the carry-in of column $j$ in row $i$.
3. **Product Formation**: The product outputs are drawn from the boundary:
   - LSB: `product[0]` is drawn from `sum_grid[0][0]`.
   - Lower bits: `product[k]` is drawn from `sum_grid[k][0]`.
   - Higher bits: `product[N-1+k]` is drawn from `sum_grid[N-1][k]`.
   - MSB: `product[2*N-1]` is drawn from the carry-out of the top-right adder `carry_grid[N-1][N-1]`.

### Latency and Complexity
- **Time Complexity**: The critical path delay is determined by the worst-case carry propagation across the diagonal of the array, giving a delay of $O(N)$.
- **Space Complexity**: The number of gates grows quadratically as $O(N^2)$, requiring $N(N-1)$ Full Adders and $N^2$ AND gates.

## Applications
- High-speed DSP filters (where single-cycle throughput is mandatory).
- High-performance execution units in low-bit-width microcontrollers.
- Dedicated co-processors.

## Expected Simulation Behaviour
- The product output stabilizes to $a \times b$ after the combinational delay has elapsed.
- Any change in input $a$ or $b$ updates `product` combinationally.
