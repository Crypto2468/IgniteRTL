# IgniteRTL: Industry-Quality Digital IC Portfolio

Welcome to **IgniteRTL** (formerly Digital-IC-Portfolio), a professional open-source Verilog-2001 repository demonstrating clean coding practices, modular design, self-checking verification methodology, and comprehensive documentation suitable for top semiconductor companies.

---

## 🚀 Repository structure

The repository is structured dynamically into self-contained module folders, avoiding the clutter of separate global testbench or waveform directories. Everything required for a circuit's design, verification, and analysis lies within its own folder:

```text
IgniteRTL/
├── README.md               # Repository main entrypoint
├── LICENSE                 # MIT Open-source license
├── .gitignore              # Git ignore rules for Xilinx Vivado/IDE clutter
│
├── Arithmetic/             # Binary and decimal arithmetic modules
│   ├── Half_Adder/         # Self-contained project directory
│   │   ├── src/            # Verilog source code
│   │   ├── testbench/      # Verilog testbench file
│   │   ├── truth_table/    # Truth table reference (.png)
│   │   ├── rtl/            # RTL schematic layout (.png)
│   │   ├── waveform/       # Simulation waveform screenshot (.png)
│   │   └── README.md       # Circuit-specific design documentation
│   └── ...
│
├── Combinational/          # Standard routing, encoding, and comparison blocks
│   └── ...
│
├── Sequential/             # Registers, counters, and latches
│   └── ...
│
├── FSM/                    # Controllers and sequence detector state machines
│   └── ...
│
├── Memory/                 # RAM, ROM, FIFO, and Stack memory architectures
│   └── ...
│
├── Communication/          # Standard bus and point-to-point protocols
│   └── ...
│
├── CPU/                    # Modular components for a simple RISC CPU core
│   └── ...
│
└── Documentation/          # General setup, style guides, and documentation
```

---

## 🛠️ Verification & Design Paradigm
- **Pure Verilog-2001**: Every module is written using synthesizable IEEE 1364-2001 coding guidelines. No SystemVerilog constructs are utilized.
- **Self-Contained Isolation**: Every design is completely independent with its helper cells defined locally, facilitating direct compilation in any simulator.
- **College-Lab Style Stimulus**: Testbenches are kept simple and readable, utilizing `#10` delays and `$monitor` statements for absolute transparency.
