// Module: decoder_3x8_tb
// Description: Testbench for 3-to-8 Decoder
// Author: IgniteRTL Contributor

`timescale 1ns / 1ps

module decoder_3x8_tb;

    reg  [2:0] tb_a;
    reg        tb_en;
    wire tb_y0;
    wire tb_y1;
    wire tb_y2;
    wire tb_y3;
    wire tb_y4;
    wire tb_y5;
    wire tb_y6;
    wire tb_y7;

    // Instantiate the Design Under Test (DUT)
    decoder_3x8 uut (
        .a(tb_a),
        .en(tb_en),
        .y0(tb_y0),
        .y1(tb_y1),
        .y2(tb_y2),
        .y3(tb_y3),
        .y4(tb_y4),
        .y5(tb_y5),
        .y6(tb_y6),
        .y7(tb_y7)
    );

    initial begin
        // Set up console monitor
        $monitor("Time=%0dns | Inputs: en=%b a=%b | Outputs: y7=%b y6=%b y5=%b y4=%b y3=%b y2=%b y1=%b y0=%b", 
                 $time, tb_en, tb_a, tb_y7, tb_y6, tb_y5, tb_y4, tb_y3, tb_y2, tb_y1, tb_y0);

        // Test with Enable = 0
        tb_en = 1'b0;
        tb_a = 3'b000; #10;
        tb_a = 3'b111; #10;

        // Test with Enable = 1
        tb_en = 1'b1;
        tb_a = 3'b000; #10;
        tb_a = 3'b001; #10;
        tb_a = 3'b010; #10;
        tb_a = 3'b011; #10;
        tb_a = 3'b100; #10;
        tb_a = 3'b101; #10;
        tb_a = 3'b110; #10;
        tb_a = 3'b111; #10;

        $finish;
    end

endmodule
