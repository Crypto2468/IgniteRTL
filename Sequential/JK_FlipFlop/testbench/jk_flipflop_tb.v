// Module: jk_flipflop_tb
// Description: Testbench for JK Flip-Flop
// Author: IgniteRTL Contributor

`timescale 1ns / 1ps

module jk_flipflop_tb;

    reg  tb_clk;
    reg  tb_rst;
    reg  tb_j;
    reg  tb_k;
    wire tb_q;
    wire tb_q_n;

    // Instantiate the DUT
    jk_flipflop uut (
        .clk(tb_clk),
        .rst(tb_rst),
        .j(tb_j),
        .k(tb_k),
        .q(tb_q),
        .q_n(tb_q_n)
    );

    // Clock generator
    always #10 tb_clk = ~tb_clk;

    initial begin
        $monitor("Time=%0dns | clk=%b rst=%b | J=%b K=%b | Q=%b Q_n=%b", 
                 $time, tb_clk, tb_rst, tb_j, tb_k, tb_q, tb_q_n);

        // Initialize inputs
        tb_clk = 1'b0;
        tb_rst = 1'b1;
        tb_j = 1'b0;
        tb_k = 1'b0;
        #15; // Apply reset

        tb_rst = 1'b0;
        #10;

        // Test Set: J=1, K=0
        tb_j = 1'b1; tb_k = 1'b0; #20;

        // Test Hold: J=0, K=0
        tb_j = 1'b0; tb_k = 1'b0; #20;

        // Test Reset: J=0, K=1
        tb_j = 1'b0; tb_k = 1'b1; #20;

        // Test Toggle: J=1, K=1
        tb_j = 1'b1; tb_k = 1'b1; #40;

        $finish;
    end

endmodule
