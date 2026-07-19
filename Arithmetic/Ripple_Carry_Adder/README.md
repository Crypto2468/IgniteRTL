# Ripple Carry Adder

## Description
The Ripple Carry Adder (RCA) is a multi-bit combinational digital adder built by cascading multiple 1-bit full adders in series. It is parameterized to support any desired operand bit-width.

## Truth Table


## Module I/O
| Port Name | Bit Width | Type | Description |
|-----------|-----------|------|-------------|
| `a`       | `WIDTH`   | input| First binary input vector |
| `b`       | `WIDTH`   | input| Second binary input vector |
| `cin`     | 1         | input| Carry-in input to the LSB stage |
| `sum`     | `WIDTH`   | output| Sum output vector |
| `cout`    | 1         | output| Carry-out from the MSB stage |

## Files Included
- `src/` (contains Verilog source code)
- `testbench/` (contains self-checking testbench)
- `rtl/` (empty, schematic layout directory)
- `waveform/` (empty, simulation waveform directory)
