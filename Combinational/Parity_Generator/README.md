# Even/Odd Parity Generator

## Description
A Parity Generator is a combinational logic circuit that generates a parity bit to append to a data vector before transmission. It ensures error detection by verifying the number of `1`s in the data. This module accepts a 4-bit data input (`data_in[3:0]`) and outputs both Even Parity (`parity_even`) and Odd Parity (`parity_odd`) bits.

## Pin Configuration (Ports)
| Port Name     | Bit Width | Type   | Description |
|---------------|-----------|--------|-------------|
| `data_in`     | 4         | input  | 4-bit binary data input |
| `parity_even` | 1         | output | Even parity bit output |
| `parity_odd`  | 1         | output | Odd parity bit output |

## Logic Symbol Representation
```text
          +-----------+
  data_in |  Parity   |---- parity_even
   [3:0] -| Generator |---- parity_odd
          +-----------+
```

## Truth Table
| Input Data (`data_in[3:0]`) | Sum of 1s | Even Parity Output (`parity_even`) | Odd Parity Output (`parity_odd`) |
|:--------------------------:|:---------:|:----------------------------------:|:--------------------------------:|
|            0000            |     0     |                 0                  |                1                 |
|            0001            |     1     |                 1                  |                0                 |
|            0011            |     2     |                 0                  |                1                 |
|            0111            |     3     |                 1                  |                0                 |
|            1111            |     4     |                 0                  |                1                 |
|            1010            |     2     |                 0                  |                1                 |

## Boolean Equations
- $\text{parity\_even} = data\_in[3] \oplus data\_in[2] \oplus data\_in[1] \oplus data\_in[0]$
- $\text{parity\_odd} = \overline{data\_in[3] \oplus data\_in[2] \oplus data\_in[1] \oplus data\_in[0]}$

## Working Principle
- **Even Parity**: The even parity bit is generated such that the total number of `1`s in the combined data and parity bit is even. Thus, if the input data has an odd number of `1`s, the even parity bit is set to `1`.
- **Odd Parity**: The odd parity bit is generated such that the total number of `1`s in the combined data and parity bit is odd. Thus, if the input data has an even number of `1`s, the odd parity bit is set to `1`.

## Expected Testbench Output
```text
Time=0ns | Input Data=0000 | Even Parity Out=0 | Odd Parity Out=1
Time=10ns | Input Data=0001 | Even Parity Out=1 | Odd Parity Out=0
Time=20ns | Input Data=0011 | Even Parity Out=0 | Odd Parity Out=1
Time=30ns | Input Data=0111 | Even Parity Out=1 | Odd Parity Out=0
Time=40ns | Input Data=1111 | Even Parity Out=0 | Odd Parity Out=1
Time=50ns | Input Data=1010 | Even Parity Out=0 | Odd Parity Out=1
```
