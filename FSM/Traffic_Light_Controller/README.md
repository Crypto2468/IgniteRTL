# 🚦 Traffic Light Controller

## 📝 Description
A dual-highway junction controller regulating North-South (NS) and East-West (EW) traffic. It counts clock cycles to transition between Green, Yellow, and Red lights for each highway direction.

## 📊 State Diagram Explanation
The FSM is structured into 4 states:
- `NS_GREEN` (00): NS Green / EW Red. Transitions to `NS_YELLOW` after 6 clock cycles.
- `NS_YELLOW` (01): NS Yellow / EW Red. Transitions to `EW_GREEN` after 2 clock cycles.
- `EW_GREEN` (10): NS Red / EW Green. Transitions to `EW_YELLOW` after 6 clock cycles.
- `EW_YELLOW` (11): NS Red / EW Yellow. Transitions to `NS_GREEN` after 2 clock cycles.

## 📋 State Transition Table

| Current State | Condition | Next State | NS Output (R/Y/G) | EW Output (R/Y/G) |
|:-------------:|:---------:|:----------:|:-----------------:|:-----------------:|
|  `NS_GREEN`   | timer < 5 | `NS_GREEN`  |       001         |       100         |
|  `NS_GREEN`   | timer >= 5| `NS_YELLOW` |       001         |       100         |
|  `NS_YELLOW`  | timer < 1 | `NS_YELLOW` |       010         |       100         |
|  `NS_YELLOW`  | timer >= 1|  `EW_GREEN` |       010         |       100         |
|  `EW_GREEN`   | timer < 5 | `EW_GREEN`  |       100         |       001         |
|  `EW_GREEN`   | timer >= 5| `EW_YELLOW` |       100         |       001         |
|  `EW_YELLOW`  | timer < 1 | `EW_YELLOW` |       100         |       010         |
|  `EW_YELLOW`  | timer >= 1| `NS_GREEN`  |       100         |       010         |

## 🔌 Inputs & Outputs

| Port Name | Bit Width | Type   | Description |
|-----------|-----------|--------|-------------|
| `clk`     | 1         | input  | Clock signal |
| `rst_n`   | 1         | input  | Asynchronous active-low reset |
| `ns_light`| 3         | output | North-South light vector (Red, Yellow, Green) |
| `ew_light`| 3         | output | East-West light vector (Red, Yellow, Green) |

## 📁 Files Included
- `src/traffic_light_controller.v` (contains Verilog source code)
- `testbench/traffic_light_controller_tb.v` (contains self-checking testbench)
- `rtl/` (empty, schematic layout directory)
- `waveform/` (empty, simulation waveform directory)
