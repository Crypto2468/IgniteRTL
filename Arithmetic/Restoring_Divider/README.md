# Restoring Divider (Sequential Unsigned Division)

## Description
The Restoring Divider is a sequential digital arithmetic block that computes the $N$-bit quotient and $N$-bit remainder of two $N$-bit unsigned binary numbers using the classical restoring division algorithm implemented as a finite state machine (FSM).

## Truth Table


## Module I/O
| Port Name | Bit Width | Type | Description |
|-----------|-----------|------|-------------|
| `clk`      | 1         | input | System Clock |
| `rst_n`    | 1         | input | Active-low asynchronous reset |
| `start`    | 1         | input | Starts division |
| `dividend` | `WIDTH`   | input | Dividend input vector |
| `divisor`  | `WIDTH`   | input | Divisor input vector |
| `quotient`    | `WIDTH`   | output | Quotient of division |
| `remainder`   | `WIDTH`   | output | Remainder of division |
| `ready`       | 1         | output | Device is ready for new input |
| `done`        | 1         | output | Active-high completion signal |
| `div_by_zero` | 1         | output | Active-high division-by-zero error flag |

## Files Included
- `src/` (contains Verilog source code)
- `testbench/` (contains self-checking testbench)
- `rtl/` (empty, schematic layout directory)
- `waveform/` (empty, simulation waveform directory)
