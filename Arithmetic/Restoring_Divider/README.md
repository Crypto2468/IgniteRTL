# Restoring Divider (Sequential Unsigned Division)

## Purpose
The Restoring Divider is a sequential digital arithmetic block that computes the $N$-bit quotient and $N$-bit remainder of two $N$-bit unsigned binary numbers using the classical restoring division algorithm implemented as a finite state machine (FSM).

## Features
- **Parameterized Width**: Supports any word length using the `WIDTH` parameter.
- **Division-by-Zero Protection**: Detects division by zero and asserts a flag (`div_by_zero`) to prevent infinite calculation states.
- **Registered Outputs**: Stores both Quotient and Remainder at completion to prevent downstream glitches.

## Inputs
| Port Name  | Bit Width | Type  | Description |
|------------|-----------|-------|-------------|
| `clk`      | 1         | input | System Clock |
| `rst_n`    | 1         | input | Active-low asynchronous reset |
| `start`    | 1         | input | Starts division |
| `dividend` | `WIDTH`   | input | Dividend input vector |
| `divisor`  | `WIDTH`   | input | Divisor input vector |

## Outputs
| Port Name     | Bit Width | Type   | Description |
|---------------|-----------|--------|-------------|
| `quotient`    | `WIDTH`   | output | Quotient of division |
| `remainder`   | `WIDTH`   | output | Remainder of division |
| `ready`       | 1         | output | Device is ready for new input |
| `done`        | 1         | output | Active-high completion signal |
| `div_by_zero` | 1         | output | Active-high division-by-zero error flag |

## Working Principle
The restoring division algorithm performs subtraction and conditionally "restores" the accumulator if the subtraction yields a negative result:
1. **FSM States**:
   - **IDLE**: Evaluates `start`. If `divisor == 0`, it reports a division-by-zero error immediately and exits. Otherwise, it initializes the accumulator `a_reg = 0`, quotient register `q_reg = dividend`, and the counter.
   - **DIV**: Loops $N$ times. For each cycle:
     - Shift `{a_reg, q_reg}` left by 1 bit.
     - Subtract the divisor `m_reg` from the shifted accumulator `next_a`: `sub_a = next_a - m_reg`.
     - Check the sign bit (MSB) of the subtraction result `sub_a[WIDTH-1]`:
       - If `1` (negative): The subtract failed. We **restore** the accumulator `a_reg = next_a` and set the quotient LSB `q_reg[0] = 0`.
       - If `0` (positive or zero): The subtract succeeded. We update the accumulator `a_reg = sub_a` and set the quotient LSB `q_reg[0] = 1`.
   - **DONE**: Halts computation, updates output registers `quotient` and `remainder`, and asserts `done`.

### Performance
- **Latency**: $N$ computation cycles + 1 setup cycle.
- **Area**: Extremely compact (requires only one subtractor and shift registers).

## Applications
- Central processing unit division hardware.
- Address scaling logic in memory controllers.
- Low-power embedded execution units.

## Expected Simulation Behaviour
- `ready` transitions low during execution.
- If `divisor == 0`, `div_by_zero` is asserted high, `done` goes high, and the quotient is forced to all `1`s (representing infinity) on the next clock edge.
- The final quotient and remainder match the mathematical outputs.
