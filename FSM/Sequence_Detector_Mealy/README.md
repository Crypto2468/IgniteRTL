# 🔍 Sequence Detector (Mealy Machine)

## 📝 Description
A Mealy Finite State Machine (FSM) sequence detector designed to detect the overlapping binary sequence `1011`. In a Mealy machine, the output is a function of both the current state and the current input, allowing it to respond to sequence completion one clock cycle earlier than an equivalent Moore implementation.

## 📊 State Diagram Explanation
The FSM is structured into four distinct states:
1. **S_RESET (2'b00)**: Waiting state. Transition to `S_1` if the input is `1`, otherwise hold `S_RESET`.
2. **S_1 (2'b01)**: First state. Transition to `S_10` if the input is `0`, otherwise hold `S_1` (self-loop since we could be starting a new sequence).
3. **S_10 (2'b10)**: Second state. Transition to `S_101` if the input is `1`, otherwise return to `S_RESET`.
4. **S_101 (2'b11)**: Third state. If the input is `1`, transition back to `S_1` and assert the output `dout = 1` (completing `1011`). Since this is overlapping, state `S_1` preserves the final `1` for the next detection sequence. If the input is `0`, transition to `S_10` (representing `1010` where the last `10` fits).

## 📋 State Transition Table

| Current State | Input (`din`) | Next State | Output (`dout`) |
|:---:|:---:|:---:|:---:|
| `S_RESET` | 0 | `S_RESET` | 0 |
| `S_RESET` | 1 | `S_1` | 0 |
| `S_1` | 0 | `S_10` | 0 |
| `S_1` | 1 | `S_1` | 0 |
| `S_10` | 0 | `S_RESET` | 0 |
| `S_10` | 1 | `S_101` | 0 |
| `S_101` | 0 | `S_10` | 0 |
| `S_101` | 1 | `S_1` | 1 |

## 🔌 Inputs & Outputs

| Port Name | Bit Width | Type   | Description |
|-----------|-----------|--------|-------------|
| `clk`     | 1         | input  | Clock input signal |
| `rst_n`   | 1         | input  | Asynchronous active-low reset |
| `din`     | 1         | input  | Serial data input stream |
| `dout`    | 1         | output | High when `1011` sequence is detected |

## 📁 Files Included
- `src/sequence_detector_mealy.v` (contains Verilog source code)
- `testbench/sequence_detector_mealy_tb.v` (contains self-checking testbench)
- `rtl/` (empty, schematic layout directory)
- `waveform/` (empty, simulation waveform directory)
