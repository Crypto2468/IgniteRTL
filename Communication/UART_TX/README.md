# 📟 UART Transmitter (UART_TX)

## 📝 Description
A Universal Asynchronous Receiver-Transmitter (UART) Serial Transmitter. It converts parallel 8-bit data bytes (`din[7:0]`) into a standard asynchronous serial stream (`tx`) governed by a configurable clock cycle multiplier count (`CLKS_PER_BIT`).

## 🌐 Protocol Overview
UART is an asynchronous serial communication protocol that does not utilize a shared clock line. Instead, transmitter and receiver agree beforehand on the transmission speed (baud rate). Timings are referenced using start bits and stop bits added directly to data payloads.

## 📄 Frame Format
Each character payload byte is framed as:
1. **Start Bit**: 1 bit (active-low `0`)
2. **Data Payload**: 8 data bits (sent Least Significant Bit first)
3. **Stop Bit**: 1 bit (active-high `1`)

```text
              +-----------+-----+-----+-----+-----+-----+-----+-----+-----+-----------+
Serial line   | Idle (1)  | St  | D0  | D1  | D2  | D3  | D4  | D5  | D6  | D7  | Sp (1)  |
              +-----------+-----+-----+-----+-----+-----+-----+-----+-----+-----------+
```
*(Where St = Start bit [0], D0..D7 = Data bits, Sp = Stop bit [1])*

## 🔌 Inputs & Outputs

| Port Name | Bit Width | Type   | Description |
|-----------|-----------|--------|-------------|
| `clk`     | 1         | input  | System clock |
| `rst_n`   | 1         | input  | Asynchronous active-low reset |
| `tx_start`| 1         | input  | Pulse to trigger byte transmission |
| `din`     | 8         | input  | 8-bit parallel data byte payload |
| `tx`      | 1         | output | Serial output data stream line |
| `tx_active`| 1        | output | High when transmission is in progress |
| `tx_done` | 1         | output | High for one cycle when transaction completes |

## 📁 Files Included
- `src/uart_tx.v` (contains Verilog source code)
- `testbench/uart_tx_tb.v` (contains self-checking testbench)
- `rtl/` (empty, schematic layout directory)
- `waveform/` (empty, simulation waveform directory)
