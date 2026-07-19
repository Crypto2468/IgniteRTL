# Dual-Port RAM

## Description
A 16-word synchronous Dual-Port Random Access Memory (RAM) with an 8-bit data width. It features two completely independent interfaces (Port A and Port B), allowing concurrent read and write operations at different memory locations.

## Block Description
- **Independent Ports**: Port A and Port B have dedicated control, address, and data vectors.
- **Concurrent Access Support**: Allows simultaneous reads and writes to different memory cells.
- **Synchronous Logic**: Both Port A and Port B perform memory transactions synced to the rising edge of the shared clock.

## Memory Organization
- **Memory Depth**: 16 words.
- **Word Width**: 8 bits.
- **Total Capacity**: 128 bits.

## Inputs & Outputs

| Port Name | Bit Width | Type   | Description |
|-----------|-----------|--------|-------------|
| `clk`     | 1         | input  | Shared Clock input |
| `we_a`    | 1         | input  | Port A Write Enable |
| `addr_a`  | 4         | input  | Port A 4-bit Address |
| `din_a`   | 8         | input  | Port A 8-bit Data input |
| `dout_a`  | 8         | output | Port A 8-bit Data output |
| `we_b`    | 1         | input  | Port B Write Enable |
| `addr_b`  | 4         | input  | Port B 4-bit Address |
| `din_b`   | 8         | input  | Port B 8-bit Data input |
| `dout_b`  | 8         | output | Port B 8-bit Data output |

## Files Included
- `src/dual_port_ram.v` (contains Verilog source code)
- `testbench/dual_port_ram_tb.v` (contains self-checking testbench)
- `rtl/` (empty, schematic layout directory)
- `waveform/` (empty, simulation waveform directory)
