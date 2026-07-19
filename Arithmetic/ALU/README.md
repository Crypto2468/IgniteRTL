# Arithmetic Logic Unit (ALU)

## Purpose
The Arithmetic Logic Unit (ALU) is the core computational block of a central processing unit (CPU). This module is a parameterized, combinational ALU that executes 16 different arithmetic, logical, and shifting operations based on a 4-bit opcode, updating status flags at its output.

## Features
- **Parameterized Width**: Configures the word length of the data path via the `WIDTH` parameter.
- **16 Arithmetic/Logical Operations**: Features a comprehensive instruction set for CPU execution pipelines.
- **Complete Status Flags**: Generates standard processor flag outputs:
  - **Zero (`zero`)**: Active-high when the result is all `0`s.
  - **Negative (`negative`)**: Refers to the sign bit (MSB) of the result.
  - **Carry-out (`cout`)**: Indicates carry output for addition, borrow for subtraction, or shifted-out bit for shifts.
  - **Signed Overflow (`overflow`)**: Signals two's complement arithmetic overflow.

## Inputs
| Port Name | Bit Width | Type  | Description |
|-----------|-----------|-------|-------------|
| `a`       | `WIDTH`   | input | Operand input vector A |
| `b`       | `WIDTH`   | input | Operand input vector B |
| `opcode`  | 4         | input | Operation code select lines |
| `cin`     | 1         | input | Carry-in line for addition/subtraction |

## Outputs
| Port Name  | Bit Width | Type   | Description |
|------------|-----------|--------|-------------|
| `result`   | `WIDTH`   | output | Computational output vector |
| `cout`     | 1         | output | Carry-out / Borrow-out status flag |
| `zero`     | 1         | output | Zero output flag |
| `negative` | 1         | output | Negative result flag |
| `overflow` | 1         | output | Signed overflow flag |

## Operation Table (Opcodes)
| Opcode (Binary) | Operation Name | Description | Equation |
|:---------------:|:--------------:|-------------|----------|
|    `4'b0000`    |      ADD       | Addition with Carry-in | $\text{result} = a + b + cin$ |
|    `4'b0001`    |      SUB       | Subtraction with Borrow-in | $\text{result} = a - b - cin$ |
|    `4'b0010`    |      AND       | Bitwise AND | $\text{result} = a \cdot b$ |
|    `4'b0011`    |       OR       | Bitwise OR | $\text{result} = a + b$ |
|    `4'b0100`    |      XOR       | Bitwise XOR | $\text{result} = a \oplus b$ |
|    `4'b0101`    |      NOR       | Bitwise NOR | $\text{result} = \overline{a + b}$ |
|    `4'b0110`    |      NAND      | Bitwise NAND | $\text{result} = \overline{a \cdot b}$ |
|    `4'b0111`    |      XNOR      | Bitwise XNOR | $\text{result} = \overline{a \oplus b}$ |
|    `4'b1000`    |      LSL       | Logical Shift Left | $\text{result} = a \ll 1$ |
|    `4'b1001`    |      LSR       | Logical Shift Right | $\text{result} = a \gg 1$ |
|    `4'b1010`    |      ASR       | Arithmetic Shift Right | $\text{result} = a \ggg 1$ |
|    `4'b1011`    |      INC       | Increment A | $\text{result} = a + 1$ |
|    `4'b1100`    |      DEC       | Decrement A | $\text{result} = a - 1$ |
|    `4'b1101`    |      NOT       | Bitwise NOT A | $\text{result} = \bar{a}$ |
|    `4'b1110`    |     PASSA      | Pass A | $\text{result} = a$ |
|    `4'b1111`    |     PASSB      | Pass B | $\text{result} = b$ |

## Flag Evaluation Logic
- **Zero flag**: `result == 0`
- **Negative flag**: `result[WIDTH-1]`
- **Signed Addition Overflow**: Asserted high when two positive numbers sum to a negative, or two negative numbers sum to a positive.
  $$\text{overflow\_add} = (A[N-1] == B[N-1]) \cdot (\text{result}[N-1] \neq A[N-1])$$
- **Signed Subtraction Overflow**: Asserted high when subtracting a negative from positive yields a negative, or subtracting a positive from negative yields a positive.
  $$\text{overflow\_sub} = (A[N-1] \neq B[N-1]) \cdot (\text{result}[N-1] \neq A[N-1])$$

## Applications
- Central Execution units of CPU and Microcontroller cores.
- DSP math blocks.
- Virtual machine execution engines.
