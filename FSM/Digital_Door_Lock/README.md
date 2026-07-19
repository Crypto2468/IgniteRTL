# Digital Door Lock

## Description
A digital door lock security FSM that validates a 3-digit serial passcode (`3-1-2`). Successful validation opens the lock (`unlocked = 1`). Any incorrect digit instantly locks the system into an alarm state (`alarm = 1`) that can only be cleared by reset.

## State Diagram Explanation
The FSM utilizes 5 states:
- `STATE_LOCKED` (000): Initial idle locked state. Expecting digit 3.
- `STATE_D1` (001): First digit valid. Expecting digit 1.
- `STATE_D2` (010): Second digit valid. Expecting digit 2.
- `STATE_UNLOCKED` (011): Access granted state.
- `STATE_ALARM` (100): Security alert state. Locked out.

## State Transition Table

| Current State | Valid Input | Digit Input | Next State | Unlocked | Alarm |
|:-------------:|:-----------:|:-----------:|:----------:|:--------:|:-----:|
| `STATE_LOCKED`|      1      |   `2'b11`   |  `STATE_D1` |    0     |   0   |
| `STATE_LOCKED`|      1      |  not `2'b11`| `STATE_ALARM`|   0     |   0   |
|   `STATE_D1`  |      1      |   `2'b01`   |  `STATE_D2` |    0     |   0   |
|   `STATE_D1`  |      1      |  not `2'b01`| `STATE_ALARM`|   0     |   0   |
|   `STATE_D2`  |      1      |   `2'b10`   |`STATE_UNLOCKED`|  0     |   0   |
|   `STATE_D2`  |      1      |  not `2'b10`| `STATE_ALARM`|   0     |   0   |
|`STATE_UNLOCKED`|     X      |      X      |`STATE_UNLOCKED`|  1     |   0   |
| `STATE_ALARM` |     X      |      X      | `STATE_ALARM`|    0     |   1   |

## Inputs & Outputs

| Port Name | Bit Width | Type   | Description |
|-----------|-----------|--------|-------------|
| `clk`     | 1         | input  | Clock signal |
| `rst_n`   | 1         | input  | Asynchronous active-low reset |
| `digit`   | 2         | input  | 2-bit binary representation of the input digit |
| `valid`   | 1         | input  | Input strobe pulse indicating digit validity |
| `unlocked`| 1         | output | High when lock is open |
| `alarm`   | 1         | output | High when alarm is triggered |

## Files Included
- `src/digital_door_lock.v` (contains Verilog source code)
- `testbench/digital_door_lock_tb.v` (contains self-checking testbench)
- `rtl/` (empty, schematic layout directory)
- `waveform/` (empty, simulation waveform directory)
