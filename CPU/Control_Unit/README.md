# CPU Control Unit

## Description
A synchronous Finite State Machine (FSM) control unit for a simple RISC CPU. It transitions sequentially through Fetch, Decode, and Execute states, issuing control signals to program counters, general-purpose register arrays, and ALUs depending on instruction opcodes.

## Functional Overview
The Control Unit is the brain of the processor. It generates scheduling signals for all other execution datapath units:
- **S_FETCH**: Asserts `ir_en` to load the current instruction from memory.
- **S_DECODE**: Holds lines steady for combinational address decoders.
- **S_EXECUTE**: Asserts write enables (`reg_we`, `mem_we`, `acc_en`) and selects arithmetic operation signals (`alu_op[2:0]`) to direct bus transfers.

## Inputs & Outputs

| Port Name | Bit Width | Type   | Description |
|-----------|-----------|--------|-------------|
| `clk`     | 1         | input  | Clock signal input |
| `rst_n`   | 1         | input  | Asynchronous active-low reset |
| `opcode`  | 4         | input  | 4-bit Opcode identifier from Instruction Decoder |
| `pc_en`   | 1         | output | Increments Program Counter |
| `pc_load` | 1         | output | Loads branch target to Program Counter |
| `ir_en`   | 1         | output | Latches Instruction Register |
| `reg_we`  | 1         | output | General Purpose Register File write enable |
| `acc_en`  | 1         | output | Accumulator write enable |
| `mem_we`  | 1         | output | External Data memory write enable |
| `alu_op`  | 3         | output | 3-bit ALU operation select |

## Block Description
- **FSM Sequencer**: 3-state sequencer driving execution scheduling:
  - `2'b00` (`S_FETCH`)
  - `2'b01` (`S_DECODE`)
  - `2'b10` (`S_EXECUTE`)
- **Control Signal Matrix**: Actively maps control outputs to CPU components based on decoded opcodes.

## Files Included
- `src/control_unit.v` (contains Verilog source code)
- `testbench/control_unit_tb.v` (contains self-checking testbench)
- `rtl/` (empty, schematic layout directory)
- `waveform/` (empty, simulation waveform directory)
