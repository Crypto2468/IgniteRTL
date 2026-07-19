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
| 2 | [Instruction_Register](file:///c:/Users/crypt/OneDrive/Documents/vhdl%20library/Digital-IC-Portfolio/CPU/Instruction_Register) | Instruction load/store register | `clk`, `rst_n`, `ir_enable`, `din[15:0]` $\rightarrow$ `instr[15:0]` |
| 3 | [Register_File](file:///c:/Users/crypt/OneDrive/Documents/vhdl%20library/Digital-IC-Portfolio/CPU/Register_File) | GPR multi-port storage array | `clk`, `rst_n`, `we`, `wr_addr[1:0]`, `wr_data[7:0]`, `rd_addr_a[1:0]`, `rd_addr_b[1:0]` $\rightarrow$ `rd_data_a[7:0]`, `rd_data_b[7:0]` |
| 4 | [Accumulator](file:///c:/Users/crypt/OneDrive/Documents/vhdl%20library/Digital-IC-Portfolio/CPU/Accumulator) | Intermediate ALU storage register | `clk`, `rst_n`, `en`, `din[7:0]` $\rightarrow$ `dout[7:0]` |
| 5 | [ALU_8bit](file:///c:/Users/crypt/OneDrive/Documents/vhdl%20library/Digital-IC-Portfolio/CPU/ALU_8bit) | 8-bit Arithmetic Logic Unit | `op_sel[2:0]`, `a[7:0]`, `b[7:0]` $\rightarrow$ `result[7:0]`, `zero`, `carry` |
| 6 | [Control_Unit](file:///c:/Users/crypt/OneDrive/Documents/vhdl%20library/Digital-IC-Portfolio/CPU/Control_Unit) | FSM instruction scheduler | `clk`, `rst_n`, `opcode[3:0]` $\rightarrow$ `pc_en`, `pc_load`, `ir_en`, `reg_we`, `acc_en`, `mem_we`, `alu_op[2:0]` |
| 7 | [Sign_Extender](file:///c:/Users/crypt/OneDrive/Documents/vhdl%20library/Digital-IC-Portfolio/CPU/Sign_Extender) | Bit expansion block | `din[3:0]` $\rightarrow$ `dout[7:0]` |
| 8 | [Instruction_Decoder](file:///c:/Users/crypt/OneDrive/Documents/vhdl%20library/Digital-IC-Portfolio/CPU/Instruction_Decoder) | Opcode/Operand splitter | `instr[15:0]` $\rightarrow$ `opcode[3:0]`, `rd[1:0]`, `rs[1:0]`, `imm[7:0]` |
| 9 | [Multiplexer_Based_Control](file:///c:/Users/crypt/OneDrive/Documents/vhdl%20library/Digital-IC-Portfolio/CPU/Multiplexer_Based_Control) | MUX-based routing selector | `sel[1:0]`, `reg_data[7:0]`, `acc_data[7:0]`, `imm_data[7:0]` $\rightarrow$ `mux_out[7:0]` |
| 10 | [Simple_RISC_CPU](file:///c:/Users/crypt/OneDrive/Documents/vhdl%20library/Digital-IC-Portfolio/CPU/Simple_RISC_CPU) | Assembled 8-bit RISC processor core | `clk`, `rst_n` $\rightarrow$ `pc_out[7:0]` |
