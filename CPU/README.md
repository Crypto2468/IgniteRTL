# Central Processing Unit (CPU) Subsystems Portfolio

Welcome to the CPU Subsystems section of the portfolio. This directory features synthesizable, undergraduate-level Verilog implementations of all building blocks necessary to construct a simple 8-bit RISC CPU core.

## Project Structure
Every CPU project subdirectory follows this unified self-contained folder structure:
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
| 1 | [Program_Counter](file:///c:/Users/crypt/OneDrive/Documents/vhdl%20library/Digital-IC-Portfolio/CPU/Program_Counter) | 8-bit Program Counter register | `clk`, `rst_n`, `en`, `load`, `din[7:0]` $\rightarrow$ `pc[7:0]` |
| 2 | Instruction_Register | Instruction load/store register | *TBD* |
| 3 | Register_File | GPR multi-port storage array | *TBD* |
| 4 | Accumulator | Intermediate ALU storage register | *TBD* |
| 5 | ALU_8bit | 8-bit Arithmetic Logic Unit | *TBD* |
| 6 | Control_Unit | FSM instruction scheduler | *TBD* |
| 7 | Sign_Extender | Bit expansion block | *TBD* |
| 8 | Instruction_Decoder | Opcode/Operand splitter | *TBD* |
| 9 | Multiplexer_Based_Control | Alternative control architecture | *TBD* |
| 10 | Simple_RISC_CPU | Assembled 8-bit RISC processor core | *TBD* |
