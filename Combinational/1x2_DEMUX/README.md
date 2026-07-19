# 🔁 1x2 Demultiplexer (1x2 DEMUX)

## 📝 Description
A 1x2 Demultiplexer (DEMUX) is a combinational logic circuit that routes a single binary input data signal (`i`) to one of two binary output channels (`y0`, `y1`) depending on the binary state of a select line (`sel`).

## 📋 Truth Table
| Input (`i`) | Select (`sel`) | Output `y1` | Output `y0` | Description |
|:-----------:|:--------------:|:-----------:|:-----------:|-------------|
|      0      |       0        |      0      |      0      | `y0` gets `i` (0) |
|      1      |       0        |      0      |      1      | `y0` gets `i` (1) |
|      0      |       1        |      0      |      0      | `y1` gets `i` (0) |
|      1      |       1        |      1      |      0      | `y1` gets `i` (1) |

## 🔹 Module I/O
| Port Name | Bit Width | Type   | Description |
|-----------|-----------|--------|-------------|
| `i`       | 1         | input  | Data input line |
| `sel`     | 1         | input  | Select control line |
| `y0`      | 1         | output | Output line 0 |
| `y1`      | 1         | output | Output line 1 |

## 📁 Files Included
- `src/` (contains Verilog source code)
- `testbench/` (contains self-checking testbench)
- `rtl/` (empty, schematic layout directory)
- `waveform/` (empty, simulation waveform directory)
