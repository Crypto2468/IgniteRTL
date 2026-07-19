# BCD Adder

## Description
A BCD (Binary Coded Decimal) Adder is a combinational circuit that adds two 4-bit BCD input digits (`a[3:0]` and `b[3:0]`) along with a carry-in (`cin`) and produces a 4-bit BCD sum (`sum[3:0]`) and a carry-out bit (`cout`).

## Pin Configuration (Ports)
| Port Name | Bit Width | Type   | Description |
|-----------|-----------|--------|-------------|
| `a`       | 4         | input  | 4-bit BCD input digit A (0-9) |
| `b`       | 4         | input  | 4-bit BCD input digit B (0-9) |
| `cin`     | 1         | input  | Carry-in signal |
| `sum`     | 4         | output | 4-bit BCD sum digit output (0-9) |
| `cout`    | 1         | output | BCD Carry-out signal (high if sum exceeds 9) |

## Logic Symbol Representation
```text
          +-----------+
   a -----|           |
   b -----|    BCD    |---- sum
  cin ----|   Adder   |---- cout
          +-----------+
```

## Working Principle
- BCD digits only range from `0` to `9` (binary `4'b0000` to `4'b1001`).
- The circuit first calculates a temporary binary sum: $Sum_{temp} = a + b + cin$.
- If $Sum_{temp} \le 9$:
  - The BCD sum is directly equal to the binary sum ($sum = Sum_{temp}[3:0]$).
  - The carry-out is cleared ($cout = 0$).
- If $Sum_{temp} > 9$ (invalid BCD value):
  - A decimal adjustment is required by adding $6$ (`4'b0110`) to the binary sum.
  - The carry-out is asserted ($cout = 1$).

## Expected Simulation Behaviour
```text
Time=0ns | Inputs: a=3 b=4 cin=0 | Outputs: sum=7 cout=0
Time=10ns | Inputs: a=8 b=5 cin=0 | Outputs: sum=3 cout=1
Time=20ns | Inputs: a=9 b=9 cin=1 | Outputs: sum=9 cout=1
Time=30ns | Inputs: a=0 b=0 cin=0 | Outputs: sum=0 cout=0
```
