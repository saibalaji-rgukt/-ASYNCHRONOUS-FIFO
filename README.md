# Asynchronous FIFO Design using Verilog HDL

## Overview

This project implements an Asynchronous FIFO using Verilog HDL with Gray Code Pointer Synchronization for safe Clock Domain Crossing (CDC).

The FIFO supports independent read and write clocks and provides Full and Empty status flags.

---

## Features

- Parameterized Data Width
- Parameterized FIFO Depth
- Independent Read and Write Clocks
- Gray Code Pointer Synchronization
- Two-Flip-Flop Synchronizers
- Full Flag Generation
- Empty Flag Generation
- Synthesizable RTL Design

---

## Module Description

| Module | Function |
|----------|----------|
| async_fifo.v | Top-level FIFO module |
| fifo_mem.v | FIFO memory block |
| wptr_full.v | Write pointer and full flag logic |
| rptr_empty.v | Read pointer and empty flag logic |
| sync_r2w.v | Read pointer synchronizer |
| sync_w2r.v | Write pointer synchronizer |
| async_fifo_tb.v | Testbench |

---

## Architecture

The design consists of:

1. Write Pointer Logic
2. Read Pointer Logic
3. FIFO Memory
4. Pointer Synchronizers
5. Full and Empty Detection Logic

Gray code is used to safely transfer pointers between asynchronous clock domains.

---

## Simulation Parameters

- Data Width : 8 bits
- Address Width : 4 bits
- FIFO Depth : 16 locations
- Write Clock : 100 MHz
- Read Clock : 62.5 MHz

---

## Tools Used

- Verilog HDL
- Xilinx Vivado
- GitHub

---

## Applications

- Clock Domain Crossing (CDC)
- High-Speed Digital Systems
- Data Buffering
- Communication Interfaces
- FPGA and ASIC Designs

---

## Folder Structure

```text
async-fifo-verilog
│
├── rtl
│   ├── async_fifo.v
│   ├── fifo_mem.v
│   ├── wptr_full.v
│   ├── rptr_empty.v
│   ├── sync_r2w.v
│   └── sync_w2r.v
│
├── tb
│   └── async_fifo_tb.v
│
├── waveforms
│   └── simulation_result.png
│
├── schematic
│   └── rtl_schematic.png
│
└── README.md
```

---

## Future Improvements

- SystemVerilog Assertions
- Functional Coverage
- UVM Verification
- FPGA Implementation
- Overflow and Underflow Protection

---

## Author

Sai Balaji

B.Tech Electronics and Communication Engineering

Interested in VLSI Design and Verification
