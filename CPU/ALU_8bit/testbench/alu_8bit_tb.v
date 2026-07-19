// Module: alu_8bit_tb
// Description: Testbench for 8-bit ALU
// Author: IgniteRTL Contributor

`timescale 1ns / 1ps

module alu_8bit_tb;

    reg  [2:0] tb_op_sel;
    reg  [7:0] tb_a;
    reg  [7:0] tb_b;
    wire [7:0] tb_result;
    wire tb_zero;
    wire tb_carry;

    // Instantiate the DUT
    alu_8bit uut (
        .op_sel(tb_op_sel),
        .a(tb_a),
        .b(tb_b),
        .result(tb_result),
        .zero(tb_zero),
        .carry(tb_carry)
    );

    initial begin
        $monitor("Time=%0dns | op=%b A=%h B=%h | result=%h zero=%b carry=%b", 
                 $time, tb_op_sel, tb_a, tb_b, tb_result, tb_zero, tb_carry);

        // Test ADD
        tb_a = 8'h25; tb_b = 8'h10; tb_op_sel = 3'b000; #10;
        
        // Test ADD with Carry
        tb_a = 8'hFF; tb_b = 8'h01; #10;

        // Test SUB
        tb_a = 8'h25; tb_b = 8'h10; tb_op_sel = 3'b001; #10;

        // Test AND
        tb_a = 8'hF0; tb_b = 8'hAA; tb_op_sel = 3'b010; #10;

        // Test NOT
        tb_a = 8'h0F; tb_op_sel = 3'b101; #10;

        $finish;
    end

endmodule
