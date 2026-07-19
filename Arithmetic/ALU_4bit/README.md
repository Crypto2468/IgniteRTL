# 4-bit Arithmetic Logic Unit (ALU)

## Description
A 4-bit Arithmetic Logic Unit (ALU) is a combinational circuit that performs basic arithmetic and logical operations on two 4-bit input operands (`a[3:0]` and `b[3:0]`). The specific operation to execute is determined by a 3-bit control code (`op[2:0]`).

## Truth Table


## Module I/O
| Port Name | Bit Width | Type   | Description |
|-----------|-----------|--------|-------------|
| `a`       | 4         | input  | 4-bit Input Operand A |
| `b`       | 4         | input  | 4-bit Input Operand B |
| `op`      | 3         | input  | 3-bit Operation Select |
| `out`     | 4         | output | 4-bit ALU output result |
| `carry`   | 1         | output | Carry output (for addition) |

## Files Included
- `src/` (contains Verilog source code)
- `testbench/` (contains self-checking testbench)
- `rtl/` (empty, schematic layout directory)
- `waveform/` (empty, simulation waveform directory)
