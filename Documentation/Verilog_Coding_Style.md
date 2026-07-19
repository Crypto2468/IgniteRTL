# Verilog Coding Style Guide

This repository follows a clean, standardized coding convention matching academic guidelines and industry design best practices.

## Naming Conventions
- **Modules**: Lowercase words separated by underscores (snake_case), e.g. `half_adder.v`.
- **Registers and Wires**: Snake_case format with clear descriptive prefixes (e.g., `rst_n` for active-low resets, `clk` for clocks).
- **Constants and Parameters**: Uppercase names, e.g., `parameter CLKS_PER_BIT = 8`.
- **Testbenches**: Suffix `_tb` appended to the target module name, e.g., `half_adder_tb.v`.

## Module Structure
Each module follows a structured layout:
1. **Header Block**: Comments indicating module name, brief description, and author.
2. **Module Port Declarations**: Port variables grouped by direction (inputs first, then outputs).
3. **Internal Variables**: Register (`reg`) and wire definitions.
4. **Logic Blocks**: Instantiations, assignment lines, and clocked sequential execution blocks.

## Indentation
- Use 4 spaces per indentation level.
- Do not use tabs to ensure alignment is identical across various editors.

## Comment Style
- Use single-line comments (`//`) to document logic equations or FSM state maps.
- Do not include excessive comments for self-explanatory statements.

## Coding Guidelines Followed
- **Synthesizable Code**: Avoid using non-synthesizable keywords like `#` inside target modules (time delays are only allowed inside simulation testbenches).
- **Non-Blocking Assignments (`<=`)**: Used exclusively inside clocked sequential `always @(posedge clk)` blocks to prevent race conditions.
- **Blocking Assignments (`=`)**: Used inside combinational logic blocks `always @(*)` to ensure immediate calculations.
