# Vending Machine Controller

## Description
A vending machine controller that dispenses a product worth $1.50 (150 cents). It accepts $0.50 and $1.00 inputs, dispenses the product, and returns change if the accumulated credit exceeds the item cost.

## State Diagram Explanation
The FSM is structured into 5 states:
- `S_0` (000): Initial state ($0.00 credit)
- `S_50` (001): $0.50 credit
- `S_100` (010): $1.00 credit
- `S_150` (011): Dispense state ($1.50, no change)
- `S_200` (100): Dispense + $0.50 change state ($2.00 credit)
`S_150` and `S_200` are transient states that automatically return to `S_0` on the next clock edge.

## State Transition Table

| Current State | Coin Input | Next State | Dispense | Change Out |
|:-------------:|:----------:|:----------:|:--------:|:----------:|
|     `S_0`     |   `2'b00`  |    `S_0`   |    0     |     0      |
|     `S_0`     |   `2'b01`  |   `S_50`   |    0     |     0      |
|     `S_0`     |   `2'b10`  |  `S_100`   |    0     |     0      |
|    `S_50`     |   `2'b01`  |  `S_100`   |    0     |     0      |
|    `S_50`     |   `2'b10`  |  `S_150`   |    0     |     0      |
|    `S_100`    |   `2'b01`  |  `S_150`   |    0     |     0      |
|    `S_100`    |   `2'b10`  |  `S_200`   |    0     |     0      |
|    `S_150`    |      X     |    `S_0`   |    1     |     0      |
|    `S_200`    |      X     |    `S_0`   |    1     |     1      |

## Inputs & Outputs

| Port Name | Bit Width | Type   | Description |
|-----------|-----------|--------|-------------|
| `clk`     | 1         | input  | Clock signal |
| `rst_n`   | 1         | input  | Asynchronous active-low reset |
| `coin`    | 2         | input  | Coin input vector (00:None, 01:50c, 10:100c) |
| `dispense`| 1         | output | High when item is dispensed |
| `change_out`| 1       | output | High when change ($0.50) is returned |

## Files Included
- `src/vending_machine_controller.v` (contains Verilog source code)
- `testbench/vending_machine_controller_tb.v` (contains self-checking testbench)
- `rtl/` (empty, schematic layout directory)
- `waveform/` (empty, simulation waveform directory)
