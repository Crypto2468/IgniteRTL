# Sign Extender

## Description
A combinational bit extension block. It sign-extends a 4-bit signed two's complement immediate value (`din[3:0]`) to a wider 8-bit signed format (`dout[7:0]`), preserving the sign polarity.

## Functional Overview
In a CPU, immediate operands are often small (e.g. 4 bits) to fit in the instruction word format, but the data path handles wider widths (e.g. 8 bits). The Sign Extender replicates the sign bit (MSB) to the upper bits of the output bus, ensuring arithmetic operands remain mathematically correct.

## Inputs & Outputs

| Port Name | Bit Width | Type   | Description |
|-----------|-----------|--------|-------------|
| `din`     | 4         | input  | 4-bit signed binary input vector |
| `dout`    | 8         | output | 8-bit signed extended binary output vector |

## Block Description
- **Bit Replication**: Performs a static combinational replication:
  ```verilog
  assign dout = {{4{din[3]}}, din};
  ```

## Files Included
- `src/sign_extender.v` (contains Verilog source code)
- `testbench/sign_extender_tb.v` (contains self-checking testbench)
- `rtl/` (empty, schematic layout directory)
- `waveform/` (empty, simulation waveform directory)
