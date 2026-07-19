# 🔀 2x1 Multiplexer (2x1 MUX)

## 📝 Description
A 2x1 Multiplexer (MUX) is a combinational logic circuit that selects one of two binary input channels and routes it to a single output line based on the state of a select input.

## 📋 Truth Table
| Select (`sel`) | Output (`y`) | Description |
|:--------------:|:------------:|-------------|
|       0        |     `i0`     | Output tracks input `i0` |
|       1        |     `i1`     | Output tracks input `i1` |

## 🔹 Module I/O
| Port Name | Bit Width | Type   | Description |
|-----------|-----------|--------|-------------|
| `i0`      | 1         | input  | Data input line 0 |
| `i1`      | 1         | input  | Data input line 1 |
| `sel`     | 1         | input  | Select control line |
| `y`       | 1         | output | Selected data output |

## 📁 Files Included
- `src/` (contains Verilog source code)
- `testbench/` (contains self-checking testbench)
- `rtl/` (empty, schematic layout directory)
- `waveform/` (empty, simulation waveform directory)
