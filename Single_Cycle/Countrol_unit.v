`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.12.2025 21:32:37
// Design Name: 
// Module Name: control_unit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

// Control Unit 
// =======================
module Control_Unit(instruction, Branch, MemRead, MemtoReg, MemWrite, ALUOp, ALUSrc, RegWrite);
    input [6:0] instruction;
    output reg Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite;
    output reg [1:0] ALUOp;

    always @(*) begin
        case (instruction)
            7'b0110011: {ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp}
                        <= 8'b001000_10;

            7'b0000011: {ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp}
                        <= 8'b111100_00;

            7'b0100011: {ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp}
                        <= 8'b100010_00;

            7'b1100011: {ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp}
                        <= 8'b000001_10;
            default: begin
                            ALUSrc   = 0;
                            MemtoReg = 0;
                            RegWrite = 0;
                            MemRead  = 0;
                            MemWrite = 0;
                            Branch   = 0;
                            ALUOp    = 2'b00;
                        end

        endcase
    end
endmodule
