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
| 2 | Single_Port_RAM | Single-Port Random Access Memory | *TBD* |
| 3 | Dual_Port_RAM | Dual-Port Random Access Memory | *TBD* |
| 4 | FIFO | First-In First-Out Queue | *TBD* |
| 5 | LIFO_Stack | Last-In First-Out Stack | *TBD* |
| 6 | Register_File | MIPS/RISC-V-like Register File | *TBD* |
| 7 | SRAM | Static Random Access Memory | *TBD* |
