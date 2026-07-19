# 🔐 4x2 Binary Encoder

## 📝 Description
A 4x2 Binary Encoder is a combinational logic circuit that performs the reverse operation of a decoder. It takes four binary input lines (`i0` to `i3`) and generates a 2-bit binary output code (`y[1:0]`) representing the active input line, assuming only one input line is active (high) at any given time.

## 📋 Truth Table
| Input `i3` | Input `i2` | Input `i1` | Input `i0` | Output `y[1]` | Output `y[0]` | Description |
|:----------:|:----------:|:----------:|:----------:|:------------:|:------------:|-------------|
|     0      |     0      |     0      |     1      |      0       |      0       | encodes `i0` |
|     0      |     0      |     1      |     0      |      0       |      1       | encodes `i1` |
|     0      |     1      |     0      |     0      |      1       |      0       | encodes `i2` |
|     1      |     0      |     0      |     0      |      1       |      1       | encodes `i3` |

## 🔹 Module I/O
| Port Name | Bit Width | Type   | Description |
|-----------|-----------|--------|-------------|
| `i0`      | 1         | input  | Input line 0 |
| `i1`      | 1         | input  | Input line 1 |
| `i2`      | 1         | input  | Input line 2 |
| `i3`      | 1         | input  | Input line 3 |
| `y`       | 2         | output | 2-bit encoded binary output (`y[1]`, `y[0]`) |

## 📁 Files Included
- `src/` (contains Verilog source code)
- `testbench/` (contains self-checking testbench)
- `rtl/` (empty, schematic layout directory)
- `waveform/` (empty, simulation waveform directory)
