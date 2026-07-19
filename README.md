# ⚡ IgniteRTL
Verilog project showcasing Digital Electronics, IC design, verification, and reusable RTL IP cores

This repository hosts a comprehensive collection of synthesizable digital integrated circuit (IC) designs implemented in Verilog HDL. All modules are designed to be beginner-friendly, clean, and structured, mimicking high-quality educational designs.

## 🌟 Features
- Highly structured, modular codebases.
- Standardized file and directory layout for every project.
- Self-checking testbenches with clock generators and active monitoring.
- Clear step-by-step documentation on setting up, simulating, and validating designs.

## 📂 Repository Structure
```text
Digital-IC-Portfolio/
├── Arithmetic/        # Adders, subtractors, multipliers, dividers
├── Combinational/     # Multiplexers, decoders, encoders, comparators
├── Sequential/        # Latches, flip-flops, shift registers, counters
├── FSM/               # Mealy/Moore sequence detectors, controllers
├── Memory/            # ROM, RAM, FIFO, LIFO stack, register file
├── Communication/     # UART, SPI, I2C protocol interfaces
├── CPU/               # Program counter, decoder, ALU, RISC core
└── Documentation/     # Setup guides and design specifications
```

## 🛠️ Tools Used
- **AMD Xilinx Vivado ML**: Used to perform behavioral simulation, RTL elaboration, and schematic layout inspection.
- **Verilog HDL**: Implementation language (synthesizable Verilog-2001 standard).
- **Git & GitHub**: Version control and portfolio hosting.

## 📚 Portfolio Sections

### 1. Arithmetic
Basic arithmetic building blocks including half/full adders, half/full subtractors, lookahead adders, multipliers, and restorers.

### 2. Combinational Logic
Standard multiplexers, de-multiplexers, encoders, priority decoders, comparators, BCD segment translators, and gray converters.

### 3. Sequential Logic
Latches and Flip-Flops (NAND/NOR implementations), registers, bidirectional shift registers, ring counters, and up/down counters.

### 4. Finite State Machines (FSM)
Mealy and Moore sequence detectors (1011 overlap), traffic light controllers, elevator controllers, vending machines, door locks, and lift arbiters.

### 5. Memory Systems
ROMs, single-port RAM, dual-port RAM, circular FIFO queues, LIFO stacks, register files, and SRAM interfaces.

### 6. Communication Protocols
Asynchronous UART (Transmitter, Receiver, Transceiver), SPI bus loops (Master, Slave, loopback system), and I2C buses (Master, Slave, pull-up loops).

### 7. CPU Subsystems
Instruction registers, instruction decoders, GPR register files, arithmetic logical units, control state machines, and a Simple RISC CPU core.

## 💻 How to Run a Project
1. Clone the repository:
   ```bash
   git clone https://github.com/Crypto2468/IgniteRTL.git
   ```
2. Open Vivado and follow the steps in the Vivado Setup Guide to create a project.
3. Import the specific target Verilog files from the project's `src/` directory.
4. Import the simulation files from the project's `testbench/` directory.
5. Click Run Simulation -> Run Behavioral Simulation to view the waveforms.

## 🖼️ Screenshots (Placeholders)
RTL Schematics and waveform plots can be generated using Vivado and saved under each project folder:
- RTL Schematics: Saved as `rtl/rtl.png`
- Simulation Waveforms: Saved as `waveform/waveform.png`

## 🚀 Future Improvements
- Implement a pipelined CPU core.
- Add AXI interface wrappers.
- Implement DDR3 memory controllers.

## 🔹 Author Information
Designed and developed by IgniteRTL Contributor.

## 📄 License
Licensed under the [MIT License](file:///c:/Users/crypt/OneDrive/Documents/vhdl%20library/Digital-IC-Portfolio/LICENSE).
