# Register File

## Description
An 8-word CPU register file with one write port and two read ports (8 registers, each 8 bits wide). It enables simultaneous reads from two registers combinationally (asynchronously) while writing to a register synchronously.

## Block Description
- **Combinational Reads**: Multi-port read access outputs data instantly depending on addresses `rd_addr_a` and `rd_addr_b`.
- **Synchronous Write**: Writing updates registers on the clock edge when write enable `we` is asserted.
- **Reset Logic**: Activating active-low reset clears all registers to `8'h00`.

## Memory Organization
- **Memory Depth**: 8 registers.
- **Word Width**: 8 bits.
- **Total Capacity**: 64 bits.

## Inputs & Outputs

| Port Name | Bit Width | Type   | Description |
|-----------|-----------|--------|-------------|
| `clk`     | 1         | input  | Clock signal |
| `rst_n`   | 1         | input  | Asynchronous active-low reset |
| `we`      | 1         | input  | Write Enable control line |
| `wr_addr` | 3         | input  | 3-bit Write Address |
| `wr_data` | 8         | input  | 8-bit Write Data |
| `rd_addr_a`| 3        | input  | 3-bit Read Address A |
| `rd_addr_b`| 3        | input  | 3-bit Read Address B |
| `rd_data_a`| 8        | output | 8-bit Read Data A |
| `rd_data_b`| 8        | output | 8-bit Read Data B |

## Files Included
- `src/register_file.v` (contains Verilog source code)
- `testbench/register_file_tb.v` (contains self-checking testbench)
- `rtl/` (empty, schematic layout directory)
- `waveform/` (empty, simulation waveform directory)
