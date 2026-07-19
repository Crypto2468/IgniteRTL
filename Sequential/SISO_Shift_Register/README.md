# Serial-In Serial-Out (SISO) Shift Register

## Description
A Serial-In Serial-Out (SISO) Shift Register is a synchronous sequential circuit that shifts a single data bit into its first stage on each clock edge and outputs the shifted bit from its final stage. It introduces a fixed clock delay for the data (4 clock cycles for a 4-bit register).

## Pin Configuration (Ports)
| Port Name | Bit Width | Type   | Description |
|-----------|-----------|--------|-------------|
| `clk`     | 1         | input  | Clock input |
| `rst_n`   | 1         | input  | Asynchronous active-low reset |
| `si`      | 1         | input  | Serial data input |
| `so`      | 1         | output | Serial data output |

## Expected Testbench Output
```text
Time=0ns | clk=0 rst_n=0 | si=0 | so=0 (internal r=0000)
Time=15ns | clk=1 rst_n=1 | si=0 | so=0 (internal r=0000)
Time=25ns | clk=1 rst_n=1 | si=1 | so=0 (internal r=1000)
Time=45ns | clk=1 rst_n=1 | si=0 | so=0 (internal r=0100)
Time=65ns | clk=1 rst_n=1 | si=1 | so=0 (internal r=1010)
Time=85ns | clk=1 rst_n=1 | si=1 | so=0 (internal r=1101)  <-- first loaded bit (1) arrives at r[0] / so
Time=105ns | clk=1 rst_n=1 | si=0 | so=1 (internal r=0110)
```
