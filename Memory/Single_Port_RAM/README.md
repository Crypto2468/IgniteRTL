# Single-Port RAM

## Description
A 16-word synchronous Single-Port Random Access Memory (RAM) with an 8-bit data width. It features a shared address bus for both write and read operations. Reads and writes occur synchronously on the rising edge of the clock.

## Block Description
- **Shared Address Bus**: Address decoding (`addr[3:0]`) is shared between read and write logic.
- **Write Logic**: When Write Enable (`we`) is high, input data (`din`) is stored at the active address on the clock edge.
- **Read Logic**: Reads are registered, with output `dout` updating on the clock edge.

## Memory Organization
- **Memory Depth**: 16 words (addressed using a 4-bit input `addr[3:0]`).
- **Word Width**: 8 bits (`din[7:0]` and `dout[7:0]`).
- **Total Capacity**: 128 bits.

## Inputs & Outputs

| Port Name | Bit Width | Type   | Description |
|-----------|-----------|--------|-------------|
| `clk`     | 1         | input  | Clock input |
| `we`      | 1         | input  | Write Enable control line |
| `addr`    | 4         | input  | 4-bit memory address input |
| `din`     | 8         | input  | 8-bit data write vector |
| `dout`    | 8         | output | 8-bit registered data read vector |

## Files Included
- `src/single_port_ram.v` (contains Verilog source code)
- `testbench/single_port_ram_tb.v` (contains self-checking testbench)
- `rtl/` (empty, schematic layout directory)
- `waveform/` (empty, simulation waveform directory)
