// Module: sr_latch_tb
// Description: Testbench for NAND-based SR Latch
// Author: IgniteRTL Contributor

`timescale 1ns / 1ps

module sr_latch_tb;

    reg  tb_s_n;
    reg  tb_r_n;
    wire tb_q;
    wire tb_q_n;

    // Instantiate the Design Under Test (DUT)
    sr_latch uut (
        .s_n(tb_s_n),
        .r_n(tb_r_n),
        .q(tb_q),
        .q_n(tb_q_n)
    );

    initial begin
        // Set up console monitor
        $monitor("Time=%0dns | Inputs: S_n=%b R_n=%b | Outputs: Q=%b Q_n=%b", 
                 $time, tb_s_n, tb_r_n, tb_q, tb_q_n);

        // Apply stimuli (Active-low inputs)
        
        // 1. Set State (S_n=0, R_n=1)
        tb_s_n = 1'b0; tb_r_n = 1'b1; #10;

        // 2. Hold State (S_n=1, R_n=1) -> Q should remain 1
        tb_s_n = 1'b1; tb_r_n = 1'b1; #10;

        // 3. Reset State (S_n=1, R_n=0)
        tb_s_n = 1'b1; tb_r_n = 1'b0; #10;

        // 4. Hold State (S_n=1, R_n=1) -> Q should remain 0
        tb_s_n = 1'b1; tb_r_n = 1'b1; #10;

        // 5. Invalid State (both inputs 0)
        tb_s_n = 1'b0; tb_r_n = 1'b0; #10;

        $finish;
    end

endmodule
