# Binary Multiplier (Sequential Shift-and-Add)

## Purpose
The Binary Multiplier is a sequential digital arithmetic block that calculates the $2N$-bit product of two $N$-bit unsigned integers. It is designed using the classical shift-and-add algorithm implemented as a finite state machine (FSM).

## Features
- **Parameterized Width**: Supports any size input operands via the `WIDTH` parameter.
- **Glitch-Free Registered Product**: Output product register updates only at completion.
- **Efficient FSM control**: Uses standard `ready` and `done` handshake signals for synchronous interfacing.

## Inputs
| Port Name | Bit Width | Type | Description |
|-----------|-----------|------|-------------|
| `clk`     | 1         | input| System Clock |
| `rst_n`   | 1         | input| Active-low asynchronous reset |
| `start`   | 1         | input| Starts multiplication |
| `a`       | `WIDTH`   | input| Multiplicand input operand |
| `b`       | `WIDTH`   | input| Multiplier input operand |

## Outputs
| Port Name | Bit Width | Type | Description |
|-----------|-----------|------|-------------|
| `product` | `2*WIDTH` | output| Registered product output |
| `ready`   | 1         | output| Active-high indicating multiplier is ready for inputs |
| `done`    | 1         | output| Active-high pulse indicating computation completed |

## Working Principle
The sequential multiplier uses a shift-and-add algorithm, simulating manual multiplication:
1. **IDLE**: The FSM stays in `IDLE` with `ready = 1` and `done = 0`. When `start` transitions high, operands are captured. `multiplicand_reg` holds the multiplicand, `multiplier_reg` holds the multiplier, and the counter is initialized.
2. **MULT**: Over $N$ clock cycles, the FSM shifts the multiplier right by 1 bit at each step:
   - If the LSB of `multiplier_reg` is `1`, the left-shifted `multiplicand_reg` is added to `accum_reg`.
   - If the LSB of `multiplier_reg` is `0`, no addition occurs.
   - `multiplicand_reg` is shifted left by 1 and `multiplier_reg` is shifted right by 1.
3. **DONE**: On the final step ($i=N-1$), the final addition evaluates, and the output `product` register latching occurs. `done` is pulsed high for 1 clock cycle to signal downstream logic.

### Computational Performance
- **Latency**: $N$ computation cycles + 1 idle setup cycle.
- **Area**: Extremely small relative to combinational multipliers (requires only one adder and shift registers instead of an array).

## Applications
- Low-area microcontrollers and embedded processors.
- Multiplier-accumulator (MAC) structures in low-speed DSPs.
- Low-power digital interfaces.

## Expected Simulation Behaviour
- The `ready` output goes low during active computation.
- The `done` output transitions high exactly $N$ cycles after `start` is asserted.
- The final product output matches $A \times B$.
