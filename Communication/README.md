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
| 2 | UART_RX | UART Serial Receiver | *TBD* |
| 3 | UART | Full-Duplex UART Transceiver | *TBD* |
| 4 | SPI_Master | SPI Serial Master Controller | *TBD* |
| 5 | SPI_Slave | SPI Serial Slave Interface | *TBD* |
| 6 | SPI | Full Loopback SPI Bus | *TBD* |
| 7 | I2C_Master | I2C Serial Master controller | *TBD* |
| 8 | I2C_Slave | I2C Serial Slave interface | *TBD* |
| 9 | I2C | Full Local Loopback I2C Bus | *TBD* |
