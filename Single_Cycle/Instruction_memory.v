// ======================= 
// Instruction Memory 
// =======================
module Instruction_Memory(clk, reset, read_address, instruction_out);
    input clk, reset;
    input [31:0] read_address;
    output [31:0] instruction_out;

    reg [31:0] I_Memory[63:0];
    integer k;

    assign instruction_out = I_Memory[read_address];

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            for (k = 0; k < 64; k = k + 1)
                I_Memory[k] = 32'b0;
        end else 
            // R-type instructions
            I_Memory[0]  = 32'b00000000000000000000000000000000; // NOP
            I_Memory[4]  = 32'b0000000_11001_10000_000_01101_0110011; // add x13,x16,x25
            I_Memory[8]  = 32'b0100000_01000_00011_000_00101_0110011; // sub x5,x8,x3
            I_Memory[12] = 32'b0000000_00010_00011_111_00001_0110011; // and x1,x2,x3
            I_Memory[16] = 32'b0000000_00101_00011_110_00100_0110011; // or x4,x3,x5
            
            // I-type
            I_Memory[20] = 32'b000000001101_00010_000_10110_0010011; // addi x22,x21,3
            I_Memory[24] = 32'b000000000001_01000_110_01001_0010011; // ori x9,x8,1

            // Load word
            I_Memory[28] = 32'b000000000111_00101_010_01000_0000011; // lw x8,15(x5)
            I_Memory[32] = 32'b000000000011_00011_010_01001_0000011; // lw x9,3(x3)

            // Store word
            I_Memory[36] = 32'b0000000_01111_00101_010_01100_0100011; // sw x15,12(x5)
            I_Memory[40] = 32'b0000000_01110_00110_010_01010_0100011; // sw x14,10(x6)

            // Branch
            I_Memory[44] = 32'h00948663; // beq x9,x9,12
       
    end
endmodule
