# 🚀 Simple RISC CPU

## 📝 Description
A fully integrated 8-bit Simple RISC CPU Core. It unites all datapath components (Program Counter, Instruction Register, Instruction Decoder, general purpose Register File, MUX Bus Selectors, and an 8-bit ALU) and a 3-state sequencer Control Unit to fetch, decode, and execute instructions.

## ⚙️ Functional Overview
The processor uses a 16-bit instruction Harvard architecture. A built-in 16-word program ROM executes a sample routine loading intermediate variables into GPR indexes, executing an addition operation via the ALU, and jumping unconditionally to loop the operations.

## 🔌 Inputs & Outputs

| Port Name | Bit Width | Type   | Description |
|-----------|-----------|--------|-------------|
| `clk`     | 1         | input  | System clock input |
| `rst_n`   | 1         | input  | Asynchronous active-low reset |
| `pc_out`  | 8         | output | 8-bit current Program Counter monitor value |

## 📦 Block Description
- **PC Pointer**: Instantiates `program_counter` to schedule memory reads.
- **Instruction Store**: Holds instruction payloads in `instruction_register` on fetch intervals.
- **Decoder Splitter**: Parses operations using `instruction_decoder`.
- **FSM Sequencer**: Maps operational schedules using `control_unit`.
- **Register Storage**: Retains local execution buffers inside a 4x8 `register_file`.
- **Execution ALU**: Runs operations through `alu_8bit`.

## 📁 Files Included
- `src/simple_risc_cpu.v` (contains Verilog source code)
- `testbench/simple_risc_cpu_tb.v` (contains self-checking testbench)
- `rtl/` (empty, schematic layout directory)
- `waveform/` (empty, simulation waveform directory)
