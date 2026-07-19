// Module: demux_1x2_tb
// Description: Testbench for 1-to-2 Demultiplexer
// Author: IgniteRTL Contributor

`timescale 1ns / 1ps

module demux_1x2_tb;

    reg  tb_i;
    reg  tb_sel;
    wire tb_y0;
    wire tb_y1;

    // Instantiate the Design Under Test (DUT)
    demux_1x2 uut (
        .i(tb_i),
        .sel(tb_sel),
        .y0(tb_y0),
        .y1(tb_y1)
    );

    initial begin
        // Set up console monitor
        $monitor("Time=%0dns | Inputs: i=%b sel=%b | Outputs: y0=%b y1=%b", $time, tb_i, tb_sel, tb_y0, tb_y1);

        // Apply stimuli
        tb_i = 1'b0; tb_sel = 1'b0; #10;
        tb_i = 1'b1; tb_sel = 1'b0; #10;
        tb_i = 1'b1; tb_sel = 1'b1; #10;
        tb_i = 1'b0; tb_sel = 1'b1; #10;

        $finish;
    end

endmodule
