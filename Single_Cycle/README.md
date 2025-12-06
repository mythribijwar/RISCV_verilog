# RISC-V RV32I Single-Cycle Processor


This project implements a single-cycle RISC-V processor (RV32I subset) in Verilog, based on the classic architecture used in computer organization (similar to Patterson & Hennessy). In a single-cycle design, every instruction executes completely in one clock cycle,

## 🔶 1. Overview of the Datapath

The processor executes one instruction per cycle by flowing through the following hardware blocks:

#### Program Counter (PC)
Holds the address of the current instruction. It increments by 4 or branches to a target address.

#### Instruction Memory
Reads a 32-bit instruction using the PC value.

#### Control Unit
Decodes the opcode (instr[6:0]) and generates control signals:
RegWrite, ALUSrc, MemRead, MemWrite, MemtoReg, Branch, ALUOp.

#### Register File
Reads two registers (rs1, rs2) and writes to one (rd) when enabled.

#### Immediate Generator
Extracts and sign-extends immediates for I-type, S-type, and SB-type instructions.

#### ALU + ALU Control
Performs arithmetic/logic operations (add, sub, and, or) based on ALUOp, funct3, funct7.

#### Data Memory
Used for lw and sw instructions.



## 🔶 2. How the Processor Works in One Clock Cycle

Each cycle performs:

1. PC → Instruction Memory


2. Instruction → Decode → Register reads


3. Immediate/ALU Control determined


4. ALU executes


5. Memory read/write (if load/store)


6. Write-back to register file


7. Branch logic updates PC
8. 
