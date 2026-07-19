# Even Parity Checker

## Description
An Even Parity Checker is a combinational logic circuit that checks a received data vector (`data_in[3:0]`) alongside its associated parity bit (`parity`) to detect errors introduced during transmission. If the total number of logical `1`s in the combined inputs is odd, the circuit asserts the active-high `error` output.

## Truth Table
| Received Data (`data_in[3:0]`) | Received Parity (`parity`) | Total 1s | Output `error` | Description |
|:-----------------------------:|:-------------------------:|:--------:|:--------------:|-------------|
|             0000              |             0             |    0     |       0        | No error |
|             0000              |             1             |    1     |       1        | Error detected (odd 1s) |
|             0011              |             0             |    2     |       0        | No error |
|             0011              |             1             |    3     |       1        | Error detected (odd 1s) |
|             0111              |             1             |    4     |       0        | No error |
|             0111              |             0             |    3     |       1        | Error detected (odd 1s) |

## Module I/O
| Port Name | Bit Width | Type   | Description |
|-----------|-----------|--------|-------------|
| `data_in` | 4         | input  | Received 4-bit data vector |
| `parity`  | 1         | input  | Received parity bit |
| `error`   | 1         | output | Active-high error detection flag |

## Files Included
- `src/` (contains Verilog source code)
- `testbench/` (contains self-checking testbench)
- `rtl/` (empty, schematic layout directory)
- `waveform/` (empty, simulation waveform directory)
