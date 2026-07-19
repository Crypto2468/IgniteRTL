# I2C Loopback System

## Description
A system-level wrapper connecting the `i2c_master` and `i2c_slave` modules in a local loopback environment. It validates data transmission between master and slave over shared bidirectional pull-up open-drain SCL and SDA lines.

## Protocol Overview
The system implements a synchronous, 2-wire serial connection:
- **scl**: Serial clock line driven by Master.
- **sda**: Bidirectional serial data line.

## Inputs & Outputs

| Port Name | Bit Width | Type   | Description |
|-----------|-----------|--------|-------------|
| `clk`     | 1         | input  | Clock signal input |
| `rst_n`   | 1         | input  | Asynchronous active-low reset |
| `master_start`| 1     | input  | Initiates I2C write transaction |
| `master_addr`| 7      | input  | Master Target Address |
| `master_din`| 8       | input  | Master Data byte payload |
| `master_done`| 1      | output | High when master transaction finishes |
| `master_ack_err`| 1   | output | High if slave fails to ACK |
| `slave_rx`| 8         | output | Slave received parallel data |
| `slave_done`| 1        | output | High when slave transaction completes |

## Files Included
- `src/i2c.v` (contains Verilog source code)
- `testbench/i2c_tb.v` (contains self-checking testbench)
- `rtl/` (empty, schematic layout directory)
- `waveform/` (empty, simulation waveform directory)
