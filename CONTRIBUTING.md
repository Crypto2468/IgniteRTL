# Contributing Guidelines

This document outlines the folder layout conventions, coding standards, commit structures, and pull request guidelines for the repository.

## Folder Structure
All submissions must adhere to the following self-contained directory layout:
```text
Project_Name/
├── src/
│   └── module_name.v
├── testbench/
│   └── module_name_tb.v
├── rtl/
│   └── .gitkeep
├── waveform/
│   └── .gitkeep
└── README.md
```

## Coding Style
- Write plain, synthesizable Verilog-2001 code.
- Do not use SystemVerilog elements (such as logic, always_ff, always_comb).
- Follow the guidelines in the Verilog Coding Style document for spacing, indentation, and comments.

## Commit Message Format
All commits should follow clean, lowercase, descriptive summaries:
- `Implement <Module_Name> (<Folder_Name>/<Project_Name>)`
- Example: `Implement half_adder (Arithmetic/Half_Adder)`

## Pull Request Guidelines
1. Fork the repository and create your feature branch.
2. Implement your project following the standardized directory structure.
3. Ensure behavioral simulation completes successfully with no warnings.
4. Keep the branch history clean and rebase onto main if needed.
