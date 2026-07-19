// Module: binary_to_gray_tb
// Description: Testbench for Binary to Gray Code Converter
// Author: IgniteRTL Contributor

`timescale 1ns / 1ps

module binary_to_gray_tb;

    reg  [3:0] tb_bin;
    wire [3:0] tb_gray;

    // Instantiate the Design Under Test (DUT)
    binary_to_gray uut (
        .bin(tb_bin),
        .gray(tb_gray)
    );

    initial begin
        // Set up console monitor
        $monitor("Time=%0dns | Binary Input=%b (%d) | Gray Output=%b", $time, tb_bin, tb_bin, tb_gray);

        // Test several binary values
        tb_bin = 4'd0; #10;
        tb_bin = 4'd1; #10;
        tb_bin = 4'd2; #10;
        tb_bin = 4'd3; #10;
        tb_bin = 4'd4; #10;
        tb_bin = 4'd7; #10;
        tb_bin = 4'd8; #10;
        tb_bin = 4'd12; #10;
        tb_bin = 4'd15; #10;

        $finish;
    end

endmodule
