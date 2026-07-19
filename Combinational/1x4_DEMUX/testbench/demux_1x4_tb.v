// Module: demux_1x4_tb
// Description: Testbench for 1-to-4 Demultiplexer
// Author: IgniteRTL Contributor

`timescale 1ns / 1ps

module demux_1x4_tb;

    reg  tb_i;
    reg  [1:0] tb_sel;
    wire tb_y0;
    wire tb_y1;
    wire tb_y2;
    wire tb_y3;

    // Instantiate the Design Under Test (DUT)
    demux_1x4 uut (
        .i(tb_i),
        .sel(tb_sel),
        .y0(tb_y0),
        .y1(tb_y1),
        .y2(tb_y2),
        .y3(tb_y3)
    );

    initial begin
        // Set up console monitor
        $monitor("Time=%0dns | Inputs: i=%b sel=%b | Outputs: y3=%b y2=%b y1=%b y0=%b", 
                 $time, tb_i, tb_sel, tb_y3, tb_y2, tb_y1, tb_y0);

        // Apply stimuli (with input i = 1)
        tb_i = 1'b1;
        tb_sel = 2'b00; #10;
        tb_sel = 2'b01; #10;
        tb_sel = 2'b10; #10;
        tb_sel = 2'b11; #10;

        // Apply stimuli (with input i = 0)
        tb_i = 1'b0;
        tb_sel = 2'b00; #10;
        tb_sel = 2'b01; #10;
        tb_sel = 2'b10; #10;
        tb_sel = 2'b11; #10;

        $finish;
    end

endmodule
