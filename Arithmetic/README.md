# Arithmetic Circuits Portfolio

Welcome to the Arithmetic Circuits section of the portfolio. This directory features fundamental binary and BCD arithmetic processing blocks implemented in synthesizable, beginner-friendly Verilog-2001.

## Project Structure
Every arithmetic module folder follows this strict self-contained layout:
```text
<Project_Name>/
├── src/            # Verilog source code (.v)
├── testbench/      # Testbench file for stimulus verification (.v)
├── rtl/            # RTL logic gate schematics (tracked via .gitkeep)
└── waveform/       # Simulation waveform screen captures (tracked via .gitkeep)
```

## Directory Index

| # | Project Folder | Description | Ports (I/O) |
|---|---|---|---|
| 1 | [Half_Adder](file:///c:/Users/crypt/OneDrive/Documents/vhdl%20library/Digital-IC-Portfolio/Arithmetic/Half_Adder) | 1-bit Half Adder | `a`, `b` $\rightarrow$ `sum`, `co` |
| 2 | [Full_Adder](file:///c:/Users/crypt/OneDrive/Documents/vhdl%20library/Digital-IC-Portfolio/Arithmetic/Full_Adder) | 1-bit Full Adder | `a`, `b`, `cin` $\rightarrow$ `sum`, `co` |
| 3 | [Half_Subtractor](file:///c:/Users/crypt/OneDrive/Documents/vhdl%20library/Digital-IC-Portfolio/Arithmetic/Half_Subtractor) | 1-bit Half Subtractor | `a`, `b` $\rightarrow$ `diff`, `borrow` |
| 4 | [Full_Subtractor](file:///c:/Users/crypt/OneDrive/Documents/vhdl%20library/Digital-IC-Portfolio/Arithmetic/Full_Subtractor) | 1-bit Full Subtractor | `a`, `b`, `bin` $\rightarrow$ `diff`, `bout` |
| 5 | [Ripple_Carry_Adder](file:///c:/Users/crypt/OneDrive/Documents/vhdl%20library/Digital-IC-Portfolio/Arithmetic/Ripple_Carry_Adder) | Parameterized N-bit Ripple Carry Adder | `a`, `b`, `cin` $\rightarrow$ `sum`, `cout` |
| 6 | [Carry_Lookahead_Adder](file:///c:/Users/crypt/OneDrive/Documents/vhdl%20library/Digital-IC-Portfolio/Arithmetic/Carry_Lookahead_Adder) | 4-bit Carry Lookahead Adder (Fast Adder) | `a`, `b`, `cin` $\rightarrow$ `sum`, `cout`, `pg`, `gg` |
| 7 | [Carry_Save_Adder](file:///c:/Users/crypt/OneDrive/Documents/vhdl%20library/Digital-IC-Portfolio/Arithmetic/Carry_Save_Adder) | N-bit 3:2 Carry Save Compressor | `x`, `y`, `z` $\rightarrow$ `sum`, `carry` |
| 8 | [Carry_Select_Adder](file:///c:/Users/crypt/OneDrive/Documents/vhdl%20library/Digital-IC-Portfolio/Arithmetic/Carry_Select_Adder) | 8-bit Carry Select Adder | `a`, `b`, `cin` $\rightarrow$ `sum`, `cout` |
| 9 | [BCD_Adder](file:///c:/Users/crypt/OneDrive/Documents/vhdl%20library/Digital-IC-Portfolio/Arithmetic/BCD_Adder) | 1-digit BCD Adder with correction | `a`, `b`, `cin` $\rightarrow$ `sum`, `cout` |
| 10 | [Array_Multiplier](file:///c:/Users/crypt/OneDrive/Documents/vhdl%20library/Digital-IC-Portfolio/Arithmetic/Array_Multiplier) | Parameterized Array Multiplier | `a`, `b` $\rightarrow$ `prod` |
| 11 | [Booth_Multiplier](file:///c:/Users/crypt/OneDrive/Documents/vhdl%20library/Digital-IC-Portfolio/Arithmetic/Booth_Multiplier) | Parameterized Sequential Radix-2 Booth Multiplier | `clk`, `rst`, `start`, `a`, `b` $\rightarrow$ `prod`, `done` |
| 12 | [Restoring_Divider](file:///c:/Users/crypt/OneDrive/Documents/vhdl%20library/Digital-IC-Portfolio/Arithmetic/Restoring_Divider) | Sequential Restoring Division FSM | `clk`, `rst`, `start`, `num`, `den` $\rightarrow$ `quo`, `rem`, `done`, `err` |
| 13 | [Non_Restoring_Divider](file:///c:/Users/crypt/OneDrive/Documents/vhdl%20library/Digital-IC-Portfolio/Arithmetic/Non_Restoring_Divider) | Sequential Non-Restoring Division FSM | `clk`, `rst`, `start`, `num`, `den` $\rightarrow$ `quo`, `rem`, `done`, `err` |
| 14 | [ALU_4bit](file:///c:/Users/crypt/OneDrive/Documents/vhdl%20library/Digital-IC-Portfolio/Arithmetic/ALU_4bit) | 4-bit 8-operation ALU | `a`, `b`, `op[2:0]` $\rightarrow$ `out`, `carry` |
