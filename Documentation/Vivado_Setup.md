# Vivado Setup Guide

This guide describes how to install Xilinx Vivado, configure a design workspace, import source files, and run functional simulations.

## Installing Vivado
1. Go to the AMD Xilinx downloads portal.
2. Download the Vivado ML Web installer.
3. Run the installer and choose the Vivado ML Standard Edition (which is free and does not require a paid license).
4. Select the device support packages required (minimum: 7-series devices like Artix-7 to keep installation size small).
5. Complete the installation steps.

## Creating a Project
1. Open Vivado.
2. Select File -> Project -> New.
3. Click Next on the Wizard screen.
4. Specify the Project Name and Location. Click Next.
5. Select Project Type as RTL Project. Check the box for Do not specify sources at this time. Click Next.
6. Choose default board or choose a general FPGA part (e.g., Artix-7 `xc7a35tcpg236-1`). Click Next.
7. Click Finish.

## Adding Verilog Files
1. In the Flow Navigator panel (left side), click Add Sources.
2. Select Add or create design sources to add module files (from the `src/` directory). Click Next.
3. Click Add Files, navigate to the module code, select it, and click OK.
4. To add testbenches, run Add Sources again, select Add or create simulation sources, click Next, click Add Files, and choose the simulation files (from the `testbench/` directory).
5. Click Finish.

## Running Behavioral Simulation
1. Under the Flow Navigator panel, expand Simulation and click Run Simulation -> Run Behavioral Simulation.
2. The simulation workspace will open, presenting the waveform viewer.
3. Use the Zoom Fit button to auto-fit the simulation run timescale.
4. Use the Restart button to reset time to zero, set simulation step duration (e.g., `100ns`), and click the Run For button to step through execution cycles.

## Viewing RTL Schematic
1. In the Flow Navigator panel, expand Synthesis.
2. Click Open Elaborated Design.
3. The graphical schematic layout editor opens, displaying the RTL gate-level circuit representations of your modules.

## Saving Waveforms
1. Arrange signal traces in the waveform viewer as desired.
2. Select File -> Simulation Waveform -> Save As.
3. Save the waveform configuration file (`.wcfg`) into the `waveform/` directory of the project folder.
