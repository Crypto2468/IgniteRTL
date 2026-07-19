// Module: t_flipflop_tb
// Description: Testbench for T Flip-Flop
// Author: IgniteRTL Contributor

`timescale 1ns / 1ps

module t_flipflop_tb;

    reg  tb_clk;
    reg  tb_rst_n;
    reg  tb_t;
    wire tb_q;
    wire tb_q_n;

    // Instantiate the DUT
    t_flipflop uut (
        .clk(tb_clk),
        .rst_n(tb_rst_n),
        .t(tb_t),
        .q(tb_q),
        .q_n(tb_q_n)
    );

    // Clock generator
    always #10 tb_clk = ~tb_clk;

    initial begin
        $monitor("Time=%0dns | clk=%b rst_n=%b | T=%b | Q=%b Q_n=%b", 
                 $time, tb_clk, tb_rst_n, tb_t, tb_q, tb_q_n);

        // Initialize inputs
        tb_clk = 1'b0;
        tb_rst_n = 1'b0; // Active reset
        tb_t = 1'b0;
        #15;

        tb_rst_n = 1'b1; // Release reset
        #10;

        // Test Toggle Enable
        tb_t = 1'b1; #40;
        
        // Test Toggle Disable
        tb_t = 1'b0; #20;

        // Test Toggle Enable again
        tb_t = 1'b1; #20;

        $finish;
    end

endmodule
