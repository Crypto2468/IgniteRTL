# Sequence Detector (Moore Machine)

## Description
A Moore Finite State Machine (FSM) sequence detector designed to detect the overlapping binary sequence `1011`. In a Moore machine, the output is a function only of the current state, causing the output transition to be clock-synchronous and delayed by one clock cycle compared to a Mealy FSM.

## State Diagram Explanation
The Moore FSM transitions through five states:
- `S_RESET` (000): waiting for '1'
- `S_1` (001): '1' detected
- `S_10` (010): '10' detected
- `S_101` (011): '101' detected
- `S_1011` (100): '1011' fully detected (dout is high only in this state)

## State Transition Table

| Current State | Input (`din`) | Next State | Output (`dout`) |
|:-------------:|:-------------:|:----------:|:--------------:|
|   `S_RESET`   |       0       | `S_RESET`  |        0       |
|   `S_RESET`   |       1       |   `S_1`    |        0       |
|     `S_1`     |       0       |   `S_10`   |        0       |
|     `S_1`     |       1       |   `S_1`    |        0       |
|    `S_10`     |       0       | `S_RESET`  |        0       |
|    `S_10`     |       1       |  `S_101`   |        0       |
|    `S_101`    |       0       |   `S_10`   |        0       |
|    `S_101`    |       1       |  `S_1011`  |        0       |
|   `S_1011`    |       0       |   `S_10`   |        1       |
|   `S_1011`    |       1       |   `S_1`    |        1       |

## Inputs & Outputs

| Port Name | Bit Width | Type   | Description |
|-----------|-----------|--------|-------------|
| `clk`     | 1         | input  | Clock input |
| `rst_n`   | 1         | input  | Asynchronous active-low reset |
| `din`     | 1         | input  | Serial data input stream |
| `dout`    | 1         | output | High when `1011` sequence is detected |

## Files Included
- `src/sequence_detector_moore.v` (contains Verilog source code)
- `testbench/sequence_detector_moore_tb.v` (contains self-checking testbench)
- `rtl/` (empty, schematic layout directory)
- `waveform/` (empty, simulation waveform directory)
