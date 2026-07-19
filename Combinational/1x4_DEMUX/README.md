# 🔁 1x4 Demultiplexer (1x4 DEMUX)

## 📝 Description
A 1x4 Demultiplexer (DEMUX) is a combinational logic circuit that routes a single binary input signal (`i`) to one of four binary output channels (`y0` to `y3`) depending on the binary state of two select lines (`sel[1:0]`).

## 📋 Truth Table
| Input (`i`) | Select (`sel[1]`, `sel[0]`) | Output `y3` | Output `y2` | Output `y1` | Output `y0` | Description |
|:-----------:|:--------------------------:|:-----------:|:-----------:|:-----------:|:-----------:|-------------|
|      1      |             00             |      0      |      0      |      0      |      1      | `y0` gets `i` |
|      1      |             01             |      0      |      0      |      1      |      0      | `y1` gets `i` |
|      1      |             10             |      0      |      1      |      0      |      0      | `y2` gets `i` |
|      1      |             11             |      1      |      0      |      0      |      0      | `y3` gets `i` |
|      0      |             XX             |      0      |      0      |      0      |      0      | All outputs `0` |

## 🔹 Module I/O
| Port Name | Bit Width | Type   | Description |
|-----------|-----------|--------|-------------|
| `i`       | 1         | input  | Data input line |
| `sel`     | 2         | input  | 2-bit select lines (`sel[1]`, `sel[0]`) |
| `y0` to `y3`| 1       | output | Output lines 0 to 3 |

## 📁 Files Included
- `src/` (contains Verilog source code)
- `testbench/` (contains self-checking testbench)
- `rtl/` (empty, schematic layout directory)
- `waveform/` (empty, simulation waveform directory)
