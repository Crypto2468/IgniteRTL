# ⚙️ 8-Bit Arithmetic Logic Unit (ALU_8bit)

## 📝 Description
An 8-bit combinational Arithmetic Logic Unit (ALU). It performs fundamental calculations including addition, subtraction, bitwise logic operations, and bit shifting based on a 3-bit operational code (`op_sel[2:0]`).

## ⚙️ Functional Overview
The ALU is the mathematical heart of the CPU. It receives operands from the Register File or intermediate busses, executes the operation selected by the Control Unit, and updates status flags (`zero`, `carry`) to guide conditional branch logic.

## 🔌 Inputs & Outputs

| Port Name | Bit Width | Type   | Description |
|-----------|-----------|--------|-------------|
| `op_sel`  | 3         | input  | 3-bit Operation select |
| `a`       | 8         | input  | 8-bit Input operand A |
| `b`       | 8         | input  | 8-bit Input operand B |
| `result`  | 8         | output | 8-bit Calculation output |
| `zero`    | 1         | output | High if output `result` matches `8'h00` |
| `carry`   | 1         | output | Carry output (addition overflow flag) |

## 📦 Block Description
- **Combinational ALU Core**: Fully combinational execution path utilizing a `case` statement mapping:
  - `3'b000`: Addition (`a + b`)
  - `3'b001`: Subtraction (`a - b`)
  - `3'b010`: Bitwise AND (`a & b`)
  - `3'b011`: Bitwise OR (`a | b`)
  - `3'b100`: Bitwise XOR (`a ^ b`)
  - `3'b101`: Bitwise NOT (`~a`)
  - `3'b110`: Shift Left (`a << 1`)
  - `3'b111`: Shift Right (`a >> 1`)

## 📁 Files Included
- `src/alu_8bit.v` (contains Verilog source code)
- `testbench/alu_8bit_tb.v` (contains self-checking testbench)
- `rtl/` (empty, schematic layout directory)
- `waveform/` (empty, simulation waveform directory)
