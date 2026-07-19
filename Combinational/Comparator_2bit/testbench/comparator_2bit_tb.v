// Module: comparator_2bit_tb
// Description: Testbench for 2-bit Magnitude Comparator
// Author: IgniteRTL Contributor

`timescale 1ns / 1ps

module comparator_2bit_tb;

    reg  [1:0] tb_a;
    reg  [1:0] tb_b;
    wire tb_a_eq_b;
    wire tb_a_gt_b;
    wire tb_a_lt_b;

    // Instantiate the Design Under Test (DUT)
    comparator_2bit uut (
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

        // Test cases (Equal, Greater, Less)
        tb_a = 2'b00; tb_b = 2'b00; #10;
        tb_a = 2'b01; tb_b = 2'b00; #10;
        tb_a = 2'b00; tb_b = 2'b10; #10;
        tb_a = 2'b10; tb_b = 2'b10; #10;
        tb_a = 2'b11; tb_b = 2'b01; #10;
        tb_a = 2'b01; tb_b = 2'b11; #10;
        tb_a = 2'b11; tb_b = 2'b11; #10;

        $finish;
    end

endmodule
