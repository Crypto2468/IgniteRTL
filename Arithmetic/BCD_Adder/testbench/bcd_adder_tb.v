// Module: bcd_adder_tb
// Description: Testbench for BCD Adder
// Author: IgniteRTL Contributor

`timescale 1ns / 1ps

module bcd_adder_tb;

    reg  [3:0] tb_a;
    reg  [3:0] tb_b;
    reg        tb_cin;
    wire [3:0] tb_sum;
    wire       tb_cout;

    // Instantiate the Design Under Test (DUT)
    bcd_adder uut (
        .a(tb_a),
        .b(tb_b),
        .cin(tb_cin),
        .sum(tb_sum),
        .cout(tb_cout)
    );

    initial begin
        // Set up console monitor
        $monitor("Time=%0dns | Inputs: a=%d b=%d cin=%b | Outputs: sum=%d cout=%b", 
                 $time, tb_a, tb_b, tb_cin, tb_sum, tb_cout);

        // Test 1: 3 + 4 = 7 (cout = 0)
        tb_a = 4'd3; tb_b = 4'd4; tb_cin = 1'b0; #10;

        // Test 2: 8 + 5 = 13 -> sum = 3, cout = 1
        tb_a = 4'd8; tb_b = 4'd5; tb_cin = 1'b0; #10;

        // Test 3: 9 + 9 + 1 = 19 -> sum = 9, cout = 1
        tb_a = 4'd9; tb_b = 4'd9; tb_cin = 1'b1; #10;

        // Test 4: 0 + 0 = 0 (cout = 0)
        tb_a = 4'd0; tb_b = 4'd0; tb_cin = 1'b0; #10;

        $finish;
    end

endmodule
