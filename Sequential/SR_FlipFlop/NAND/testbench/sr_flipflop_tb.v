// Module: sr_flipflop_tb
// Description: Testbench for NAND-based Master-Slave SR Flip-Flop
// Author: IgniteRTL Contributor

`timescale 1ns / 1ps

module sr_flipflop_tb;

    reg  tb_clk;
    reg  tb_s;
    reg  tb_r;
    wire tb_q;
    wire tb_q_n;

    // Instantiate the DUT
    sr_flipflop uut (
        .clk(tb_clk),
        .s(tb_s),
        .r(tb_r),
        .q(tb_q),
        .q_n(tb_q_n)
    );

    // Clock generator (50MHz / 20ns period)
    always #10 tb_clk = ~tb_clk;

    initial begin
        $monitor("Time=%0dns | clk=%b | S=%b R=%b | Q=%b Q_n=%b", 
                 $time, tb_clk, tb_s, tb_r, tb_q, tb_q_n);

        // Initialize inputs
        tb_clk = 1'b0;
        tb_s = 1'b0;
        tb_r = 1'b0;
        #15; // Wait past first clock edge

        // Test Set: S=1, R=0
        tb_s = 1'b1; tb_r = 1'b0; #20;

        // Test Hold: S=0, R=0
        tb_s = 1'b0; tb_r = 1'b0; #20;

        // Test Reset: S=0, R=1
        tb_s = 1'b0; tb_r = 1'b1; #20;

        // Test Hold
        tb_s = 1'b0; tb_r = 1'b0; #20;

        $finish;
    end

endmodule
