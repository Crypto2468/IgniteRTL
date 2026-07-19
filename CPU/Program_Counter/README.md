# Program Counter (PC)

## Description
An 8-bit synchronous Program Counter (PC) register. It tracks instruction execution addresses in a CPU system, providing asynchronous active-low reset initialization, normal count increments, and load capabilities for branch or jump instruction executions.

## Functional Overview
The Program Counter (PC) acts as the pointer to the next instruction in program memory. During normal instruction execution, it increments sequentially. When a jump, branch, or sub-routine call instruction is executed, the control unit asserts `load`, driving a new branch target address into the register.

## Inputs & Outputs

| Port Name | Bit Width | Type   | Description |
|-----------|-----------|--------|-------------|
| `clk`     | 1         | input  | System clock |
| `rst_n`   | 1         | input  | Asynchronous active-low reset |
| `en`      | 1         | input  | Count Enable control line |
| `load`    | 1         | input  | Branch/Jump target load control |
| `din`     | 8         | input  | 8-bit branch/jump target address vector |
| `pc`      | 8         | output | 8-bit current program pointer output |

## Block Description
- **Asynchronous Reset**: Activating `rst_n` clears the PC output immediately to `8'h00`.
- **Parallel Load Register**: If `load = 1`, the PC register is loaded with the address present on `din[7:0]` on the rising clock edge.
- **Incrementer**: If `en = 1` and `load = 0`, the PC increments by 1 (`pc <= pc + 1`) on the rising clock edge.
- **D-Register Latches**: If both `en` and `load` are low, the PC holds its current state.

## Files Included
- `src/program_counter.v` (contains Verilog source code)
- `testbench/program_counter_tb.v` (contains self-checking testbench)
- `rtl/` (empty, schematic layout directory)
- `waveform/` (empty, simulation waveform directory)
