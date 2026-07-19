// Module: bcd_to_7segment_tb
// Description: Testbench for BCD to 7-Segment Decoder
// Author: IgniteRTL Contributor

`timescale 1ns / 1ps

module bcd_to_7segment_tb;

    reg  [3:0] tb_bcd;
    wire [6:0] tb_seg;

    // Instantiate the Design Under Test (DUT)
    bcd_to_7segment uut (
        .bcd(tb_bcd),
        .seg(tb_seg)
    );

    initial begin
        // Set up console monitor
        $monitor("Time=%0dns | BCD Input: %d (%b) | 7-Segment Output {g,f,e,d,c,b,a}: %b", 
                 $time, tb_bcd, tb_bcd, tb_seg);

        // Apply stimuli for BCD digits 0-9
        tb_bcd = 4'd0; #10;
        tb_bcd = 4'd1; #10;
        tb_bcd = 4'd2; #10;
        tb_bcd = 4'd3; #10;
        tb_bcd = 4'd4; #10;
        tb_bcd = 4'd5; #10;
        tb_bcd = 4'd6; #10;
        tb_bcd = 4'd7; #10;
        tb_bcd = 4'd8; #10;
        tb_bcd = 4'd9; #10;
        
        // Test invalid/out-of-range BCD digit
        tb_bcd = 4'd12; #10;

        $finish;
    end

endmodule
