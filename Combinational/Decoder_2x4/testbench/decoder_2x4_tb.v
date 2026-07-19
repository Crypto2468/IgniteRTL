// Module: decoder_2x4_tb
// Description: Testbench for 2-to-4 Decoder
// Author: IgniteRTL Contributor

`timescale 1ns / 1ps

module decoder_2x4_tb;

    reg  [1:0] tb_a;
    reg        tb_en;
    wire tb_y0;
    wire tb_y1;
    wire tb_y2;
    wire tb_y3;

    // Instantiate the Design Under Test (DUT)
    decoder_2x4 uut (
        .a(tb_a),
        .en(tb_en),
        .y0(tb_y0),
        .y1(tb_y1),
        .y2(tb_y2),
        .y3(tb_y3)
    );

    initial begin
        // Set up console monitor
        $monitor("Time=%0dns | Inputs: en=%b a=%b | Outputs: y3=%b y2=%b y1=%b y0=%b", 
                 $time, tb_en, tb_a, tb_y3, tb_y2, tb_y1, tb_y0);

        // Test with Enable = 0 (All outputs should be 0)
        tb_en = 1'b0;
        tb_a = 2'b00; #10;
        tb_a = 2'b01; #10;
        tb_a = 2'b10; #10;
        tb_a = 2'b11; #10;

        // Test with Enable = 1
        tb_en = 1'b1;
        tb_a = 2'b00; #10;
        tb_a = 2'b01; #10;
        tb_a = 2'b10; #10;
        tb_a = 2'b11; #10;

        $finish;
    end

endmodule
