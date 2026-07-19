# LIFO Stack

## Description
A 16-word synchronous Last-In First-Out (LIFO) Stack with an 8-bit data width (configured here as 8 words deep for lab visualization). Standard push and pop control signals manage stack depth, tracked by a stack pointer (`sp`).

## Block Description
- **Stack Pointer (sp)**: Points to the next empty stack slot. Increments on push, decrements on pop.
- **Top of Stack Readout**: Popping retrieves the last pushed byte.
- **Simultaneous Action Support**: Overwrites top element if push and pop are asserted concurrently.

## Memory Organization
- **Memory Depth**: 8 words.
- **Word Width**: 8 bits.
- **Total Capacity**: 64 bits.

## Inputs & Outputs

| Port Name | Bit Width | Type   | Description |
|-----------|-----------|--------|-------------|
| `clk`     | 1         | input  | Clock signal |
| `rst_n`   | 1         | input  | Asynchronous active-low reset |
| `push`    | 1         | input  | Push control active |
| `pop`     | 1         | input  | Pop control active |
| `din`     | 8         | input  | Data input vector |
| `dout`    | 8         | output | Data output register |
| `full`    | 1         | output | High when stack is full |
| `empty`   | 1         | output | High when stack is empty |

## Files Included
- `src/lifo_stack.v` (contains Verilog source code)
- `testbench/lifo_stack_tb.v` (contains self-checking testbench)
- `rtl/` (empty, schematic layout directory)
- `waveform/` (empty, simulation waveform directory)
