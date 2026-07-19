# 🔄 FIFO Queue

## 📝 Description
A First-In First-Out (FIFO) queue utilizing a circular ring buffer design. It manages data transfers between synchronous domains, providing active flags indicating `full` and `empty` memory states.

## 📦 Block Description
- **Circular Buffer**: Pointers `wr_ptr` and `rd_ptr` wrap around using modular arithmetic.
- **Counter Logic**: Tracks current byte count to determine `full` and `empty` states.
- **Gated Write/Read**: Operations are ignored if the FIFO is full during a write or empty during a read.

## 📊 Memory Organization
- **Memory Depth**: 8 words.
- **Word Width**: 8 bits.
- **Total Capacity**: 64 bits.

## 🔌 Inputs & Outputs

| Port Name | Bit Width | Type   | Description |
|-----------|-----------|--------|-------------|
| `clk`     | 1         | input  | Clock input |
| `rst_n`   | 1         | input  | Asynchronous active-low reset |
| `wr_en`   | 1         | input  | Write Enable control line |
| `rd_en`   | 1         | input  | Read Enable control line |
| `din`     | 8         | input  | 8-bit Data Input |
| `dout`    | 8         | output | 8-bit Data Output |
| `full`    | 1         | output | High when queue is full |
| `empty`   | 1         | output | High when queue is empty |

## 📁 Files Included
- `src/fifo.v` (contains Verilog source code)
- `testbench/fifo_tb.v` (contains self-checking testbench)
- `rtl/` (empty, schematic layout directory)
- `waveform/` (empty, simulation waveform directory)
