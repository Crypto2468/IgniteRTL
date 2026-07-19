# 4x1 Multiplexer (4x1 MUX)

## Description
A 4x1 Multiplexer (MUX) is a combinational circuit that selects one of four binary input lines (`i0`, `i1`, `i2`, `i3`) and routes it to a single output line (`y`) based on the binary state of two select lines (`sel[1:0]`).

## Truth Table
| Select Bits (`sel[1]`, `sel[0]`) | Output (`y`) | Description |
|:--------------------------------:|:------------:|-------------|
|                00                |     `i0`     | Output tracks input `i0` |
|                01                |     `i1`     | Output tracks input `i1` |
|                10                |     `i2`     | Output tracks input `i2` |
|                11                |     `i3`     | Output tracks input `i3` |

## Module I/O
| Port Name | Bit Width | Type   | Description |
|-----------|-----------|--------|-------------|
| `i0`      | 1         | input  | Data input line 0 |
| `i1`      | 1         | input  | Data input line 1 |
| `i2`      | 1         | input  | Data input line 2 |
| `i3`      | 1         | input  | Data input line 3 |
| `sel`     | 2         | input  | 2-bit select lines (`sel[1]`, `sel[0]`) |
| `y`       | 1         | output | Selected data output |

## Files Included
- `src/` (contains Verilog source code)
- `testbench/` (contains self-checking testbench)
- `rtl/` (empty, schematic layout directory)
- `waveform/` (empty, simulation waveform directory)
