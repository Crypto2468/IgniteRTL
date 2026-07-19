# ⏳ Sequential Logic Portfolio

Welcome to the Sequential Logic section of the portfolio. This folder contains synthesizable, beginner-friendly Verilog-2001 implementations of basic memory elements (latches, flip-flops), registers, shift registers, and counters.

## 📂 Project Structure
Every sequential logic project subdirectory follows this unified self-contained folder structure:
```text
<Project_Name>/
├── src/            # Verilog source code (.v)
├── testbench/      # Testbench stimuli verification (.v)
├── rtl/            # RTL logic gate schematics (tracked via .gitkeep)
└── waveform/       # Simulation waveform screen captures (tracked via .gitkeep)
```

## 📖 Directory Index

| # | Project Folder | Description | Ports (I/O) |
|---|---|---|---|
| 1 | [SR_Latch/NAND](file:///c:/Users/crypt/OneDrive/Documents/vhdl%20library/Digital-IC-Portfolio/Sequential/SR_Latch/NAND) | NAND active-low SR Latch | `s_n`, `r_n` $\rightarrow$ `q`, `q_n` |
| 2 | [SR_Latch/NOR](file:///c:/Users/crypt/OneDrive/Documents/vhdl%20library/Digital-IC-Portfolio/Sequential/SR_Latch/NOR) | NOR active-high SR Latch | `s`, `r` $\rightarrow$ `q`, `q_n` |
| 3 | [SR_FlipFlop/NAND](file:///c:/Users/crypt/OneDrive/Documents/vhdl%20library/Digital-IC-Portfolio/Sequential/SR_FlipFlop/NAND) | Master-Slave clocked NAND SR Flip-Flop | `clk`, `s`, `r` $\rightarrow$ `q`, `q_n` |
| 4 | [SR_FlipFlop/NOR](file:///c:/Users/crypt/OneDrive/Documents/vhdl%20library/Digital-IC-Portfolio/Sequential/SR_FlipFlop/NOR) | Master-Slave clocked NOR SR Flip-Flop | `clk`, `s`, `r` $\rightarrow$ `q`, `q_n` |
| 5 | [JK_FlipFlop](file:///c:/Users/crypt/OneDrive/Documents/vhdl%20library/Digital-IC-Portfolio/Sequential/JK_FlipFlop) | Edge-triggered JK Flip-Flop with toggle mode | `clk`, `rst`, `j`, `k` $\rightarrow$ `q`, `q_n` |
| 6 | [D_Latch/NAND](file:///c:/Users/crypt/OneDrive/Documents/vhdl%20library/Digital-IC-Portfolio/Sequential/D_Latch/NAND) | NAND gated D Latch (transparent) | `d`, `en` $\rightarrow$ `q`, `q_n` |
| 7 | [D_Latch/NOR](file:///c:/Users/crypt/OneDrive/Documents/vhdl%20library/Digital-IC-Portfolio/Sequential/D_Latch/NOR) | NOR gated D Latch (transparent) | `d`, `en` $\rightarrow$ `q`, `q_n` |
| 8 | [D_FlipFlop](file:///c:/Users/crypt/OneDrive/Documents/vhdl%20library/Digital-IC-Portfolio/Sequential/D_FlipFlop) | Edge-triggered D Flip-Flop with asynchronous reset | `clk`, `rst_n`, `d` $\rightarrow$ `q`, `q_n` |
| 9 | [T_FlipFlop](file:///c:/Users/crypt/OneDrive/Documents/vhdl%20library/Digital-IC-Portfolio/Sequential/T_FlipFlop) | Edge-triggered Toggle Flip-Flop | `clk`, `rst_n`, `t` $\rightarrow$ `q`, `q_n` |
| 10 | [Register_4bit](file:///c:/Users/crypt/OneDrive/Documents/vhdl%20library/Digital-IC-Portfolio/Sequential/Register_4bit) | 4-bit Parallel Register with load enable | `clk`, `rst_n`, `load`, `d[3:0]` $\rightarrow$ `q[3:0]` |
| 11 | [Universal_Shift_Register](file:///c:/Users/crypt/OneDrive/Documents/vhdl%20library/Digital-IC-Portfolio/Sequential/Universal_Shift_Register) | 4-bit Bidirectional Universal Shift Register | `clk`, `rst_n`, `mode[1:0]`, `srin`, `slin`, `d[3:0]` $\rightarrow$ `q[3:0]` |
| 12 | [SISO_Shift_Register](file:///c:/Users/crypt/OneDrive/Documents/vhdl%20library/Digital-IC-Portfolio/Sequential/SISO_Shift_Register) | 4-bit Serial-In Serial-Out Shift Register | `clk`, `rst_n`, `si` $\rightarrow$ `so` |
| 13 | [SIPO_Shift_Register](file:///c:/Users/crypt/OneDrive/Documents/vhdl%20library/Digital-IC-Portfolio/Sequential/SIPO_Shift_Register) | 4-bit Serial-In Parallel-Out Shift Register | `clk`, `rst_n`, `si` $\rightarrow$ `po[3:0]` |
| 14 | [PISO_Shift_Register](file:///c:/Users/crypt/OneDrive/Documents/vhdl%20library/Digital-IC-Portfolio/Sequential/PISO_Shift_Register) | 4-bit Parallel-In Serial-Out Shift Register | `clk`, `rst_n`, `load_shift`, `pi[3:0]` $\rightarrow$ `so` |
| 15 | [PIPO_Shift_Register](file:///c:/Users/crypt/OneDrive/Documents/vhdl%20library/Digital-IC-Portfolio/Sequential/PIPO_Shift_Register) | 4-bit Parallel-In Parallel-Out Register | `clk`, `rst_n`, `pi[3:0]` $\rightarrow$ `po[3:0]` |
| 16 | [Ring_Counter](file:///c:/Users/crypt/OneDrive/Documents/vhdl%20library/Digital-IC-Portfolio/Sequential/Ring_Counter) | 4-bit Circular Ring Counter | `clk`, `rst_n` $\rightarrow$ `q[3:0]` |
| 17 | [Johnson_Counter](file:///c:/Users/crypt/OneDrive/Documents/vhdl%20library/Digital-IC-Portfolio/Sequential/Johnson_Counter) | 4-bit Switch-Tail Johnson Counter | `clk`, `rst_n` $\rightarrow$ `q[3:0]` |
| 18 | [Asynchronous_Up_Counter](file:///c:/Users/crypt/OneDrive/Documents/vhdl%20library/Digital-IC-Portfolio/Sequential/Asynchronous_Up_Counter) | 4-bit Ripple Up Counter using T-FF cells | `clk`, `rst_n` $\rightarrow$ `q[3:0]` |
| 19 | [Asynchronous_Down_Counter](file:///c:/Users/crypt/OneDrive/Documents/vhdl%20library/Digital-IC-Portfolio/Sequential/Asynchronous_Down_Counter) | 4-bit Ripple Down Counter using T-FF cells | `clk`, `rst_n` $\rightarrow$ `q[3:0]` |
| 20 | [Synchronous_Up_Counter](file:///c:/Users/crypt/OneDrive/Documents/vhdl%20library/Digital-IC-Portfolio/Sequential/Synchronous_Up_Counter) | 4-bit Synchronous Up Counter | `clk`, `rst_n` $\rightarrow$ `q[3:0]` |
| 21 | [Synchronous_Down_Counter](file:///c:/Users/crypt/OneDrive/Documents/vhdl%20library/Digital-IC-Portfolio/Sequential/Synchronous_Down_Counter) | 4-bit Synchronous Down Counter | `clk`, `rst_n` $\rightarrow$ `q[3:0]` |
| 22 | [Up_Down_Counter](file:///c:/Users/crypt/OneDrive/Documents/vhdl%20library/Digital-IC-Portfolio/Sequential/Up_Down_Counter) | 4-bit Synchronous Up/Down Counter | `clk`, `rst_n`, `up_down` $\rightarrow$ `q[3:0]` |
