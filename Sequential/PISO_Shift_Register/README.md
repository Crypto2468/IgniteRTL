# Parallel-In Serial-Out (PISO) Shift Register

## Description
A Parallel-In Serial-Out (PISO) Shift Register allows multi-bit parallel data (`pi[3:0]`) to be loaded in a single clock cycle when `load_shift` is high. When `load_shift` is low, the data is shifted out serially one bit at a time via `so`.

## Pin Configuration (Ports)
| Port Name | Bit Width | Type   | Description |
|-----------|-----------|--------|-------------|
| `clk`     | 1         | input  | Clock input |
| `rst_n`   | 1         | input  | Asynchronous active-low reset |
| `load_shift` | 1      | input  | Mode select (1: Parallel Load, 0: Serial Shift) |
| `pi`      | 4         | input  | 4-bit parallel data input |
| `so`      | 1         | output | Serial data output |

## Expected Testbench Output
```text
Time=0ns | clk=0 rst_n=0 | load_shift=0 pi=0000 | so=0 (internal r=0000)
Time=15ns | clk=1 rst_n=1 | load_shift=0 pi=0000 | so=0 (internal r=0000)
Time=25ns | clk=1 rst_n=1 | load_shift=1 pi=1011 | so=1 (internal r=1011)  <-- load happens
Time=45ns | clk=1 rst_n=1 | load_shift=0 pi=1011 | so=1 (internal r=0101)  <-- shift 1 (so gets 1)
Time=65ns | clk=1 rst_n=1 | load_shift=0 pi=1011 | so=0 (internal r=0010)  <-- shift 2 (so gets 0)
Time=85ns | clk=1 rst_n=1 | load_shift=0 pi=1011 | so=1 (internal r=0001)  <-- shift 3 (so gets 1)
Time=105ns | clk=1 rst_n=1 | load_shift=0 pi=1011 | so=0 (internal r=0000)
```
