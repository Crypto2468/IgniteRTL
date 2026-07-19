// Module: gray_to_binary_tb
// Description: Testbench for Gray to Binary Code Converter
// Author: IgniteRTL Contributor

`timescale 1ns / 1ps

module gray_to_binary_tb;

    reg  [3:0] tb_gray;
    wire [3:0] tb_bin;

    // Instantiate the Design Under Test (DUT)
    gray_to_binary uut (
        .gray(tb_gray),
        .bin(tb_bin)
    );

    initial begin
        // Set up console monitor
        $monitor("Time=%0dns | Gray Input=%b | Binary Output=%b (%d)", $time, tb_gray, tb_bin, tb_bin);

        // Test several Gray code values (corresponds to binary 0, 1, 3, 2, 6, 7, 8, 12, 15)
        tb_gray = 4'b0000; #10;
        tb_gray = 4'b0001; #10;
        tb_gray = 4'b0010; #10;
        tb_gray = 4'b0011; #10;
        tb_gray = 4'b0110; #10;
        tb_gray = 4'b0100; #10;
        tb_gray = 4'b1100; #10;
        tb_gray = 4'b1010; #10;
        tb_gray = 4'b1000; #10;

        $finish;
    end

endmodule
