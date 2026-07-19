# Instruction Register

## Description
A 16-bit synchronous Instruction Register (IR). It latches the instruction word fetched from program memory during the Fetch phase of the CPU instruction cycle, holding it constant for decoding and execution phases.

## Functional Overview
During the CPU Fetch cycle, `ir_enable` is asserted to latch the 16-bit instruction word from memory. The register holds this instruction word stable for the Instruction Decoder to split into opcode, register addresses, and immediate operands.

## Inputs & Outputs

| Port Name | Bit Width | Type   | Description |
|-----------|-----------|--------|-------------|
| `clk`     | 1         | input  | Clock signal |
| `rst_n`   | 1         | input  | Asynchronous active-low reset |
| `ir_enable`| 1        | input  | Write Enable control line |
| `din`     | 16        | input  | 16-bit raw memory instruction input |
| `instr`   | 16        | output | 16-bit latched instruction output |

## Block Description
- **Asynchronous Clear**: Activating `rst_n` sets output `instr` immediately to `16'h0000`.
- **D-type Flip-Flop Registers**: The 16-bit output matches `din` on the rising clock edge if `ir_enable` is asserted; otherwise, the output remains unchanged.

## Files Included
- `src/instruction_register.v` (contains Verilog source code)
- `testbench/instruction_register_tb.v` (contains self-checking testbench)
- `rtl/` (empty, schematic layout directory)
- `waveform/` (empty, simulation waveform directory)
