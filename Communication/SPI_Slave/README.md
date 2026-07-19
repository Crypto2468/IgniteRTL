# SPI Slave

## Description
A Serial Peripheral Interface (SPI) Slave operating in Mode 0 (CPOL=0, CPHA=0). It listens for serial clock (`sclk`) and active-low chip select (`ss_n`) pulses driven by a master. It samples `mosi` on rising edges and drives `miso` on falling edges.

## Inputs & Outputs

| Port Name | Bit Width | Type   | Description |
|-----------|-----------|--------|-------------|
| `rst_n`   | 1         | input  | Asynchronous active-low reset |
| `sclk`    | 1         | input  | SPI serial clock line input |
| `ss_n`    | 1         | input  | Active-low slave select input |
| `mosi`    | 1         | input  | Master-Out Slave-In serial input |
| `miso`    | 1         | output | Master-In Slave-Out serial output |
| `tx_data` | 8         | input  | 8-bit parallel byte to prepare for master |
| `rx_data` | 8         | output | 8-bit parallel byte read from master |
| `rx_done` | 1         | output | High for one cycle when transaction completes |

## Files Included
- `src/spi_slave.v` (contains Verilog source code)
- `testbench/spi_slave_tb.v` (contains self-checking testbench)
- `rtl/` (empty, schematic layout directory)
- `waveform/` (empty, simulation waveform directory)
