# Memory Systems Portfolio

Welcome to the Memory Systems section of the portfolio. This folder contains synthesizable, industry-standard Verilog implementations of various memory structures including ROMs, Single/Dual-Port RAMs, FIFOs, LIFOs, Register Files, and SRAM blocks.

## Project Structure
Every Memory project subdirectory follows this unified self-contained folder structure:
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
| 1 | [ROM](file:///c:/Users/crypt/OneDrive/Documents/vhdl%20library/Digital-IC-Portfolio/Memory/ROM) | 16x8 Synchronous Read-Only Memory | `clk`, `en`, `addr[3:0]` $\rightarrow$ `data[7:0]` |
| 2 | [Single_Port_RAM](file:///c:/Users/crypt/OneDrive/Documents/vhdl%20library/Digital-IC-Portfolio/Memory/Single_Port_RAM) | 16x8 Synchronous Single-Port RAM | `clk`, `we`, `addr[3:0]`, `din[7:0]` $\rightarrow$ `dout[7:0]` |
| 3 | [Dual_Port_RAM](file:///c:/Users/crypt/OneDrive/Documents/vhdl%20library/Digital-IC-Portfolio/Memory/Dual_Port_RAM) | 16x8 Synchronous Dual-Port RAM | `clk`, `we_a`, `addr_a[3:0]`, `din_a[7:0]`, `dout_a[7:0]`, `we_b`, `addr_b[3:0]`, `din_b[7:0]`, `dout_b[7:0]` |
| 4 | [FIFO](file:///c:/Users/crypt/OneDrive/Documents/vhdl%20library/Digital-IC-Portfolio/Memory/FIFO) | 8x8 Synchronous Circular FIFO Queue | `clk`, `rst_n`, `wr_en`, `rd_en`, `din[7:0]` $\rightarrow$ `dout[7:0]`, `full`, `empty` |
| 5 | [LIFO_Stack](file:///c:/Users/crypt/OneDrive/Documents/vhdl%20library/Digital-IC-Portfolio/Memory/LIFO_Stack) | 8x8 Synchronous LIFO Stack Memory | `clk`, `rst_n`, `push`, `pop`, `din[7:0]` $\rightarrow$ `dout[7:0]`, `full`, `empty` |
| 6 | [Register_File](file:///c:/Users/crypt/OneDrive/Documents/vhdl%20library/Digital-IC-Portfolio/Memory/Register_File) | 8x8 Register File (1 write, 2 read ports) | `clk`, `rst_n`, `we`, `wr_addr[2:0]`, `wr_data[7:0]`, `rd_addr_a[2:0]`, `rd_addr_b[2:0]` $\rightarrow$ `rd_data_a[7:0]`, `rd_data_b[7:0]` |
| 7 | [SRAM](file:///c:/Users/crypt/OneDrive/Documents/vhdl%20library/Digital-IC-Portfolio/Memory/SRAM) | 16x8 Static RAM with Bidirectional Bus | `clk`, `cs_n`, `we_n`, `oe_n`, `addr[3:0]`, `data[7:0]` (bidirectional) |
