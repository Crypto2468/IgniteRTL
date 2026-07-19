// Module: alu_4bit_tb
// Description: Testbench for 4-bit Magnitude ALU
// Author: IgniteRTL Contributor

`timescale 1ns / 1ps

module alu_4bit_tb;

    reg  [3:0] tb_a;
    reg  [3:0] tb_b;
    reg  [2:0] tb_op;
    wire [3:0] tb_out;
    wire       tb_carry;

    // Instantiate the Design Under Test (DUT)
    alu_4bit uut (
        .a(tb_a),
        .b(tb_b),
        .op(tb_op),
        .out(tb_out),
        .carry(tb_carry)
    );

    initial begin
        // Set up console monitor
        $monitor("Time=%0dns | op=%b a=%d b=%d | out=%d carry=%b", 
                 $time, tb_op, tb_a, tb_b, tb_out, tb_carry);

        // Inputs default
        tb_a = 4'd6; tb_b = 4'd3;

        // Test 0: Addition
        tb_op = 3'b000; #10;
        
        // Test 1: Subtraction
        tb_op = 3'b001; #10;
        
        // Test 2: Logical AND
        tb_op = 3'b010; #10;
        
        // Test 3: Logical OR
        tb_op = 3'b011; #10;
        
        // Test 4: Logical XOR
        tb_op = 3'b100; #10;
        
        // Test 5: Logical NOT A
        tb_op = 3'b101; #10;
        
        // Test 6: Shift Left
        tb_op = 3'b110; #10;
        
        // Test 7: Shift Right
        tb_op = 3'b111; #10;

        $finish;
    end

endmodule
