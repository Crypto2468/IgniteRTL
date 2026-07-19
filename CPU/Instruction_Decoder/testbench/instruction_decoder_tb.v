// Module: instruction_decoder_tb
// Description: Testbench for Instruction Decoder
// Author: IgniteRTL Contributor

`timescale 1ns / 1ps

module instruction_decoder_tb;

    reg  [15:0] tb_instr;
    wire [3:0] tb_opcode;
    wire [1:0] tb_rd;
    wire [1:0] tb_rs;
    wire [7:0] tb_imm;

    // Instantiate the DUT
    instruction_decoder uut (
        .instr(tb_instr),
        .opcode(tb_opcode),
        .rd(tb_rd),
        .rs(tb_rs),
        .imm(tb_imm)
    );

    initial begin
        $monitor("Time=%0dns | instr=%h | opcode=%h rd=%d rs=%d imm=%h", 
                 $time, tb_instr, tb_opcode, tb_rd, tb_rs, tb_imm);

        // Test Instruction: 16'h128F (Opcode 1, Rd 2, Rs 0, Imm 8'h8F)
        tb_instr = 16'h128F; #10;

        // Test Instruction: 16'h5DFF (Opcode 5, Rd 3, Rs 1, Imm 8'hFF)
        tb_instr = 16'h5DFF; #10;

        $finish;
    end

endmodule
