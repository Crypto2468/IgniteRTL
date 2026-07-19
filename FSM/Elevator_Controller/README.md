# Elevator Controller

## Description
A basic elevator controller regulating movement across Floors 0, 1, and 2. It tracks destination requests, controls upward/downward cabin motors, and activates the door exit cycle.

## State Diagram Explanation
The FSM consists of 4 states:
- `STATE_IDLE` (00): Stationed at floor. Transitions to `STATE_UP` or `STATE_DOWN` depending on floor request logic.
- `STATE_UP` (01): Upward motor active. Transitions to `STATE_DOOR` when cabin matches request.
- `STATE_DOWN` (10): Downward motor active. Transitions to `STATE_DOOR` when cabin matches request.
- `STATE_DOOR` (11): Cabin door active. Automatically transitions back to `STATE_IDLE` on the next clock.

## State Transition Table

| Current State | Condition | Next State | Motor Up | Motor Down | Door Open |
|:-------------:|:---------:|:----------:|:--------:|:----------:|:---------:|
| `STATE_IDLE`  | `req > cur` |  `STATE_UP`  |    0     |     0      |     0     |
| `STATE_IDLE`  | `req < cur` | `STATE_DOWN` |    0     |     0      |     0     |
| `STATE_IDLE`  | `req == cur`| `STATE_DOOR` |    0     |     0      |     0     |
|   `STATE_UP`  | target reach| `STATE_DOOR` |    1     |     0      |     0     |
|  `STATE_DOWN` | target reach| `STATE_DOOR` |    0     |     1      |     0     |
|  `STATE_DOOR` |     X     | `STATE_IDLE` |    0     |     0      |     1     |

## Inputs & Outputs

| Port Name | Bit Width | Type   | Description |
|-----------|-----------|--------|-------------|
| `clk`     | 1         | input  | Clock signal |
| `rst_n`   | 1         | input  | Asynchronous active-low reset |
| `req_floor`| 2        | input  | Floor request destination (0, 1, 2) |
| `current_floor`| 2    | output | Current floor location of the elevator |
| `motor_up`| 1         | output | High when elevator is moving up |
| `motor_down`| 1       | output | High when elevator is moving down |
| `door_open`| 1        | output | High when door is open |

## Files Included
- `src/elevator_controller.v` (contains Verilog source code)
- `testbench/elevator_controller_tb.v` (contains self-checking testbench)
- `rtl/` (empty, schematic layout directory)
- `waveform/` (empty, simulation waveform directory)
