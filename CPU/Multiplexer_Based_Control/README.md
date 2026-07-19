# 🎛️ Multiplexer-Based Control (Bus Selector)

## 📝 Description
A combinational multiplexer-based operand selector. It selects which data source (register file, accumulator, or sign-extended immediate) is routed to the ALU input based on control lines (`sel[1:0]`).

## ⚙️ Functional Overview
A CPU datapath requires flexible operand routing. For example, some instructions add two registers, while others add a register and an immediate constant. This Multiplexer acts as the bus router, redirecting data sources on-the-fly to ALU inputs during the Execution phase.

## 🔌 Inputs & Outputs

| Port Name | Bit Width | Type   | Description |
|-----------|-----------|--------|-------------|
| `sel`     | 2         | input  | 2-bit select lines from Control Unit |
| `reg_data`| 8         | input  | Data bus from General Purpose Register |
| `acc_data`| 8         | input  | Data bus from Accumulator register |
| `imm_data`| 8         | input  | Data bus from Immediate Extender |
| `mux_out` | 8         | output | Decoded operand routed to the ALU |

## 📦 Block Description
- **Routing Switch Matrix**: A 3-to-1 combinational multiplexer mapping:
  - `sel = 2'b00` -> `reg_data`
  - `sel = 2'b01` -> `acc_data`
  - `sel = 2'b10` -> `imm_data`

## 📁 Files Included
- `src/multiplexer_based_control.v` (contains Verilog source code)
- `testbench/multiplexer_based_control_tb.v` (contains self-checking testbench)
- `rtl/` (empty, schematic layout directory)
- `waveform/` (empty, simulation waveform directory)
