# Static RAM (SRAM)

## Description
A 16-word Static RAM (SRAM) with an 8-bit bidirectional data bus. It implements active-low control inputs standard in industrial asynchronous SRAM chips: Chip Select (`cs_n`), Write Enable (`we_n`), and Output Enable (`oe_n`).

## Block Description
- **Bidirectional Bus**: A shared `inout` data pinout driven via tri-state buffers.
- **Write Control**: Occurs on the clock edge when `cs_n = 0` and `we_n = 0`.
- **Read Control**: Enabled when `cs_n = 0`, `oe_n = 0`, and `we_n = 1`, driving read data onto the bus.

## Memory Organization
- **Memory Depth**: 16 words.
- **Word Width**: 8 bits.
- **Total Capacity**: 128 bits.

## Inputs & Outputs

| Port Name | Bit Width | Type   | Description |
|-----------|-----------|--------|-------------|
| `clk`     | 1         | input  | System Clock |
| `cs_n`    | 1         | input  | Chip Select (Active-low) |
| `we_n`    | 1         | input  | Write Enable (Active-low) |
| `oe_n`    | 1         | input  | Output Enable (Active-low) |
| `addr`    | 4         | input  | 4-bit Address lookup vector |
| `data`    | 8         | inout  | 8-bit Bidirectional Data Bus |

## Files Included
- `src/sram.v` (contains Verilog source code)
- `testbench/sram_tb.v` (contains self-checking testbench)
- `rtl/` (empty, schematic layout directory)
- `waveform/` (empty, simulation waveform directory)
