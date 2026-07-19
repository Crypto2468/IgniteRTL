# 🚧 Automatic Gate Controller

## 📝 Description
An automatic gate controller that opens on detection of an approaching vehicle, remains open for a preset duration, and closes automatically. It features security limit switches and an obstacle detection safety retract loop.

## 📊 State Diagram Explanation
The FSM is structured into 4 states:
- `GATE_CLOSED` (00): Gate fully closed. Transitions to `GATE_OPENING` if `sensor_open = 1`.
- `GATE_OPENING` (01): Opening motor active. Transitions to `GATE_OPEN` when `limit_open = 1`.
- `GATE_OPEN` (10): Gate open. Automatically closes after 6 cycles.
- `GATE_CLOSING` (11): Closing motor active. If `obstacle` safety is tripped, retracts to `GATE_OPENING`. Transitions to `GATE_CLOSED` if `limit_close = 1`.

## 📋 State Transition Table

| Current State | Condition | Next State | Motor Open | Motor Close | Warning LED |
|:-------------:|:---------:|:----------:|:----------:|:-----------:|:-----------:|
| `GATE_CLOSED` | sensor_open | `GATE_OPENING` |     0      |      0      |      0      |
| `GATE_OPENING`| limit_open  | `GATE_OPEN`    |     1      |      0      |      0      |
| `GATE_OPEN`   | timer complete | `GATE_CLOSING` |     0      |      0      |      0      |
| `GATE_CLOSING`| obstacle/sensor| `GATE_OPENING`|    0      |      1      |      0      |
| `GATE_CLOSING`| limit_close | `GATE_CLOSED`  |     0      |      1      |      0      |

## 🔌 Inputs & Outputs

| Port Name | Bit Width | Type   | Description |
|-----------|-----------|--------|-------------|
| `clk`     | 1         | input  | Clock signal |
| `rst_n`   | 1         | input  | Asynchronous active-low reset |
| `sensor_open`| 1       | input  | Sensor detecting vehicle presence |
| `limit_open`| 1        | input  | Limit switch indicating gate is open |
| `limit_close`| 1       | input  | Limit switch indicating gate is closed |
| `obstacle`| 1         | input  | Safety infrared photo-eye obstacle detector |
| `motor_open`| 1        | output | Motor drive signal to open gate |
| `motor_close`| 1       | output | Motor drive signal to close gate |
| `warning_led`| 1       | output | Obstacle warning indicator |

## 📁 Files Included
- `src/automatic_gate_controller.v` (contains Verilog source code)
- `testbench/automatic_gate_controller_tb.v` (contains self-checking testbench)
- `rtl/` (empty, schematic layout directory)
- `waveform/` (empty, simulation waveform directory)
