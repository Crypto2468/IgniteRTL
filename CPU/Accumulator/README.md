# 📂 Accumulator Register

## 📝 Description
An 8-bit synchronous Accumulator register. It stores the intermediate result of the Arithmetic Logic Unit (ALU) execution cycle, making it immediately available for subsequent operations.

## ⚙️ Functional Overview
The Accumulator functions as a default primary destination register in many classical CPU architectures. The control unit asserts `en` at the end of an arithmetic clock cycle to latch the ALU output into the Accumulator.

## 🔌 Inputs & Outputs

| Port Name | Bit Width | Type   | Description |
|-----------|-----------|--------|-------------|
| `clk`     | 1         | input  | Clock signal |
| `rst_n`   | 1         | input  | Asynchronous active-low reset |
| `en`      | 1         | input  | Accumulator enable control |
| `din`     | 8         | input  | 8-bit ALU input data |
| `dout`    | 8         | output | 8-bit accumulated output |

## 📦 Block Description
- **Asynchronous Clear**: Activating `rst_n` clears the output to `8'h00`.
- **Clock Latch**: Driven on the rising clock edge when `en = 1`, copying `din` to `dout`. Otherwise, holds its current state.

## 📁 Files Included
- `src/accumulator.v` (contains Verilog source code)
- `testbench/accumulator_tb.v` (contains self-checking testbench)
- `rtl/` (empty, schematic layout directory)
- `waveform/` (empty, simulation waveform directory)
