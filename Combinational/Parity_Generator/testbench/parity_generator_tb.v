// Module: parity_generator_tb
// Description: Testbench for Parity Generator
// Author: IgniteRTL Contributor

`timescale 1ns / 1ps

module parity_generator_tb;

    reg  [3:0] tb_data_in;
    wire tb_parity_even;
    wire tb_parity_odd;

    // Instantiate the Design Under Test (DUT)
    parity_generator uut (
        .data_in(tb_data_in),
        .parity_even(tb_parity_even),
        .parity_odd(tb_parity_odd)
    );

    initial begin
        // Set up console monitor
        $monitor("Time=%0dns | Input Data=%b | Even Parity Out=%b | Odd Parity Out=%b", 
                 $time, tb_data_in, tb_parity_even, tb_parity_odd);

        // Apply stimuli
        tb_data_in = 4'b0000; #10;
        tb_data_in = 4'b0001; #10;
        tb_data_in = 4'b0011; #10;
        tb_data_in = 4'b0111; #10;
        tb_data_in = 4'b1111; #10;
        tb_data_in = 4'b1010; #10;

        $finish;
    end

endmodule
