// Module: sr_latch_tb
// Description: Testbench for SR Latch
// Author: IgniteRTL Contributor

`timescale 1ns / 1ps

module sr_latch_tb;

    reg  tb_s;
    reg  tb_r;
    wire tb_q;
    wire tb_q_n;

    // Instantiate the Design Under Test (DUT)
    sr_latch uut (
        .s(tb_s),
        .r(tb_r),
        .q(tb_q),
        .q_n(tb_q_n)
    );

    initial begin
        // Set up console monitor
        $monitor("Time=%0dns | Inputs: S=%b R=%b | Outputs: Q=%b Q_n=%b", 
                 $time, tb_s, tb_r, tb_q, tb_q_n);

        // Apply stimuli
        
        // 1. Set State
        tb_s = 1'b1; tb_r = 1'b0; #10;

        // 2. Hold State (Q should remain 1)
        tb_s = 1'b0; tb_r = 1'b0; #10;

        // 3. Reset State
        tb_s = 1'b0; tb_r = 1'b1; #10;

        // 4. Hold State (Q should remain 0)
        tb_s = 1'b0; tb_r = 1'b0; #10;

        // 5. Invalid State (both inputs 1)
        tb_s = 1'b1; tb_r = 1'b1; #10;

        $finish;
    end

endmodule
