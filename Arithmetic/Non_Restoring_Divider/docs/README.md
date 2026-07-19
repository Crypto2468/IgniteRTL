# Non-Restoring Divider (Sequential Unsigned Division)

## Purpose
The Non-Restoring Divider is a sequential digital arithmetic block that computes the $N$-bit quotient and $N$-bit remainder of two $N$-bit unsigned binary numbers using the non-restoring division algorithm. It optimizes hardware execution time by removing the conditional register "restoration" steps during active computation cycles.

## Features
- **No Active Restoration Loop**: Performs either addition or subtraction depending on the sign bit of the accumulator, avoiding the restoring step's propagation delay.
- **Division-by-Zero Protection**: Automatically asserts `div_by_zero` and yields all 1s when dividing by zero.
- **Final Remainder Correction**: A dedicated state executes at the end of calculation to correct negative remainders in a single cycle.

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
Non-restoring division replaces the conditional restoring step by tracking the sign of the accumulator:
1. **FSM States**:
   - **IDLE**: Captures dividend and divisor, checks for `divisor == 0`.
   - **DIV**: Loops $N$ times. For each cycle:
     - Shift `{a_reg, q_reg}` left by 1 bit to form `next_a` and `next_q`.
     - Check the sign bit (MSB) of the accumulator `a_reg[WIDTH-1]`:
       - If `0` (positive/zero): Subtract the divisor: `op_a = next_a - m_reg`.
       - If `1` (negative): Add the divisor: `op_a = next_a + m_reg`.
     - Update `a_reg` with `op_a`.
     - Set the quotient LSB `q_reg[0]` to the inverse of the sign of `op_a` (i.e. `~op_a[WIDTH-1]`).
   - **CORRECT**: If the final accumulator `a_reg` is negative (MSB is `1`), add the divisor `m_reg` back to restore it to positive. Otherwise, skip correction.
   - **DONE**: Updates output registers `quotient` and `remainder` and asserts `done`.

### Performance Comparison
- **Non-Restoring**: Eliminates the conditional write-back (restoration) in the active cycles. The critical path of the cell is shorter because the adder and registers are directly decoupled without intermediate mux/restore decisions.
- **Cycles**: Takes $N + 2$ cycles (1 cycle for FSM initialization, $N$ for division, 1 for final remainder correction).

## Applications
- Central processing unit execution cores.
- DSP math blocks.
- Division blocks in hardware graphics engines.

## Expected Simulation Behaviour
- `ready` transitions low during execution.
- If `dividend=100` and `divisor=3`, the output registers settle to `quotient=33` and `remainder=1` at the end of the `done` pulse.
