# 8x8 RAM Design in Verilog

This repository contains the Verilog implementation of an **8×8 Random Access Memory (RAM)** module along with a testbench for simulation and verification.

## Project Overview
The project demonstrates the design and simulation of a small memory unit using Verilog HDL. The RAM consists of **8 memory locations**, each capable of storing **8-bit data**. The design supports both **read and write operations** controlled by input signals.

## Features
- 8 memory locations
- Each location stores 8-bit data
- Separate read and write functionality
- Synchronous design using clock signal
- Testbench included for verification

## Inputs
- `clk` – Clock signal
- `w_en` – Write enable signal
- `W_addr` – 3-bit address input (selects memory location for write operation)
- `rd_addr`- 3-bit address input (selects memory location for read operation)
- `data_in` – 8-bit input data

## Output
- `data_out` – 8-bit output data

## Working
- When **write enable (w_en = 1)**, the input data is written into the selected memory address on the clock edge.
- When **write enable (w_en = 0)**, the stored data from the selected address is read and provided at the output.

## Tools Used
- Verilog HDL
- GTKWave (for waveform visualization)

## Simulation
The repository also contains a **testbench** that verifies:
- Write operation
- Read operation
- Correct storage of data in memory locations

## Applications
- Basic memory design learning
- Digital system design practice
- VLSI design and verification projects

## Author
Vishal Yadav
M.Tech VLSI Design
