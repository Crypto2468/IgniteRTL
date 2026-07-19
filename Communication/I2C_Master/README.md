# 🚌 I2C Master

## 📝 Description
A simplified Inter-Integrated Circuit (I2C) Master controller. It manages open-drain SCL and SDA signals, generates START and STOP conditions, shifts out a 7-bit slave address, drives data payloads, and reads slave acknowledge (ACK) bits.

## 🌐 Protocol Overview
I2C is a synchronous, multi-master, multi-slave, half-duplex two-wire serial bus:
- **START Condition**: A high-to-low transition on SDA while SCL is high.
- **STOP Condition**: A low-to-high transition on SDA while SCL is high.
- **ACK/NACK**: The receiver pulls SDA low during the 9th clock pulse to acknowledge receipt of bytes.

## 🔌 Inputs & Outputs

| Port Name | Bit Width | Type   | Description |
|-----------|-----------|--------|-------------|
| `clk`     | 1         | input  | Clock signal input |
| `rst_n`   | 1         | input  | Asynchronous active-low reset |
| `start`   | 1         | input  | Initiates I2C serial write request |
| `addr`    | 7         | input  | 7-bit Target Slave Address |
| `din`     | 8         | input  | 8-bit Data payload byte |
| `done`    | 1         | output | Strobe pulsed when write transaction completes |
| `ack_error`| 1        | output | Set high if slave fails to acknowledge (NACK) |
| `scl`     | 1         | inout  | Bidirectional open-drain serial clock bus line |
| `sda`     | 1         | inout  | Bidirectional open-drain serial data bus line |

## 📁 Files Included
- `src/i2c_master.v` (contains Verilog source code)
- `testbench/i2c_master_tb.v` (contains self-checking testbench)
- `rtl/` (empty, schematic layout directory)
- `waveform/` (empty, simulation waveform directory)
