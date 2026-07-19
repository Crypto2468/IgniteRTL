# 4-bit Synchronous Up/Down Counter

## Description
A 4-bit Synchronous Up/Down Counter counts either upwards or downwards depending on the state of the control line `up_down`. When `up_down` is `1`, it increments; when `up_down` is `0`, it decrements. All stage transitions occur simultaneously on the active clock edge.

## Pin Configuration (Ports)
| Port Name | Bit Width | Type   | Description |
|-----------|-----------|--------|-------------|
| `clk`     | 1         | input  | Clock input |
| `rst_n`   | 1         | input  | Asynchronous active-low reset |
| `up_down` | 1         | input  | Direction control (1: Up, 0: Down) |
| `q`       | 4         | output | 4-bit binary counter output |

## Expected Testbench Output
```text
Time=0ns | clk=0 rst_n=0 | up_down=1 | Counter= 0
Time=15ns | clk=1 rst_n=1 | up_down=1 | Counter= 0
Time=35ns | clk=1 rst_n=1 | up_down=1 | Counter= 1
Time=55ns | clk=1 rst_n=1 | up_down=1 | Counter= 2
Time=75ns | clk=1 rst_n=1 | up_down=1 | Counter= 3
Time=95ns | clk=1 rst_n=1 | up_down=0 | Counter= 2  <-- direction switches to Down
Time=115ns | clk=1 rst_n=1 | up_down=0 | Counter= 1
```
