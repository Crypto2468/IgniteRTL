// Module: control_unit_tb
// Description: Testbench for CPU Control Unit
// Author: IgniteRTL Contributor

`timescale 1ns / 1ps

module control_unit_tb;

    reg  tb_clk;
    reg  tb_rst_n;
    reg  [3:0] tb_opcode;
    wire tb_pc_en;
    wire tb_pc_load;
    wire tb_ir_en;
    wire tb_reg_we;
    wire tb_acc_en;
    wire tb_mem_we;
    wire [2:0] tb_alu_op;

    // Instantiate the DUT
    control_unit uut (
        .clk(tb_clk),
        .rst_n(tb_rst_n),
        .opcode(tb_opcode),
        .pc_en(tb_pc_en),
        .pc_load(tb_pc_load),
        .ir_en(tb_ir_en),
        .reg_we(tb_reg_we),
        .acc_en(tb_acc_en),
        .mem_we(tb_mem_we),
        .alu_op(tb_alu_op)
    );

    // Clock generator
    always #10 tb_clk = ~tb_clk;

    initial begin
        $monitor("Time=%0dns | clk=%b rst_n=%b | state=%b opcode=%h | pc_en=%b pc_load=%b ir_en=%b reg_we=%b mem_we=%b", 
                 $time, tb_clk, tb_rst_n, uut.state, tb_opcode, tb_pc_en, tb_pc_load, tb_ir_en, tb_reg_we, tb_mem_we);

        tb_clk = 1'b0; tb_rst_n = 1'b0; tb_opcode = 4'h0; #25;
        tb_rst_n = 1'b1; #10;

        // Cycle 1: NOP / Nothin opcode
        tb_opcode = 4'h0;
        #60; // 3 clock edges for FETCH -> DECODE -> EXECUTE

        // Cycle 2: ADD instruction (opcode = 4'h1)
        tb_opcode = 4'h1;
        #60;

        // Cycle 3: JUMP instruction (opcode = 4'h7)
        tb_opcode = 4'h7;
        #60;

        $finish;
    end

endmodule
