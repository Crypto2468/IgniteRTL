# 8x1 Multiplexer (8x1 MUX)

## Description
An 8x1 Multiplexer (MUX) is a combinational circuit that selects one of eight binary input lines (`i0` to `i7`) and routes it to a single output line (`y`) based on the binary state of three select lines (`sel[2:0]`).

## Truth Table
| Select Bits (`sel[2:0]`) | Output (`y`) | Description |
|:------------------------:|:------------:|-------------|
|           000            |     `i0`     | Output tracks input `i0` |
|           001            |     `i1`     | Output tracks input `i1` |
|           010            |     `i2`     | Output tracks input `i2` |
|           011            |     `i3`     | Output tracks input `i3` |
|           100            |     `i4`     | Output tracks input `i4` |
|           101            |     `i5`     | Output tracks input `i5` |
|           110            |     `i6`     | Output tracks input `i6` |
|           111            |     `i7`     | Output tracks input `i7` |

## Module I/O
| Port Name | Bit Width | Type   | Description |
|-----------|-----------|--------|-------------|
| `i0` to `i7`| 1       | input  | Data input lines 0 to 7 |
| `sel`     | 3         | input  | 3-bit select lines (`sel[2]`, `sel[1]`, `sel[0]`) |
| `y`       | 1         | output | Selected data output |

## Files Included
- `src/` (contains Verilog source code)
- `testbench/` (contains self-checking testbench)
- `rtl/` (empty, schematic layout directory)
- `waveform/` (empty, simulation waveform directory)
