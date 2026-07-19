# 📓 Combinational Circuits Portfolio

Welcome to the Combinational Circuits section of the portfolio. This folder contains beginner-friendly, synthesizable Verilog-2001 implementations of essential combinational logic blocks. Each project is fully self-contained with source code, testbenches, and documentation.

## 📂 Project Structure
Each project subdirectory follows this clean folder layout:
```text
<Project_Name>/
├── src/          # Verilog source code (.v)
├── testbench/    # Testbench stimuli verification (.v)
├── waveform/     # Simulation waveform output directory
└── rtl/          # RTL gate schematics output directory
```

## 📖 Directory Index

| # | Project Folder | Description | Ports (I/O) |
|---|---|---|---|
| 1 | [2x1_MUX](file:///c:/Users/crypt/OneDrive/Documents/vhdl%20library/Digital-IC-Portfolio/Combinational/2x1_MUX) | 2-to-1 Multiplexer | `i0`, `i1`, `sel` $\rightarrow$ `y` |
| 2 | [4x1_MUX](file:///c:/Users/crypt/OneDrive/Documents/vhdl%20library/Digital-IC-Portfolio/Combinational/4x1_MUX) | 4-to-1 Multiplexer | `i0`, `i1`, `i2`, `i3`, `sel[1:0]` $\rightarrow$ `y` |
| 3 | [8x1_MUX](file:///c:/Users/crypt/OneDrive/Documents/vhdl%20library/Digital-IC-Portfolio/Combinational/8x1_MUX) | 8-to-1 Multiplexer | `i0` to `i7`, `sel[2:0]` $\rightarrow$ `y` |
| 4 | [1x2_DEMUX](file:///c:/Users/crypt/OneDrive/Documents/vhdl%20library/Digital-IC-Portfolio/Combinational/1x2_DEMUX) | 1-to-2 Demultiplexer | `i`, `sel` $\rightarrow$ `y0`, `y1` |
| 5 | [1x4_DEMUX](file:///c:/Users/crypt/OneDrive/Documents/vhdl%20library/Digital-IC-Portfolio/Combinational/1x4_DEMUX) | 1-to-4 Demultiplexer | `i`, `sel[1:0]` $\rightarrow$ `y0` to `y3` |
| 6 | [Encoder_4x2](file:///c:/Users/crypt/OneDrive/Documents/vhdl%20library/Digital-IC-Portfolio/Combinational/Encoder_4x2) | 4-to-2 Binary Encoder | `i0` to `i3` $\rightarrow$ `y[1:0]` |
| 7 | [Priority_Encoder_4x2](file:///c:/Users/crypt/OneDrive/Documents/vhdl%20library/Digital-IC-Portfolio/Combinational/Priority_Encoder_4x2) | 4-to-2 Priority Encoder | `i0` to `i3` $\rightarrow$ `y[1:0]`, `v` (valid) |
| 8 | [Decoder_2x4](file:///c:/Users/crypt/OneDrive/Documents/vhdl%20library/Digital-IC-Portfolio/Combinational/Decoder_2x4) | 2-to-4 Decoder | `a[1:0]`, `en` $\rightarrow$ `y0` to `y3` |
| 9 | [Decoder_3x8](file:///c:/Users/crypt/OneDrive/Documents/vhdl%20library/Digital-IC-Portfolio/Combinational/Decoder_3x8) | 3-to-8 Decoder | `a[2:0]`, `en` $\rightarrow$ `y0` to `y7` |
| 10 | [Comparator_1bit](file:///c:/Users/crypt/OneDrive/Documents/vhdl%20library/Digital-IC-Portfolio/Combinational/Comparator_1bit) | 1-bit Magnitude Comparator | `a`, `b` $\rightarrow$ `a_eq_b`, `a_gt_b`, `a_lt_b` |
| 11 | [Comparator_2bit](file:///c:/Users/crypt/OneDrive/Documents/vhdl%20library/Digital-IC-Portfolio/Combinational/Comparator_2bit) | 2-bit Magnitude Comparator | `a[1:0]`, `b[1:0]` $\rightarrow$ `a_eq_b`, `a_gt_b`, `a_lt_b` |
| 12 | [Comparator_4bit](file:///c:/Users/crypt/OneDrive/Documents/vhdl%20library/Digital-IC-Portfolio/Combinational/Comparator_4bit) | 4-bit Magnitude Comparator | `a[3:0]`, `b[3:0]` $\rightarrow$ `a_eq_b`, `a_gt_b`, `a_lt_b` |
| 13 | [BCD_to_7Segment](file:///c:/Users/crypt/OneDrive/Documents/vhdl%20library/Digital-IC-Portfolio/Combinational/BCD_to_7Segment) | BCD to 7-Segment Decoder | `bcd[3:0]` $\rightarrow$ `seg[6:0]` (`g` to `a`) |
| 14 | [Binary_to_Gray](file:///c:/Users/crypt/OneDrive/Documents/vhdl%20library/Digital-IC-Portfolio/Combinational/Binary_to_Gray) | Binary to Gray Code Converter | `bin[3:0]` $\rightarrow$ `gray[3:0]` |
| 15 | [Gray_to_Binary](file:///c:/Users/crypt/OneDrive/Documents/vhdl%20library/Digital-IC-Portfolio/Combinational/Gray_to_Binary) | Gray to Binary Code Converter | `gray[3:0]` $\rightarrow$ `bin[3:0]` |
| 16 | [Parity_Generator](file:///c:/Users/crypt/OneDrive/Documents/vhdl%20library/Digital-IC-Portfolio/Combinational/Parity_Generator) | Even/Odd Parity Generator | `data_in[3:0]` $\rightarrow$ `parity_even`, `parity_odd` |
| 17 | [Parity_Checker](file:///c:/Users/crypt/OneDrive/Documents/vhdl%20library/Digital-IC-Portfolio/Combinational/Parity_Checker) | Even Parity Checker | `data_in[3:0]`, `parity` $\rightarrow$ `error` |

---

## 🔹 Coding Guidelines Met
1. **Verilog-2001**: Pure dataflow and behavioral designs without SystemVerilog primitives.
2. **Beginner-Friendly**: Avoided excessive nesting or compact math; used basic select cases and conditional assignments.
3. **Structured Comments**: Every file starts with standard tags (`// Module:`, `// Description:`, `// Author:`).
4. **Simple Testbenches**: Used basic linear stimulus blocks, `$monitor` consoles, and `#10` delays mimicking introductory lab manuals.
