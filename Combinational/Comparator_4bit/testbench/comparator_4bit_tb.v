// Module: comparator_4bit_tb
// Description: Testbench for 4-bit Magnitude Comparator
// Author: IgniteRTL Contributor

`timescale 1ns / 1ps

module comparator_4bit_tb;

    reg  [3:0] tb_a;
    reg  [3:0] tb_b;
    wire tb_a_eq_b;
    wire tb_a_gt_b;
    wire tb_a_lt_b;

    // Instantiate the Design Under Test (DUT)
    comparator_4bit uut (
        .a(tb_a),
        .b(tb_b),
        .a_eq_b(tb_a_eq_b),
        .a_gt_b(tb_a_gt_b),
        .a_lt_b(tb_a_lt_b)
    );

    initial begin
        // Set up console monitor
        $monitor("Time=%0dns | Inputs: a=%d b=%d | Outputs: A=B:%b A>B:%b A<B:%b", 
                 $time, tb_a, tb_b, tb_a_eq_b, tb_a_gt_b, tb_a_lt_b);

        // Apply stimuli
        tb_a = 4'd0;  tb_b = 4'd0;  #10;
        tb_a = 4'd5;  tb_b = 4'd2;  #10;
        tb_a = 4'd3;  tb_b = 4'd7;  #10;
        tb_a = 4'd12; tb_b = 4'd12; #10;
        tb_a = 4'd15; tb_b = 4'd0;  #10;
        tb_a = 4'd0;  tb_b = 4'd15; #10;
        tb_a = 4'd15; tb_b = 4'd15; #10;

        $finish;
    end

endmodule
