# Even Parity Checker

## Description
An Even Parity Checker is a combinational logic circuit that checks a received data vector (`data_in[3:0]`) alongside its associated parity bit (`parity`) to detect errors introduced during transmission. If the total number of logical `1`s in the combined inputs is odd, the circuit asserts the active-high `error` output.

## Pin Configuration (Ports)
| Port Name | Bit Width | Type   | Description |
|-----------|-----------|--------|-------------|
| `data_in` | 4         | input  | Received 4-bit data vector |
| `parity`  | 1         | input  | Received parity bit |
| `error`   | 1         | output | Active-high error detection flag |

## Logic Symbol Representation
```text
          +-----------+
  data_in |   Even    |
   [3:0] -|  Parity   |---- error
  parity -|  Checker  |
          +-----------+
```

## Truth Table Examples
| Received Data (`data_in[3:0]`) | Received Parity (`parity`) | Total 1s | Output `error` | Description |
|:-----------------------------:|:-------------------------:|:--------:|:--------------:|-------------|
|             0000              |             0             |    0     |       0        | No error |
|             0000              |             1             |    1     |       1        | Error detected (odd 1s) |
|             0011              |             0             |    2     |       0        | No error |
|             0011              |             1             |    3     |       1        | Error detected (odd 1s) |
|             0111              |             1             |    4     |       0        | No error |
|             0111              |             0             |    3     |       1        | Error detected (odd 1s) |

## Boolean Equation
$$\text{error} = data\_in[3] \oplus data\_in[2] \oplus data\_in[1] \oplus data\_in[0] \oplus parity$$

## Working Principle
The Even Parity Checker performs a cumulative XOR operation over the received data bits and the parity bit. 
- In Even Parity encoding, the transmitter ensures the total count of `1`s is even.
- When received, the receiver evaluates the XOR sum:
  - If the count of `1`s remains even, the XOR sum resolves to `0` (no error detected).
  - If a single bit flips during transmission, the count of `1`s becomes odd, and the XOR sum resolves to `1`, triggering the `error` line.

## Expected Testbench Output
```text
Time=0ns | Received Data=0000 Parity=0 | Error Detected=0
Time=10ns | Received Data=0000 Parity=1 | Error Detected=1
Time=20ns | Received Data=0011 Parity=0 | Error Detected=0
Time=30ns | Received Data=0011 Parity=1 | Error Detected=1
Time=40ns | Received Data=0111 Parity=1 | Error Detected=0
Time=50ns | Received Data=0111 Parity=0 | Error Detected=1
```
