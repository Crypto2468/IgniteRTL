// Module: d_flipflop_tb
// Description: Testbench for D Flip-Flop
// Author: IgniteRTL Contributor

`timescale 1ns / 1ps

module d_flipflop_tb;

    reg  tb_clk;
    reg  tb_rst_n;
    reg  tb_d;
    wire tb_q;
    wire tb_q_n;

    // Instantiate the DUT
    d_flipflop uut (
        .clk(tb_clk),
        .rst_n(tb_rst_n),
        .d(tb_d),
        .q(tb_q),
        .q_n(tb_q_n)
    );

    // Clock generator
    always #10 tb_clk = ~tb_clk;

    initial begin
        $monitor("Time=%0dns | clk=%b rst_n=%b | D=%b | Q=%b Q_n=%b", 
                 $time, tb_clk, tb_rst_n, tb_d, tb_q, tb_q_n);

        // Initialize inputs
        tb_clk = 1'b0;
        tb_rst_n = 1'b0; // Active reset
        tb_d = 1'b0;
        #15;

        tb_rst_n = 1'b1; // Release reset
        #10;

        // Apply D inputs
        tb_d = 1'b1; #20;
        tb_d = 1'b0; #20;
        tb_d = 1'b1; #10;
        
        // Assert reset asynchronously
        tb_rst_n = 1'b0; #10;
        tb_rst_n = 1'b1; #20;

        $finish;
    end

endmodule
