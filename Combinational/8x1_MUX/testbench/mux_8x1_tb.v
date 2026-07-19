// Module: mux_8x1_tb
// Description: Testbench for 8-to-1 Multiplexer
// Author: IgniteRTL Contributor

`timescale 1ns / 1ps

module mux_8x1_tb;

    reg  tb_i0;
    reg  tb_i1;
    reg  tb_i2;
    reg  tb_i3;
    reg  tb_i4;
    reg  tb_i5;
    reg  tb_i6;
    reg  tb_i7;
    reg  [2:0] tb_sel;
    wire tb_y;

    // Instantiate the Design Under Test (DUT)
    mux_8x1 uut (
        .i0(tb_i0),
        .i1(tb_i1),
        .i2(tb_i2),
        .i3(tb_i3),
        .i4(tb_i4),
        .i5(tb_i5),
        .i6(tb_i6),
        .i7(tb_i7),
        .sel(tb_sel),
        .y(tb_y)
    );

    initial begin
        // Set up console monitor
        $monitor("Time=%0dns | Inputs: i0=%b i1=%b i2=%b i3=%b i4=%b i5=%b i6=%b i7=%b sel=%b | Output: y=%b", 
                 $time, tb_i0, tb_i1, tb_i2, tb_i3, tb_i4, tb_i5, tb_i6, tb_i7, tb_sel, tb_y);

        // Apply stimuli
        tb_i0 = 1'b0; tb_i1 = 1'b1; tb_i2 = 1'b0; tb_i3 = 1'b1;
        tb_i4 = 1'b0; tb_i5 = 1'b1; tb_i6 = 1'b0; tb_i7 = 1'b1;

        tb_sel = 3'b000; #10;
        tb_sel = 3'b001; #10;
        tb_sel = 3'b010; #10;
        tb_sel = 3'b011; #10;
        tb_sel = 3'b100; #10;
        tb_sel = 3'b101; #10;
        tb_sel = 3'b110; #10;
        tb_sel = 3'b111; #10;

        $finish;
    end

endmodule
