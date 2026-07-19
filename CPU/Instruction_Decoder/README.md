# 🔓 Instruction Decoder

## 📝 Description
A combinational instruction field decoder. It splits the 16-bit input instruction word (`instr[15:0]`) into specific field outputs: a 4-bit operational code (`opcode`), 2-bit register selections (`rd`, `rs`), and an 8-bit immediate value/address offset (`imm`).

## ⚙️ Functional Overview
The Instruction Decoder extracts opcode and operand fields from the latched instruction register during the Decode phase. The opcode goes to the Control Unit to generate timing signals, while the register and immediate values route directly to GPR address lines and MUX selectors.

## 🔌 Inputs & Outputs

| Port Name | Bit Width | Type   | Description |
|-----------|-----------|--------|-------------|
| `instr`   | 16        | input  | 16-bit raw instruction word input |
| `opcode`  | 4         | output | 4-bit decoded operational code |
| `rd`      | 2         | output | 2-bit decoded destination register index |
| `rs`      | 2         | output | 2-bit decoded source register index |
| `imm`     | 8         | output | 8-bit decoded immediate value / address offset |

## 📦 Block Description
- **Field Extraction Mapping**:
  - `opcode` = `instr[15:12]`
  - `rd` = `instr[11:10]`
  - `rs` = `instr[9:8]`
  - `imm` = `instr[7:0]`

## 📁 Files Included
- `src/instruction_decoder.v` (contains Verilog source code)
- `testbench/instruction_decoder_tb.v` (contains self-checking testbench)
- `rtl/` (empty, schematic layout directory)
- `waveform/` (empty, simulation waveform directory)
