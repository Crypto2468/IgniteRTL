# Barrel Shifter (Logarithmic Combinational Shifter)

## Purpose
The Barrel Shifter is an 8-bit combinational digital logic circuit that can shift or rotate a data word by any number of bit positions in a single cycle. It utilizes a logarithmic multiplexer structure to execute shifts with minimal gate delay.

## Features
- **Four Shifting Modes**:
  - **LSL (Logical Shift Left)**: Shifts bits left, fills vacated positions with `0`.
  - **LSR (Logical Shift Right)**: Shifts bits right, fills vacated positions with `0`.
  - **ASR (Arithmetic Shift Right)**: Shifts bits right, preserves the sign bit (MSB) by replicating it in vacated positions.
  - **ROR (Rotate Right)**: Shifts bits right, wraps around shifted-out LSBs back into MSB positions.
- **Logarithmic Multiplexer Stages**: Shifts are executed in $O(\log_2 N)$ stages instead of a linear shifter's $O(N)$ path.
- **Constant Latency**: Always resolves inputs in a single combinational cycle.

## Inputs
| Port Name   | Bit Width | Type  | Description |
|-------------|-----------|-------|-------------|
| `data_in`   | 8         | input | 8-bit input data to shift |
| `shift_amt` | 3         | input | Shift amount (0 to 7 positions) |
| `mode`      | 2         | input | Shift mode selection (00=LSL, 01=LSR, 10=ASR, 11=ROR) |

## Outputs
| Port Name   | Bit Width | Type   | Description |
|-------------|-----------|--------|-------------|
| `data_out`  | 8         | output | 8-bit shifted output |

## Working Principle
A naive shifter uses $N$ multi-input multiplexers to select the output, which creates high fan-in loading. A logarithmic Barrel Shifter organizes the shifting recursively:
For an 8-bit word, the shift amount $S$ is represented as a 3-bit binary number $S = \{s_2, s_1, s_0\}$.
1. **Stage 0 (controlled by $s_0$)**: If $s_0 = 1$, the data is shifted/rotated by 1 position. If $s_0 = 0$, the data passes through unchanged.
2. **Stage 1 (controlled by $s_1$)**: If $s_1 = 1$, the intermediate data is shifted/rotated by 2 positions. If $s_1 = 0$, it passes through.
3. **Stage 2 (controlled by $s_2$)**: If $s_2 = 1$, the data is shifted/rotated by 4 positions. If $s_2 = 0$, it passes through to output.

### Shift Equations per Stage
At each stage $k$, the data is shifted by $2^k$ positions. The vacated bits are filled depending on the selected mode:
- **LSL**: Fills with `0` at the LSBs.
- **LSR**: Fills with `0` at the MSBs.
- **ASR**: Fills with the sign bit (`data_in[7]`) at the MSBs.
- **ROR**: Wraps the overflow bits back to the opposite side.

## Applications
- Central processing unit ALUs for execution of bitwise instruction sets.
- Floating-point normalization and alignment units.
- DSP logic systems executing scaling operations.

## Expected Simulation Behaviour
- The output stabilizes combinationally.
- An arithmetic shift right of `8'b1100_0010` by `1` yields `8'b1110_0001` (sign-preserving), while logical shift right yields `8'b0110_0001`.
- A rotate right of `8'b1000_0111` by `3` yields `8'b1111_0000`.
