// Module: d_latch_tb
// Description: Testbench for NAND-based Gated D Latch
// Author: IgniteRTL Contributor

`timescale 1ns / 1ps

module d_latch_tb;

    reg  tb_d;
    reg  tb_en;
    wire tb_q;
    wire tb_q_n;

    // Instantiate the DUT
    d_latch uut (
        .d(tb_d),
        .en(tb_en),
        .q(tb_q),
        .q_n(tb_q_n)
    );

    initial begin
        $monitor("Time=%0dns | Inputs: en=%b D=%b | Outputs: Q=%b Q_n=%b", 
                 $time, tb_en, tb_d, tb_q, tb_q_n);

        // Latch disabled
        tb_en = 1'b0; tb_d = 1'b1; #10;
        tb_d = 1'b0; #10;

        // Enable high (transparent mode)
        tb_en = 1'b1; tb_d = 1'b1; #10;
        tb_d = 1'b0; #10;
        tb_d = 1'b1; #10;

        // Disable latch (hold output)
        tb_en = 1'b0; tb_d = 1'b0; #10;

        $finish;
    end

endmodule
