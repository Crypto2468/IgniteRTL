# Finite State Machines (FSM) Portfolio

Welcome to the Finite State Machines (FSM) section of the portfolio. This folder contains synthesizable, industry-standard Verilog implementations of various sequence detectors, controllers, and complex protocol logic machines.

## Project Structure
Every FSM project subdirectory follows this unified self-contained folder structure:
```text
<Project_Name>/
├── src/            # Verilog source code (.v)
├── testbench/      # Testbench stimuli verification (.v)
├── rtl/            # RTL logic gate schematics (tracked via .gitkeep)
└── waveform/       # Simulation waveform screen captures (tracked via .gitkeep)
```

## Directory Index

| # | Project Folder | Description | Ports (I/O) |
|---|---|---|---|
| 1 | [Sequence_Detector_Mealy](file:///c:/Users/crypt/OneDrive/Documents/vhdl%20library/Digital-IC-Portfolio/FSM/Sequence_Detector_Mealy) | Mealy 1011 Overlapping Sequence Detector | `clk`, `rst_n`, `din` $\rightarrow$ `dout` |
| 2 | [Sequence_Detector_Moore](file:///c:/Users/crypt/OneDrive/Documents/vhdl%20library/Digital-IC-Portfolio/FSM/Sequence_Detector_Moore) | Moore 1011 Overlapping Sequence Detector | `clk`, `rst_n`, `din` $\rightarrow$ `dout` |
| 3 | [Traffic_Light_Controller](file:///c:/Users/crypt/OneDrive/Documents/vhdl%20library/Digital-IC-Portfolio/FSM/Traffic_Light_Controller) | Dual-Highway junction traffic signal light controller | `clk`, `rst_n` $\rightarrow$ `ns_light[2:0]`, `ew_light[2:0]` |
| 4 | [Vending_Machine_Controller](file:///c:/Users/crypt/OneDrive/Documents/vhdl%20library/Digital-IC-Portfolio/FSM/Vending_Machine_Controller) | Dispenses a $1.50 item, accepts 50c/100c inputs | `clk`, `rst_n`, `coin[1:0]` $\rightarrow$ `dispense`, `change_out` |
| 5 | [Elevator_Controller](file:///c:/Users/crypt/OneDrive/Documents/vhdl%20library/Digital-IC-Portfolio/FSM/Elevator_Controller) | 3-Floor elevator cabin motion controller | `clk`, `rst_n`, `req_floor[1:0]` $\rightarrow$ `current_floor[1:0]`, `motor_up`, `motor_down`, `door_open` |
| 6 | [Washing_Machine_Controller](file:///c:/Users/crypt/OneDrive/Documents/vhdl%20library/Digital-IC-Portfolio/FSM/Washing_Machine_Controller) | Laundry process stage cycle controller | `clk`, `rst_n`, `start`, `cycle_complete` $\rightarrow$ `water_inlet`, `agitator`, `pump_out`, `spin_dry` |
| 7 | [Digital_Door_Lock](file:///c:/Users/crypt/OneDrive/Documents/vhdl%20library/Digital-IC-Portfolio/FSM/Digital_Door_Lock) | Security passcode lock validator (combo 3-1-2) | `clk`, `rst_n`, `digit[1:0]`, `valid` $\rightarrow$ `unlocked`, `alarm` |
| 8 | [Automatic_Gate_Controller](file:///c:/Users/crypt/OneDrive/Documents/vhdl%20library/Digital-IC-Portfolio/FSM/Automatic_Gate_Controller) | Motorized gate with limit switches & photo-eye | `clk`, `rst_n`, `sensor_open`, `limit_open`, `limit_close`, `obstacle` $\rightarrow$ `motor_open`, `motor_close`, `warning_led` |
| 9 | [Lift_Controller](file:///c:/Users/crypt/OneDrive/Documents/vhdl%20library/Digital-IC-Portfolio/FSM/Lift_Controller) | Elevator floor request queue dispatcher | `clk`, `rst_n`, `req_floors[2:0]` $\rightarrow$ `current_floor[1:0]`, `motor_up`, `motor_down`, `door_open` |
