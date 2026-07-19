# 4-bit Arithmetic Logic Unit (ALU)

## Description
A 4-bit Arithmetic Logic Unit (ALU) is a combinational circuit that performs basic arithmetic and logical operations on two 4-bit input operands (`a[3:0]` and `b[3:0]`). The specific operation to execute is determined by a 3-bit control code (`op[2:0]`).

## Pin Configuration (Ports)
| Port Name | Bit Width | Type   | Description |
|-----------|-----------|--------|-------------|
| `a`       | 4         | input  | 4-bit Input Operand A |
| `b`       | 4         | input  | 4-bit Input Operand B |
| `op`      | 3         | input  | 3-bit Operation Select |
| `out`     | 4         | output | 4-bit ALU output result |
| `carry`   | 1         | output | Carry output (for addition) |

## Logic Symbol Representation
```text
          +------------+
   a -----|            |
   b -----|   4-bit    |---- out
          |    ALU     |---- carry
   op ----|            |
          +------------+
```

## Operation Selection (Truth Table)
| Operation Select (`op`) | Operation Name | Description | Output Equation |
|:----------------------:|:--------------:|-------------|-----------------|
|          000           | ADD            | Add inputs A and B | `{carry, out} = a + b` |
|          001           | SUB            | Subtract B from A | `out = a - b` |
|          010           | AND            | Bitwise AND | `out = a & b` |
|          011           | OR             | Bitwise OR | `out = a \| b` |
|          100           | XOR            | Bitwise XOR | `out = a ^ b` |
|          101           | NOT            | Bitwise NOT A | `out = ~a` |
|          110           | LSL            | Logical Shift Left A | `out = a << 1` |
|          111           | LSR            | Logical Shift Right A | `out = a >> 1` |

## Expected Testbench Output
```text
Time=0ns | op=000 a=6 b=3 | out=9 carry=0
Time=10ns | op=001 a=6 b=3 | out=3 carry=0
Time=20ns | op=010 a=6 b=3 | out=2 carry=0
Time=30ns | op=011 a=6 b=3 | out=7 carry=0
Time=40ns | op=100 a=6 b=3 | out=5 carry=0
Time=50ns | op=101 a=6 b=3 | out=9 carry=0
Time=60ns | op=110 a=6 b=3 | out=12 carry=0
Time=70ns | op=111 a=6 b=3 | out=3 carry=0
```
