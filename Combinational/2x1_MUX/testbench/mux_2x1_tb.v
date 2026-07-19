// Module: mux_2x1_tb
// Description: Testbench for 2-to-1 Multiplexer
// Author: IgniteRTL Contributor

`timescale 1ns / 1ps

module mux_2x1_tb;

    reg  tb_i0;
    reg  tb_i1;
    reg  tb_sel;
    wire tb_y;

    // Instantiate the Design Under Test (DUT)
    mux_2x1 uut (
        .i0(tb_i0),
        .i1(tb_i1),
        .sel(tb_sel),
        .y(tb_y)
    );

    initial begin
        // Set up console monitor
        $monitor("Time=%0dns | Inputs: i0=%b i1=%b sel=%b | Output: y=%b", $time, tb_i0, tb_i1, tb_sel, tb_y);

        // Apply input stimuli with 10ns delays
        tb_i0 = 1'b0; tb_i1 = 1'b0; tb_sel = 1'b0; #10;
        tb_i0 = 1'b1; tb_i1 = 1'b0; tb_sel = 1'b0; #10;
        tb_i0 = 1'b0; tb_i1 = 1'b1; tb_sel = 1'b0; #10;
        tb_i0 = 1'b0; tb_i1 = 1'b1; tb_sel = 1'b1; #10;
        tb_i0 = 1'b1; tb_i1 = 1'b0; tb_sel = 1'b1; #10;
        tb_i0 = 1'b1; tb_i1 = 1'b1; tb_sel = 1'b1; #10;

        $finish;
    end

endmodule
