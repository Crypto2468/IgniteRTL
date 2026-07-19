# 💾 16x8 Synchronous Read-Only Memory (ROM)

## 📝 Description
A 16-word synchronous Read-Only Memory (ROM) with an 8-bit data path. The memory is initialized with constant data in an internal table. Readings are clock-synchronous and gated by an active-high chip enable (`en`) signal.

## 📦 Block Description
- **Synchronous Output Register**: The output `data` transitions on the positive clock edge when enable (`en`) is high.
- **Constant Memory Matrix**: Contains pre-programmed constant data lines mapped from address `4'h0` to `4'hF`.
- **Chip Enable Logic**: Disabling the ROM (`en = 0`) prevents new address translations, causing the output register to hold its previous value.

## 📊 Memory Organization
- **Memory Depth**: 16 words (addressed using a 4-bit input `addr[3:0]`).
- **Word Width**: 8 bits (represented on `data[7:0]`).
- **Total Capacity**: 128 bits (16 words × 8 bits).

## 🔌 Inputs & Outputs

| Port Name | Bit Width | Type   | Description |
|-----------|-----------|--------|-------------|
| `clk`     | 1         | input  | Clock signal |
| `en`      | 1         | input  | Active-high ROM chip enable |
| `addr`    | 4         | input  | 4-bit memory address lookup vector |
| `data`    | 8         | output | 8-bit output data register |

## 📁 Files Included
- `src/rom.v` (contains Verilog source code)
- `testbench/rom_tb.v` (contains self-checking testbench)
- `rtl/` (empty, schematic layout directory)
- `waveform/` (empty, simulation waveform directory)
