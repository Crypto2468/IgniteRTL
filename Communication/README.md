# Communication Protocols Portfolio

Welcome to the Communication Protocols section of the portfolio. This directory features synthesizable, industry-standard Verilog implementations of core digital communication buses and peripherals, including UART, SPI, and I2C controllers.

## Project Structure
Every Communication project subdirectory follows this unified self-contained folder structure:
```text
<Project_Name>/
├── src/            # Verilog source code (.v)
├── testbench/      # Testbench stimuli verification (.v)
├── rtl/            # RTL logic gate schematics (tracked via .gitkeep)
└── waveform/       # Simulation waveform screen captures (tracked via .gitkeep)
```

## Directory Index

| # | Project Folder | Description | Ports (I/O) |
|---|---|---|---|
| 1 | [UART_TX](file:///c:/Users/crypt/OneDrive/Documents/vhdl%20library/Digital-IC-Portfolio/Communication/UART_TX) | UART Serial Transmitter | `clk`, `rst_n`, `tx_start`, `din[7:0]` $\rightarrow$ `tx`, `tx_active`, `tx_done` |
| 2 | [UART_RX](file:///c:/Users/crypt/OneDrive/Documents/vhdl%20library/Digital-IC-Portfolio/Communication/UART_RX) | UART Serial Receiver | `clk`, `rst_n`, `rx` $\rightarrow$ `dout[7:0]`, `rx_done` |
| 3 | [UART](file:///c:/Users/crypt/OneDrive/Documents/vhdl%20library/Digital-IC-Portfolio/Communication/UART) | Full-Duplex UART Transceiver wrapper | `clk`, `rst_n`, `tx_start`, `tx_din[7:0]`, `rx` $\rightarrow$ `tx`, `tx_active`, `tx_done`, `rx_dout[7:0]`, `rx_done` |
| 4 | [SPI_Master](file:///c:/Users/crypt/OneDrive/Documents/vhdl%20library/Digital-IC-Portfolio/Communication/SPI_Master) | SPI Serial Master Controller (Mode 0) | `clk`, `rst_n`, `start`, `din[7:0]`, `miso` $\rightarrow$ `dout[7:0]`, `done`, `sclk`, `ss_n`, `mosi` |
| 5 | [SPI_Slave](file:///c:/Users/crypt/OneDrive/Documents/vhdl%20library/Digital-IC-Portfolio/Communication/SPI_Slave) | SPI Serial Slave Interface (Mode 0) | `rst_n`, `sclk`, `ss_n`, `mosi`, `tx_data[7:0]` $\rightarrow$ `miso`, `rx_data[7:0]`, `rx_done` |
| 6 | [SPI](file:///c:/Users/crypt/OneDrive/Documents/vhdl%20library/Digital-IC-Portfolio/Communication/SPI) | Local loopback SPI Bus system | `clk`, `rst_n`, `master_start`, `master_tx[7:0]`, `slave_tx[7:0]` $\rightarrow$ `master_rx[7:0]`, `master_done`, `slave_rx[7:0]`, `slave_done` |
| 7 | [I2C_Master](file:///c:/Users/crypt/OneDrive/Documents/vhdl%20library/Digital-IC-Portfolio/Communication/I2C_Master) | I2C Serial Master controller | `clk`, `rst_n`, `start`, `addr[6:0]`, `din[7:0]` $\rightarrow$ `done`, `ack_error`, `scl` (inout), `sda` (inout) |
| 8 | [I2C_Slave](file:///c:/Users/crypt/OneDrive/Documents/vhdl%20library/Digital-IC-Portfolio/Communication/I2C_Slave) | I2C Serial Slave interface | `rst_n`, `scl`, `sda` (inout) $\rightarrow$ `rx_data[7:0]`, `rx_done` |
| 9 | [I2C](file:///c:/Users/crypt/OneDrive/Documents/vhdl%20library/Digital-IC-Portfolio/Communication/I2C) | Local loopback I2C Bus system | `clk`, `rst_n`, `master_start`, `master_addr[6:0]`, `master_din[7:0]` $\rightarrow$ `master_done`, `master_ack_err`, `slave_rx[7:0]`, `slave_done` |
