# Even/Odd Parity Generator

## Description
A Parity Generator is a combinational logic circuit that generates a parity bit to append to a data vector before transmission. It ensures error detection by verifying the number of `1`s in the data. This module accepts a 4-bit data input (`data_in[3:0]`) and outputs both Even Parity (`parity_even`) and Odd Parity (`parity_odd`) bits.

## Truth Table
| Input Data (`data_in[3:0]`) | Sum of 1s | Even Parity Output (`parity_even`) | Odd Parity Output (`parity_odd`) |
|:--------------------------:|:---------:|:----------------------------------:|:--------------------------------:|
|            0000            |     0     |                 0                  |                1                 |
|            0001            |     1     |                 1                  |                0                 |
|            0011            |     2     |                 0                  |                1                 |
|            0111            |     3     |                 1                  |                0                 |
|            1111            |     4     |                 0                  |                1                 |
|            1010            |     2     |                 0                  |                1                 |

## Module I/O
| Port Name     | Bit Width | Type   | Description |
|---------------|-----------|--------|-------------|
| `data_in`     | 4         | input  | 4-bit binary data input |
| `parity_even` | 1         | output | Even parity bit output |
| `parity_odd`  | 1         | output | Odd parity bit output |

## Files Included
- `src/` (contains Verilog source code)
- `testbench/` (contains self-checking testbench)
- `rtl/` (empty, schematic layout directory)
- `waveform/` (empty, simulation waveform directory)
