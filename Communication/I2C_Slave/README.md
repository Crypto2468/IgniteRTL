# 🚌 I2C Slave

## 📝 Description
A simplified Inter-Integrated Circuit (I2C) Slave peripheral. It listens to open-drain SCL and SDA lines for target address matches (default `7'h50`), pulls SDA low to ACK address and data transactions, and outputs received bytes onto a parallel bus.

## 🔌 Inputs & Outputs

| Port Name | Bit Width | Type   | Description |
|-----------|-----------|--------|-------------|
| `rst_n`   | 1         | input  | Asynchronous active-low reset |
| `rx_data` | 8         | output | 8-bit parallel received data |
| `rx_done` | 1         | output | High for one cycle when transaction completes |
| `scl`     | 1         | input  | Serial clock input |
| `sda`     | 1         | inout  | Bidirectional open-drain serial data bus line |

## 📁 Files Included
- `src/i2c_slave.v` (contains Verilog source code)
- `testbench/i2c_slave_tb.v` (contains self-checking testbench)
- `rtl/` (empty, schematic layout directory)
- `waveform/` (empty, simulation waveform directory)
