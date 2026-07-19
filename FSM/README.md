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
| 2 | Sequence_Detector_Moore | Moore 1011 Overlapping Sequence Detector | *TBD* |
| 3 | Traffic_Light_Controller | Traffic Light Controller | *TBD* |
| 4 | Vending_Machine_Controller | Vending Machine Controller | *TBD* |
| 5 | Elevator_Controller | Elevator Controller | *TBD* |
| 6 | Washing_Machine_Controller | Washing Machine Controller | *TBD* |
| 7 | Digital_Door_Lock | Digital Door Lock | *TBD* |
| 8 | Automatic_Gate_Controller | Automatic Gate Controller | *TBD* |
| 9 | Lift_Controller | Lift Controller | *TBD* |
