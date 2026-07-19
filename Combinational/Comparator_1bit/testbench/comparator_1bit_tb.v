// Module: comparator_1bit_tb
// Description: Testbench for 1-bit Magnitude Comparator
// Author: IgniteRTL Contributor

`timescale 1ns / 1ps

module comparator_1bit_tb;

    reg  tb_a;
    reg  tb_b;
    wire tb_a_eq_b;
    wire tb_a_gt_b;
    wire tb_a_lt_b;

    // Instantiate the Design Under Test (DUT)
    comparator_1bit uut (
        .a(tb_a),
        .b(tb_b),
        .a_eq_b(tb_a_eq_b),
        .a_gt_b(tb_a_gt_b),
        .a_lt_b(tb_a_lt_b)
    );

    initial begin
        // Set up console monitor
        $monitor("Time=%0dns | Inputs: a=%b b=%b | Outputs: A=B:%b A>B:%b A<B:%b", 
                 $time, tb_a, tb_b, tb_a_eq_b, tb_a_gt_b, tb_a_lt_b);

        // Test all combinations
        tb_a = 1'b0; tb_b = 1'b0; #10;
        tb_a = 1'b0; tb_b = 1'b1; #10;
        tb_a = 1'b1; tb_b = 1'b0; #10;
        tb_a = 1'b1; tb_b = 1'b1; #10;

        $finish;
    end

endmodule
