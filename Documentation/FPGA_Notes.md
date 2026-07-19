# FPGA and Synthesis Reference Notes

This document provides foundational notes regarding FPGA implementation, synthesis processes, and hardware design paradigms.

## Difference between Simulation and Synthesis
- **Simulation**: Verifies logical correctness in software. Delays (`#10`) and system tasks (`$monitor`, `$finish`) are understood by the simulation compiler but ignored during hardware compilation.
- **Synthesis**: The translation of Verilog code into physical gate netlists composed of Look-Up Tables (LUTs), Flip-Flops, and Multiplexers.

## RTL vs Gate-Level
- **Register Transfer Level (RTL)**: A high-level description of data paths and registers using behavioral code statements (e.g. `a + b`).
- **Gate-Level Netlist**: The logical translation displaying actual hardware gates (AND, OR, registers) mapped to target FPGA resources.

## FPGA Basics
FPGAs (Field Programmable Gate Arrays) contain:
- **Configurable Logic Blocks (CLBs)**: Houses Look-Up Tables (LUTs) to model combinational logic and Flip-Flops (FFs) to register states.
- **Block RAMs (BRAM)**: Dual-port memory matrices inside the fabric.
- **Routing Matrix**: Interconnect channels wiring logic blocks together.

## Combinational vs Sequential Logic
- **Combinational**: Outputs depend solely on current inputs. Compiled into Look-Up Tables (LUTs).
- **Sequential**: Outputs depend on past states. Uses registers (D flip-flops) updating on clock edges.

## Important Verilog Concepts Used
- **Tri-state buffers**: Used to drive bidirectional inout pins (like `sda` in I2C) to high-impedance `z` when not transmitting.
- **Always Blocks**:
  - Combinational: `always @(*)`
  - Sequential: `always @(posedge clk or negedge rst_n)`
- **Sensitivity list**: Tells the compiler which signal transitions trigger evaluation of the block's equations.
