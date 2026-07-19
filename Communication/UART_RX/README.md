# 📟 UART Receiver (UART_RX)

## 📝 Description
A Universal Asynchronous Receiver-Transmitter (UART) Serial Receiver. It samples serial data on the `rx` line at the midpoint of each bit interval (controlled by `CLKS_PER_BIT`), deserializing it back to an 8-bit parallel byte (`dout[7:0]`).

## 🌐 Protocol Overview
UART is an asynchronous serial communication protocol. The receiver monitors the idle-high `rx` line for a falling edge, aligning its internal clock divider to sample the incoming bitstream safely in the center of each bit window.

## 📄 Frame Format
Each character payload byte is framed as:
1. **Start Bit**: 1 bit (active-low `0`)
2. **Data Payload**: 8 data bits (sent Least Significant Bit first)
3. **Stop Bit**: 1 bit (active-high `1`)

## 🔌 Inputs & Outputs

| Port Name | Bit Width | Type   | Description |
|-----------|-----------|--------|-------------|
| `clk`     | 1         | input  | System clock |
| `rst_n`   | 1         | input  | Asynchronous active-low reset |
| `rx`      | 1         | input  | Serial input line |
| `dout`    | 8         | output | 8-bit deserialized parallel output |
| `rx_done` | 1         | output | High for one cycle when transaction completes |

## 📁 Files Included
- `src/uart_rx.v` (contains Verilog source code)
- `testbench/uart_rx_tb.v` (contains self-checking testbench)
- `rtl/` (empty, schematic layout directory)
- `waveform/` (empty, simulation waveform directory)
