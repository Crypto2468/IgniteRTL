# Washing Machine Controller

## Description
An automated washing machine cycle controller. It transitions sequentially through water filling, wash cycle agitation, rinsing, and spin drying based on stage completion triggers.

## State Diagram Explanation
The FSM transitions sequentially:
- `STATE_IDLE` (000): Waiting for cycle start. Transitions to `STATE_FILL` when `start = 1`.
- `STATE_FILL` (001): Water inlet valve open. Transitions to `STATE_WASH` when `cycle_complete = 1`.
- `STATE_WASH` (010): Wash cycle agitator active. Transitions to `STATE_RINSE` when `cycle_complete = 1`.
- `STATE_RINSE` (011): Water inlet and drain pump active. Transitions to `STATE_SPIN` when `cycle_complete = 1`.
- `STATE_SPIN` (100): Spin dryer and pump active. Transitions to `STATE_IDLE` when `cycle_complete = 1`.

## State Transition Table

| Current State | Input | Next State | Water Inlet | Agitator | Pump Out | Spin Dry |
|:-------------:|:-----:|:----------:|:-----------:|:--------:|:--------:|:--------:|
| `STATE_IDLE`  | start | `STATE_FILL` |      0      |    0     |    0     |    0     |
| `STATE_FILL`  | complete | `STATE_WASH` |      1      |    0     |    0     |    0     |
| `STATE_WASH`  | complete | `STATE_RINSE`|      0      |    1     |    0     |    0     |
| `STATE_RINSE` | complete | `STATE_SPIN` |      1      |    0     |    1     |    0     |
| `STATE_SPIN`  | complete | `STATE_IDLE` |      0      |    0     |    1     |    1     |

## Inputs & Outputs

| Port Name | Bit Width | Type   | Description |
|-----------|-----------|--------|-------------|
| `clk`     | 1         | input  | Clock signal |
| `rst_n`   | 1         | input  | Asynchronous active-low reset |
| `start`   | 1         | input  | Starts the laundry cycle |
| `cycle_complete`| 1   | input  | Triggers progression to the next stage |
| `water_inlet`| 1      | output | Opens water fill valve |
| `agitator`| 1         | output | Activates mechanical wash drum agitation |
| `pump_out`| 1         | output | Activates water drainage pump |
| `spin_dry`| 1         | output | Activates laundry spin dry mode |

## Files Included
- `src/washing_machine_controller.v` (contains Verilog source code)
- `testbench/washing_machine_controller_tb.v` (contains self-checking testbench)
- `rtl/` (empty, schematic layout directory)
- `waveform/` (empty, simulation waveform directory)
