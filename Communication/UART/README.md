# 📟 UART Transceiver

## 📝 Description
A Full-Duplex Universal Asynchronous Receiver-Transmitter (UART) Transceiver. It acts as an integration wrapper instantiating both the `uart_tx` transmitter and `uart_rx` receiver modules to establish full serial link loopbacks.

## 🌐 Protocol Overview
UART communicates asynchronously. The integrated transceiver module enables concurrent parallel-to-serial transmission and serial-to-parallel reception over separate TX and RX lines.

## 🔌 Inputs & Outputs

| Port Name | Bit Width | Type   | Description |
|-----------|-----------|--------|-------------|
| `clk`     | 1         | input  | Clock signal |
| `rst_n`   | 1         | input  | Asynchronous active-low reset |
| `tx_start`| 1         | input  | Pulse to start serial transmission |
| `tx_din`  | 8         | input  | 8-bit parallel byte to transmit |
| `tx`      | 1         | output | Serial transmitter output wire |
| `tx_active`| 1        | output | High when transmitting is active |
| `tx_done` | 1         | output | Complete strobe pulse |
| `rx`      | 1         | input  | Serial receiver input wire |
| `rx_dout` | 8         | output | 8-bit deserialized parallel output |
| `rx_done` | 1         | output | Valid received pulse |

## 📁 Files Included
- `src/uart.v` (contains Verilog source code)
- `testbench/uart_tb.v` (contains self-checking testbench)
- `rtl/` (empty, schematic layout directory)
- `waveform/` (empty, simulation waveform directory)
