// Module: encoder_4x2_tb
// Description: Testbench for 4-to-2 Binary Encoder
// Author: IgniteRTL Contributor

`timescale 1ns / 1ps

module encoder_4x2_tb;

    reg  tb_i0;
    reg  tb_i1;
    reg  tb_i2;
    reg  tb_i3;
    wire [1:0] tb_y;

    // Instantiate the Design Under Test (DUT)
    encoder_4x2 uut (
        .i0(tb_i0),
        .i1(tb_i1),
        .i2(tb_i2),
        .i3(tb_i3),
        .y(tb_y)
    );

    initial begin
        // Set up console monitor
        $monitor("Time=%0dns | Inputs: i3=%b i2=%b i1=%b i0=%b | Output: y=%b", 
                 $time, tb_i3, tb_i2, tb_i1, tb_i0, tb_y);

        // Apply stimuli: assert one input high at a time
        tb_i3 = 0; tb_i2 = 0; tb_i1 = 0; tb_i0 = 1; #10;
        tb_i3 = 0; tb_i2 = 0; tb_i1 = 1; tb_i0 = 0; #10;
        tb_i3 = 0; tb_i2 = 1; tb_i1 = 0; tb_i0 = 0; #10;
        tb_i3 = 1; tb_i2 = 0; tb_i1 = 0; tb_i0 = 0; #10;
        
        // Test default case
        tb_i3 = 0; tb_i2 = 0; tb_i1 = 0; tb_i0 = 0; #10;

        $finish;
    end

endmodule
