// Module: mux_4x1_tb
// Description: Testbench for 4-to-1 Multiplexer
// Author: IgniteRTL Contributor

`timescale 1ns / 1ps

module mux_4x1_tb;

    reg  tb_i0;
    reg  tb_i1;
    reg  tb_i2;
    reg  tb_i3;
    reg  [1:0] tb_sel;
    wire tb_y;

    // Instantiate the Design Under Test (DUT)
    mux_4x1 uut (
        .i0(tb_i0),
        .i1(tb_i1),
        .i2(tb_i2),
        .i3(tb_i3),
        .sel(tb_sel),
        .y(tb_y)
    );

    initial begin
        // Set up console monitor
        $monitor("Time=%0dns | Inputs: i0=%b i1=%b i2=%b i3=%b sel=%b | Output: y=%b", $time, tb_i0, tb_i1, tb_i2, tb_i3, tb_sel, tb_y);

        // Apply stimuli
        tb_i0 = 1'b1; tb_i1 = 1'b0; tb_i2 = 1'b1; tb_i3 = 1'b0;
        
        tb_sel = 2'b00; #10;
        tb_sel = 2'b01; #10;
        tb_sel = 2'b10; #10;
        tb_sel = 2'b11; #10;
        
        tb_i1 = 1'b1; tb_sel = 2'b01; #10;
        tb_i3 = 1'b1; tb_sel = 2'b11; #10;

        $finish;
    end

endmodule
