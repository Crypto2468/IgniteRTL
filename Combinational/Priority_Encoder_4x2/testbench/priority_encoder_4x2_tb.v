// Module: priority_encoder_4x2_tb
// Description: Testbench for 4-to-2 Priority Encoder
// Author: IgniteRTL Contributor

`timescale 1ns / 1ps

module priority_encoder_4x2_tb;

    reg  tb_i0;
    reg  tb_i1;
    reg  tb_i2;
    reg  tb_i3;
    wire [1:0] tb_y;
    wire tb_v;

    // Instantiate the Design Under Test (DUT)
    priority_encoder_4x2 uut (
        .i0(tb_i0),
        .i1(tb_i1),
        .i2(tb_i2),
        .i3(tb_i3),
        .y(tb_y),
        .v(tb_v)
    );

    initial begin
        // Set up console monitor
        $monitor("Time=%0dns | Inputs: i3=%b i2=%b i1=%b i0=%b | Outputs: y=%b v=%b", 
                 $time, tb_i3, tb_i2, tb_i1, tb_i0, tb_y, tb_v);

        // Test 1: No active inputs
        tb_i3 = 0; tb_i2 = 0; tb_i1 = 0; tb_i0 = 0; #10;

        // Test 2: Only i0 active
        tb_i3 = 0; tb_i2 = 0; tb_i1 = 0; tb_i0 = 1; #10;

        // Test 3: Only i1 active
        tb_i3 = 0; tb_i2 = 0; tb_i1 = 1; tb_i0 = 0; #10;

        // Test 4: i1 and i0 active (i1 should have priority)
        tb_i3 = 0; tb_i2 = 0; tb_i1 = 1; tb_i0 = 1; #10;

        // Test 5: i2 and i0 active (i2 should have priority)
        tb_i3 = 0; tb_i2 = 1; tb_i1 = 0; tb_i0 = 1; #10;

        // Test 6: i3 active along with others (i3 should have highest priority)
        tb_i3 = 1; tb_i2 = 1; tb_i1 = 1; tb_i0 = 1; #10;

        $finish;
    end

endmodule
