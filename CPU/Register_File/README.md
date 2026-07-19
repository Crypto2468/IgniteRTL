# General Purpose Register File

## Description
A 4-word General Purpose Register (GPR) file with 8-bit word width. It features one write port and two read ports, enabling simultaneous, asynchronous read access from two distinct registers while allowing synchronous register updates.

## Functional Overview
In a RISC processor, the Register File stores operands for the ALU. The two asynchronous read ports allow the ALU operands to be fetched combinationally. The write port writes back the calculated result on the rising clock edge at the end of the execution cycle.

## Inputs & Outputs

| Port Name | Bit Width | Type   | Description |
|-----------|-----------|--------|-------------|
| `clk`     | 1         | input  | Clock signal |
| `rst_n`   | 1         | input  | Asynchronous active-low reset |
| `we`      | 1         | input  | Write Enable control line |
| `wr_addr` | 2         | input  | 2-bit Write destination address |
| `wr_data` | 8         | input  | 8-bit Write data vector |
| `rd_addr_a`| 2        | input  | 2-bit Port A Read source address |
| `rd_addr_b`| 2        | input  | 2-bit Port B Read source address |
| `rd_data_a`| 8        | output | 8-bit Port A data output |
| `rd_data_b`| 8        | output | 8-bit Port B data output |

## Block Description
- **Array Architecture**: Consists of four registers, each 8-bits wide (`regs[0]` to `regs[3]`).
- **Synchronous Write**: Registers update on positive clock edges when write enable `we` is high.
- **Asynchronous Reads**: Read operations are combinationally mapped, driving `rd_data_a` and `rd_data_b` instantly when addresses change.

## Files Included
- `src/register_file.v` (contains Verilog source code)
- `testbench/register_file_tb.v` (contains self-checking testbench)
- `rtl/` (empty, schematic layout directory)
- `waveform/` (empty, simulation waveform directory)
