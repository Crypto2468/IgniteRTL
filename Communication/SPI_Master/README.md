# 🔌 SPI Master

## 📝 Description
A Serial Peripheral Interface (SPI) Master controller configured for Mode 0 (CPOL=0, CPHA=0). It serializes a parallel byte (`din[7:0]`) onto `mosi` MSB-first while capturing input bits from `miso` synchronized to the generated serial clock (`sclk`).

## 🌐 Protocol Overview
SPI is a synchronous, full-duplex, four-wire serial interface. In Mode 0:
- **CPOL = 0**: Clock idles low.
- **CPHA = 0**: Data is sampled on the first rising edge of `sclk` and shifted out on the subsequent falling edge.

## 🔌 Inputs & Outputs

| Port Name | Bit Width | Type   | Description |
|-----------|-----------|--------|-------------|
| `clk`     | 1         | input  | System clock input |
| `rst_n`   | 1         | input  | Asynchronous active-low reset |
| `start`   | 1         | input  | Start transmission strobe |
| `din`     | 8         | input  | 8-bit parallel byte to transmit |
| `dout`    | 8         | output | 8-bit parallel byte received |
| `done`    | 1         | output | Pulse when transaction finishes |
| `sclk`    | 1         | output | SPI Serial clock output |
| `ss_n`    | 1         | output | Active-low slave select |
| `mosi`    | 1         | output | Master-Out Slave-In serial output |
| `miso`    | 1         | input  | Master-In Slave-Out serial input |

## 📁 Files Included
- `src/spi_master.v` (contains Verilog source code)
- `testbench/spi_master_tb.v` (contains self-checking testbench)
- `rtl/` (empty, schematic layout directory)
- `waveform/` (empty, simulation waveform directory)
