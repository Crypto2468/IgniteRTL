# 📁 Repository Structure

> **Digital-IC-Portfolio** — Complete file tree, module by module.

Every module follows this layout:
```
<Module>/
├── src/         ← Verilog RTL source (.v)
├── rtl/         ← Synthesisable netlist / block diagram artefacts
├── testbench/   ← Simulation testbench (.v)
├── waveform/    ← Waveform captures / VCD files
└── README.md    ← Module documentation
```

---

```
Digital-IC-Portfolio/
│
├── README.md
├── CONTRIBUTING.md
├── LICENSE
├── .gitignore
│
├── 📁 Arithmetic/
│   ├── README.md
│   │
│   ├── Half_Adder/
│   │   ├── src/
│   │   │   └── half_adder.v
│   │   ├── testbench/
│   │   │   └── half_adder_tb.v
│   │   ├── rtl/
│   │   ├── waveform/
│   │   └── README.md
│   │
│   ├── Full_Adder/
│   │   ├── src/
│   │   │   └── full_adder.v
│   │   ├── testbench/
│   │   │   └── full_adder_tb.v
│   │   ├── rtl/
│   │   ├── waveform/
│   │   └── README.md
│   │
│   ├── Half_Subtractor/
│   │   ├── src/
│   │   │   └── half_subtractor.v
│   │   ├── testbench/
│   │   │   └── half_subtractor_tb.v
│   │   ├── rtl/
│   │   ├── waveform/
│   │   └── README.md
│   │
│   ├── Full_Subtractor/
│   │   ├── src/
│   │   │   └── full_subtractor.v
│   │   ├── testbench/
│   │   │   └── full_subtractor_tb.v
│   │   ├── rtl/
│   │   ├── waveform/
│   │   └── README.md
│   │
│   ├── Ripple_Carry_Adder/
│   │   ├── src/
│   │   │   └── ripple_carry_adder.v
│   │   ├── testbench/
│   │   │   └── ripple_carry_adder_tb.v
│   │   ├── rtl/
│   │   ├── waveform/
│   │   └── README.md
│   │
│   ├── Carry_Lookahead_Adder/
│   │   ├── src/
│   │   │   └── carry_lookahead_adder.v
│   │   ├── testbench/
│   │   │   └── carry_lookahead_adder_tb.v
│   │   ├── rtl/
│   │   ├── waveform/
│   │   └── README.md
│   │
│   ├── Carry_Select_Adder/
│   │   ├── src/
│   │   │   └── carry_select_adder.v
│   │   ├── testbench/
│   │   │   └── carry_select_adder_tb.v
│   │   ├── rtl/
│   │   ├── waveform/
│   │   └── README.md
│   │
│   ├── Carry_Save_Adder/
│   │   ├── src/
│   │   │   └── carry_save_adder.v
│   │   ├── testbench/
│   │   │   └── carry_save_adder_tb.v
│   │   ├── rtl/
│   │   ├── waveform/
│   │   └── README.md
│   │
│   ├── BCD_Adder/
│   │   ├── src/
│   │   │   └── bcd_adder.v
│   │   ├── testbench/
│   │   │   └── bcd_adder_tb.v
│   │   ├── rtl/
│   │   ├── waveform/
│   │   └── README.md
│   │
│   ├── Array_Multiplier/
│   │   ├── src/
│   │   │   └── array_multiplier.v
│   │   ├── testbench/
│   │   │   └── array_multiplier_tb.v
│   │   ├── rtl/
│   │   ├── waveform/
│   │   └── README.md
│   │
│   ├── Booth_Multiplier/
│   │   ├── src/
│   │   │   └── booth_multiplier.v
│   │   ├── testbench/
│   │   │   └── booth_multiplier_tb.v
│   │   ├── rtl/
│   │   ├── waveform/
│   │   └── README.md
│   │
│   ├── ALU_4bit/
│   │   ├── src/
│   │   │   └── alu_4bit.v
│   │   ├── testbench/
│   │   │   └── alu_4bit_tb.v
│   │   ├── rtl/
│   │   ├── waveform/
│   │   └── README.md
│   │
│   ├── Restoring_Divider/
│   │   ├── src/
│   │   │   └── restoring_divider.v
│   │   ├── testbench/
│   │   │   └── restoring_divider_tb.v
│   │   ├── rtl/
│   │   ├── waveform/
│   │   └── README.md
│   │
│   └── Non_Restoring_Divider/
│       ├── src/
│       │   └── non_restoring_divider.v
│       ├── testbench/
│       │   └── non_restoring_divider_tb.v
│       ├── rtl/
│       ├── waveform/
│       └── README.md
│
├── 📁 Combinational/
│   ├── README.md
│   │
│   ├── Comparator_1bit/
│   │   ├── src/
│   │   │   └── comparator_1bit.v
│   │   ├── testbench/
│   │   │   └── comparator_1bit_tb.v
│   │   ├── rtl/
│   │   ├── waveform/
│   │   └── README.md
│   │
│   ├── Comparator_2bit/
│   │   ├── src/
│   │   │   └── comparator_2bit.v
│   │   ├── testbench/
│   │   │   └── comparator_2bit_tb.v
│   │   ├── rtl/
│   │   ├── waveform/
│   │   └── README.md
│   │
│   ├── Comparator_4bit/
│   │   ├── src/
│   │   │   └── comparator_4bit.v
│   │   ├── testbench/
│   │   │   └── comparator_4bit_tb.v
│   │   ├── rtl/
│   │   ├── waveform/
│   │   └── README.md
│   │
│   ├── Encoder_4x2/
│   │   ├── src/
│   │   │   └── encoder_4x2.v
│   │   ├── testbench/
│   │   │   └── encoder_4x2_tb.v
│   │   ├── rtl/
│   │   ├── waveform/
│   │   └── README.md
│   │
│   ├── Priority_Encoder_4x2/
│   │   ├── src/
│   │   │   └── priority_encoder_4x2.v
│   │   ├── testbench/
│   │   │   └── priority_encoder_4x2_tb.v
│   │   ├── rtl/
│   │   ├── waveform/
│   │   └── README.md
│   │
│   ├── Decoder_2x4/
│   │   ├── src/
│   │   │   └── decoder_2x4.v
│   │   ├── testbench/
│   │   │   └── decoder_2x4_tb.v
│   │   ├── rtl/
│   │   ├── waveform/
│   │   └── README.md
│   │
│   ├── Decoder_3x8/
│   │   ├── src/
│   │   │   └── decoder_3x8.v
│   │   ├── testbench/
│   │   │   └── decoder_3x8_tb.v
│   │   ├── rtl/
│   │   ├── waveform/
│   │   └── README.md
│   │
│   ├── 2x1_MUX/
│   │   ├── src/
│   │   │   └── mux_2x1.v
│   │   ├── testbench/
│   │   │   └── mux_2x1_tb.v
│   │   ├── rtl/
│   │   ├── waveform/
│   │   └── README.md
│   │
│   ├── 4x1_MUX/
│   │   ├── src/
│   │   │   └── mux_4x1.v
│   │   ├── testbench/
│   │   │   └── mux_4x1_tb.v
│   │   ├── rtl/
│   │   ├── waveform/
│   │   └── README.md
│   │
│   ├── 8x1_MUX/
│   │   ├── src/
│   │   │   └── mux_8x1.v
│   │   ├── testbench/
│   │   │   └── mux_8x1_tb.v
│   │   ├── rtl/
│   │   ├── waveform/
│   │   └── README.md
│   │
│   ├── 1x2_DEMUX/
│   │   ├── src/
│   │   │   └── demux_1x2.v
│   │   ├── testbench/
│   │   │   └── demux_1x2_tb.v
│   │   ├── rtl/
│   │   ├── waveform/
│   │   └── README.md
│   │
│   ├── 1x4_DEMUX/
│   │   ├── src/
│   │   │   └── demux_1x4.v
│   │   ├── testbench/
│   │   │   └── demux_1x4_tb.v
│   │   ├── rtl/
│   │   ├── waveform/
│   │   └── README.md
│   │
│   ├── Binary_to_Gray/
│   │   ├── src/
│   │   │   └── binary_to_gray.v
│   │   ├── testbench/
│   │   │   └── binary_to_gray_tb.v
│   │   ├── rtl/
│   │   ├── waveform/
│   │   └── README.md
│   │
│   ├── Gray_to_Binary/
│   │   ├── src/
│   │   │   └── gray_to_binary.v
│   │   ├── testbench/
│   │   │   └── gray_to_binary_tb.v
│   │   ├── rtl/
│   │   ├── waveform/
│   │   └── README.md
│   │
│   ├── BCD_to_7Segment/
│   │   ├── src/
│   │   │   └── bcd_to_7segment.v
│   │   ├── testbench/
│   │   │   └── bcd_to_7segment_tb.v
│   │   ├── rtl/
│   │   ├── waveform/
│   │   └── README.md
│   │
│   ├── Parity_Generator/
│   │   ├── src/
│   │   │   └── parity_generator.v
│   │   ├── testbench/
│   │   │   └── parity_generator_tb.v
│   │   ├── rtl/
│   │   ├── waveform/
│   │   └── README.md
│   │
│   └── Parity_Checker/
│       ├── src/
│       │   └── parity_checker.v
│       ├── testbench/
│       │   └── parity_checker_tb.v
│       ├── rtl/
│       ├── waveform/
│       └── README.md
│
├── 📁 Sequential/
│   ├── README.md
│   │
│   ├── SR_Latch/
│   │   ├── NAND/
│   │   │   ├── src/
│   │   │   │   └── sr_latch.v
│   │   │   ├── testbench/
│   │   │   │   └── sr_latch_tb.v
│   │   │   ├── rtl/
│   │   │   ├── waveform/
│   │   │   └── README.md
│   │   └── NOR/
│   │       ├── src/
│   │       │   └── sr_latch.v
│   │       ├── testbench/
│   │       │   └── sr_latch_tb.v
│   │       ├── rtl/
│   │       ├── waveform/
│   │       └── README.md
│   │
│   ├── D_Latch/
│   │   ├── NAND/
│   │   │   ├── src/
│   │   │   │   └── d_latch.v
│   │   │   ├── testbench/
│   │   │   │   └── d_latch_tb.v
│   │   │   ├── rtl/
│   │   │   ├── waveform/
│   │   │   └── README.md
│   │   └── NOR/
│   │       ├── src/
│   │       │   └── d_latch.v
│   │       ├── testbench/
│   │       │   └── d_latch_tb.v
│   │       ├── rtl/
│   │       ├── waveform/
│   │       └── README.md
│   │
│   ├── SR_FlipFlop/
│   │   ├── NAND/
│   │   │   ├── src/
│   │   │   │   └── sr_flipflop.v
│   │   │   ├── testbench/
│   │   │   │   └── sr_flipflop_tb.v
│   │   │   ├── rtl/
│   │   │   ├── waveform/
│   │   │   └── README.md
│   │   └── NOR/
│   │       ├── src/
│   │       │   └── sr_flipflop.v
│   │       ├── testbench/
│   │       │   └── sr_flipflop_tb.v
│   │       ├── rtl/
│   │       ├── waveform/
│   │       └── README.md
│   │
│   ├── D_FlipFlop/
│   │   ├── src/
│   │   │   └── d_flipflop.v
│   │   ├── testbench/
│   │   │   └── d_flipflop_tb.v
│   │   ├── rtl/
│   │   ├── waveform/
│   │   └── README.md
│   │
│   ├── JK_FlipFlop/
│   │   ├── src/
│   │   │   └── jk_flipflop.v
│   │   ├── testbench/
│   │   │   └── jk_flipflop_tb.v
│   │   ├── rtl/
│   │   ├── waveform/
│   │   └── README.md
│   │
│   ├── T_FlipFlop/
│   │   ├── src/
│   │   │   └── t_flipflop.v
│   │   ├── testbench/
│   │   │   └── t_flipflop_tb.v
│   │   ├── rtl/
│   │   ├── waveform/
│   │   └── README.md
│   │
│   ├── Register_4bit/
│   │   ├── src/
│   │   │   └── register_4bit.v
│   │   ├── testbench/
│   │   │   └── register_4bit_tb.v
│   │   ├── rtl/
│   │   ├── waveform/
│   │   └── README.md
│   │
│   ├── SISO_Shift_Register/
│   │   ├── src/
│   │   │   └── siso_shift_register.v
│   │   ├── testbench/
│   │   │   └── siso_shift_register_tb.v
│   │   ├── rtl/
│   │   ├── waveform/
│   │   └── README.md
│   │
│   ├── SIPO_Shift_Register/
│   │   ├── src/
│   │   │   └── sipo_shift_register.v
│   │   ├── testbench/
│   │   │   └── sipo_shift_register_tb.v
│   │   ├── rtl/
│   │   ├── waveform/
│   │   └── README.md
│   │
│   ├── PISO_Shift_Register/
│   │   ├── src/
│   │   │   └── piso_shift_register.v
│   │   ├── testbench/
│   │   │   └── piso_shift_register_tb.v
│   │   ├── rtl/
│   │   ├── waveform/
│   │   └── README.md
│   │
│   ├── PIPO_Shift_Register/
│   │   ├── src/
│   │   │   └── pipo_shift_register.v
│   │   ├── testbench/
│   │   │   └── pipo_shift_register_tb.v
│   │   ├── rtl/
│   │   ├── waveform/
│   │   └── README.md
│   │
│   ├── Universal_Shift_Register/
│   │   ├── src/
│   │   │   └── universal_shift_register.v
│   │   ├── testbench/
│   │   │   └── universal_shift_register_tb.v
│   │   ├── rtl/
│   │   ├── waveform/
│   │   └── README.md
│   │
│   ├── Asynchronous_Up_Counter/
│   │   ├── src/
│   │   │   └── asynchronous_up_counter.v
│   │   ├── testbench/
│   │   │   └── asynchronous_up_counter_tb.v
│   │   ├── rtl/
│   │   ├── waveform/
│   │   └── README.md
│   │
│   ├── Asynchronous_Down_Counter/
│   │   ├── src/
│   │   │   └── asynchronous_down_counter.v
│   │   ├── testbench/
│   │   │   └── asynchronous_down_counter_tb.v
│   │   ├── rtl/
│   │   ├── waveform/
│   │   └── README.md
│   │
│   ├── Synchronous_Up_Counter/
│   │   ├── src/
│   │   │   └── synchronous_up_counter.v
│   │   ├── testbench/
│   │   │   └── synchronous_up_counter_tb.v
│   │   ├── rtl/
│   │   ├── waveform/
│   │   └── README.md
│   │
│   ├── Synchronous_Down_Counter/
│   │   ├── src/
│   │   │   └── synchronous_down_counter.v
│   │   ├── testbench/
│   │   │   └── synchronous_down_counter_tb.v
│   │   ├── rtl/
│   │   ├── waveform/
│   │   └── README.md
│   │
│   ├── Up_Down_Counter/
│   │   ├── src/
│   │   │   └── up_down_counter.v
│   │   ├── testbench/
│   │   │   └── up_down_counter_tb.v
│   │   ├── rtl/
│   │   ├── waveform/
│   │   └── README.md
│   │
│   ├── Ring_Counter/
│   │   ├── src/
│   │   │   └── ring_counter.v
│   │   ├── testbench/
│   │   │   └── ring_counter_tb.v
│   │   ├── rtl/
│   │   ├── waveform/
│   │   └── README.md
│   │
│   └── Johnson_Counter/
│       ├── src/
│       │   └── johnson_counter.v
│       ├── testbench/
│       │   └── johnson_counter_tb.v
│       ├── rtl/
│       ├── waveform/
│       └── README.md
│
├── 📁 FSM/
│   ├── README.md
│   │
│   ├── Sequence_Detector_Moore/
│   │   ├── src/
│   │   │   └── sequence_detector_moore.v
│   │   ├── testbench/
│   │   │   └── sequence_detector_moore_tb.v
│   │   ├── rtl/
│   │   ├── waveform/
│   │   └── README.md
│   │
│   ├── Sequence_Detector_Mealy/
│   │   ├── src/
│   │   │   └── sequence_detector_mealy.v
│   │   ├── testbench/
│   │   │   └── sequence_detector_mealy_tb.v
│   │   ├── rtl/
│   │   ├── waveform/
│   │   └── README.md
│   │
│   ├── Traffic_Light_Controller/
│   │   ├── src/
│   │   │   └── traffic_light_controller.v
│   │   ├── testbench/
│   │   │   └── traffic_light_controller_tb.v
│   │   ├── rtl/
│   │   ├── waveform/
│   │   └── README.md
│   │
│   ├── Digital_Door_Lock/
│   │   ├── src/
│   │   │   └── digital_door_lock.v
│   │   ├── testbench/
│   │   │   └── digital_door_lock_tb.v
│   │   ├── rtl/
│   │   ├── waveform/
│   │   └── README.md
│   │
│   ├── Vending_Machine_Controller/
│   │   ├── src/
│   │   │   └── vending_machine_controller.v
│   │   ├── testbench/
│   │   │   └── vending_machine_controller_tb.v
│   │   ├── rtl/
│   │   ├── waveform/
│   │   └── README.md
│   │
│   ├── Elevator_Controller/
│   │   ├── src/
│   │   │   └── elevator_controller.v
│   │   ├── testbench/
│   │   │   └── elevator_controller_tb.v
│   │   ├── rtl/
│   │   ├── waveform/
│   │   └── README.md
│   │
│   ├── Lift_Controller/
│   │   ├── src/
│   │   │   └── lift_controller.v
│   │   ├── testbench/
│   │   │   └── lift_controller_tb.v
│   │   ├── rtl/
│   │   ├── waveform/
│   │   └── README.md
│   │
│   ├── Washing_Machine_Controller/
│   │   ├── src/
│   │   │   └── washing_machine_controller.v
│   │   ├── testbench/
│   │   │   └── washing_machine_controller_tb.v
│   │   ├── rtl/
│   │   ├── waveform/
│   │   └── README.md
│   │
│   └── Automatic_Gate_Controller/
│       ├── src/
│       │   └── automatic_gate_controller.v
│       ├── testbench/
│       │   └── automatic_gate_controller_tb.v
│       ├── rtl/
│       ├── waveform/
│       └── README.md
│
├── 📁 Memory/
│   ├── README.md
│   │
│   ├── Single_Port_RAM/
│   │   ├── src/
│   │   │   └── single_port_ram.v
│   │   ├── testbench/
│   │   │   └── single_port_ram_tb.v
│   │   ├── rtl/
│   │   ├── waveform/
│   │   └── README.md
│   │
│   ├── Dual_Port_RAM/
│   │   ├── src/
│   │   │   └── dual_port_ram.v
│   │   ├── testbench/
│   │   │   └── dual_port_ram_tb.v
│   │   ├── rtl/
│   │   ├── waveform/
│   │   └── README.md
│   │
│   ├── SRAM/
│   │   ├── src/
│   │   │   └── sram.v
│   │   ├── testbench/
│   │   │   └── sram_tb.v
│   │   ├── rtl/
│   │   ├── waveform/
│   │   └── README.md
│   │
│   ├── ROM/
│   │   ├── src/
│   │   │   └── rom.v
│   │   ├── testbench/
│   │   │   └── rom_tb.v
│   │   ├── rtl/
│   │   ├── waveform/
│   │   └── README.md
│   │
│   ├── Register_File/
│   │   ├── src/
│   │   │   └── register_file.v
│   │   ├── testbench/
│   │   │   └── register_file_tb.v
│   │   ├── rtl/
│   │   ├── waveform/
│   │   └── README.md
│   │
│   ├── FIFO/
│   │   ├── src/
│   │   │   └── fifo.v
│   │   ├── testbench/
│   │   │   └── fifo_tb.v
│   │   ├── rtl/
│   │   ├── waveform/
│   │   └── README.md
│   │
│   └── LIFO_Stack/
│       ├── src/
│       │   └── lifo_stack.v
│       ├── testbench/
│       │   └── lifo_stack_tb.v
│       ├── rtl/
│       ├── waveform/
│       └── README.md
│
├── 📁 CPU/
│   ├── README.md
│   │
│   ├── ALU_8bit/
│   │   ├── src/
│   │   │   └── alu_8bit.v
│   │   ├── testbench/
│   │   │   └── alu_8bit_tb.v
│   │   ├── rtl/
│   │   ├── waveform/
│   │   └── README.md
│   │
│   ├── Accumulator/
│   │   ├── src/
│   │   │   └── accumulator.v
│   │   ├── testbench/
│   │   │   └── accumulator_tb.v
│   │   ├── rtl/
│   │   ├── waveform/
│   │   └── README.md
│   │
│   ├── Program_Counter/
│   │   ├── src/
│   │   │   └── program_counter.v
│   │   ├── testbench/
│   │   │   └── program_counter_tb.v
│   │   ├── rtl/
│   │   ├── waveform/
│   │   └── README.md
│   │
│   ├── Instruction_Register/
│   │   ├── src/
│   │   │   └── instruction_register.v
│   │   ├── testbench/
│   │   │   └── instruction_register_tb.v
│   │   ├── rtl/
│   │   ├── waveform/
│   │   └── README.md
│   │
│   ├── Instruction_Decoder/
│   │   ├── src/
│   │   │   └── instruction_decoder.v
│   │   ├── testbench/
│   │   │   └── instruction_decoder_tb.v
│   │   ├── rtl/
│   │   ├── waveform/
│   │   └── README.md
│   │
│   ├── Control_Unit/
│   │   ├── src/
│   │   │   └── control_unit.v
│   │   ├── testbench/
│   │   │   └── control_unit_tb.v
│   │   ├── rtl/
│   │   ├── waveform/
│   │   └── README.md
│   │
│   ├── Register_File/
│   │   ├── src/
│   │   │   └── register_file.v
│   │   ├── testbench/
│   │   │   └── register_file_tb.v
│   │   ├── rtl/
│   │   ├── waveform/
│   │   └── README.md
│   │
│   ├── Sign_Extender/
│   │   ├── src/
│   │   │   └── sign_extender.v
│   │   ├── testbench/
│   │   │   └── sign_extender_tb.v
│   │   ├── rtl/
│   │   ├── waveform/
│   │   └── README.md
│   │
│   ├── Multiplexer_Based_Control/
│   │   ├── src/
│   │   │   └── multiplexer_based_control.v
│   │   ├── testbench/
│   │   │   └── multiplexer_based_control_tb.v
│   │   ├── rtl/
│   │   ├── waveform/
│   │   └── README.md
│   │
│   └── Simple_RISC_CPU/
│       ├── src/
│       │   └── simple_risc_cpu.v
│       ├── testbench/
│       │   └── simple_risc_cpu_tb.v
│       ├── rtl/
│       ├── waveform/
│       └── README.md
│
├── 📁 Communication/
│   ├── README.md
│   │
│   ├── UART/
│   │   ├── src/
│   │   │   └── uart.v
│   │   ├── testbench/
│   │   │   └── uart_tb.v
│   │   ├── rtl/
│   │   ├── waveform/
│   │   └── README.md
│   │
│   ├── UART_TX/
│   │   ├── src/
│   │   │   └── uart_tx.v
│   │   ├── testbench/
│   │   │   └── uart_tx_tb.v
│   │   ├── rtl/
│   │   ├── waveform/
│   │   └── README.md
│   │
│   ├── UART_RX/
│   │   ├── src/
│   │   │   └── uart_rx.v
│   │   ├── testbench/
│   │   │   └── uart_rx_tb.v
│   │   ├── rtl/
│   │   ├── waveform/
│   │   └── README.md
│   │
│   ├── SPI/
│   │   ├── src/
│   │   │   └── spi.v
│   │   ├── testbench/
│   │   │   └── spi_tb.v
│   │   ├── rtl/
│   │   ├── waveform/
│   │   └── README.md
│   │
│   ├── SPI_Master/
│   │   ├── src/
│   │   │   └── spi_master.v
│   │   ├── testbench/
│   │   │   └── spi_master_tb.v
│   │   ├── rtl/
│   │   ├── waveform/
│   │   └── README.md
│   │
│   ├── SPI_Slave/
│   │   ├── src/
│   │   │   └── spi_slave.v
│   │   ├── testbench/
│   │   │   └── spi_slave_tb.v
│   │   ├── rtl/
│   │   ├── waveform/
│   │   └── README.md
│   │
│   ├── I2C/
│   │   ├── src/
│   │   │   └── i2c.v
│   │   ├── testbench/
│   │   │   └── i2c_tb.v
│   │   ├── rtl/
│   │   ├── waveform/
│   │   └── README.md
│   │
│   ├── I2C_Master/
│   │   ├── src/
│   │   │   └── i2c_master.v
│   │   ├── testbench/
│   │   │   └── i2c_master_tb.v
│   │   ├── rtl/
│   │   ├── waveform/
│   │   └── README.md
│   │
│   └── I2C_Slave/
│       ├── src/
│       │   └── i2c_slave.v
│       ├── testbench/
│       │   └── i2c_slave_tb.v
│       ├── rtl/
│       ├── waveform/
│       └── README.md
│
└── 📁 Documentation/
    ├── README.md
    ├── Verilog_Coding_Style.md
    ├── Simulation_Guide.md
    ├── Vivado_Setup.md
    └── FPGA_Notes.md
```

---

> 📊 **85 modules** · **7 categories** · Every module has `src/`, `rtl/`, `testbench/`, `waveform/` + `README.md`
