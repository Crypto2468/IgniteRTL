# SPI Loopback System

## Description
A system-level wrapper connecting the `spi_master` and `spi_slave` modules in a local loopback environment. It validates full-duplex synchronous data transmission between master and slave.

## Protocol Overview
The system establishes a 4-wire connection between master and slave:
- **sclk**: Serial clock driven by Master.
- **ss_n**: Active-low Chip Select driven by Master.
- **mosi**: Master-Out Slave-In serial data.
- **miso**: Master-In Slave-Out serial data.

## Inputs & Outputs

| Port Name | Bit Width | Type   | Description |
|-----------|-----------|--------|-------------|
| `clk`     | 1         | input  | Clock signal |
| `rst_n`   | 1         | input  | Asynchronous active-low reset |
| `master_start`| 1     | input  | Initiates SPI master serial transmission |
| `master_tx`| 8        | input  | Master transmit payload byte |
| `master_rx`| 8        | output | Master received payload byte |
| `master_done`| 1       | output | High when master transaction completes |
| `slave_tx`| 8         | input  | Slave prepare payload byte |
| `slave_rx`| 8         | output | Slave received payload byte |
| `slave_done`| 1        | output | High when slave transaction completes |

## Files Included
- `src/spi.v` (contains Verilog source code)
- `testbench/spi_tb.v` (contains self-checking testbench)
- `rtl/` (empty, schematic layout directory)
- `waveform/` (empty, simulation waveform directory)
