# Lift Controller

## Description
A lift cabin controller that emphasizes requests via a 3-bit request vector representing floors 0, 1, and 2. It navigates to request locations and services multiple passenger requests sequentially.

## State Diagram Explanation
The FSM features 3 states:
- `LIFT_IDLE` (00): Lift cabin stationary. If a request exists at the current floor, the cabin door opens (`door_open = 1`). Otherwise, transitions to `LIFT_UP` or `LIFT_DOWN`.
- `LIFT_UP` (01): Cabin moving up. Transitions to `LIFT_IDLE` when passing a floor with an active request.
- `LIFT_DOWN` (10): Cabin moving down. Transitions to `LIFT_IDLE` when passing a floor with an active request.

## State Transition Table

| Current State | Request Condition | Next State | Motor Up | Motor Down | Door Open |
|:-------------:|:-----------------:|:----------:|:--------:|:----------:|:---------:|
|  `LIFT_IDLE`  | `req[current]`    | `LIFT_IDLE`|    0     |     0      |     1     |
|  `LIFT_IDLE`  | requests above    |  `LIFT_UP` |    0     |     0      |     0     |
|  `LIFT_IDLE`  | requests below    | `LIFT_DOWN`|    0     |     0      |     0     |
|   `LIFT_UP`   | request at next   | `LIFT_IDLE`|    1     |     0      |     0     |
|  `LIFT_DOWN`  | request at next   | `LIFT_IDLE`|    0     |     1      |     0     |

## Inputs & Outputs

| Port Name | Bit Width | Type   | Description |
|-----------|-----------|--------|-------------|
| `clk`     | 1         | input  | Clock signal |
| `rst_n`   | 1         | input  | Asynchronous active-low reset |
| `req_floors`| 3        | input  | Floor requests vector (Floor 2, 1, 0) |
| `current_floor`| 2    | output | Current floor location of the lift |
| `motor_up`| 1         | output | High when lift is moving up |
| `motor_down`| 1       | output | High when lift is moving down |
| `door_open`| 1        | output | High when door is open to service request |

## Files Included
- `src/lift_controller.v` (contains Verilog source code)
- `testbench/lift_controller_tb.v` (contains self-checking testbench)
- `rtl/` (empty, schematic layout directory)
- `waveform/` (empty, simulation waveform directory)
