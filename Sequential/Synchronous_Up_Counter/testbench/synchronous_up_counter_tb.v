// Module: synchronous_up_counter_tb
// Description: Testbench for Synchronous Up Counter
// Author: IgniteRTL Contributor

`timescale 1ns / 1ps

module synchronous_up_counter_tb;

    reg  tb_clk;
    reg  tb_rst_n;
    wire [3:0] tb_q;

    // Instantiate the DUT
    synchronous_up_counter uut (
        .clk(tb_clk),
        .rst_n(tb_rst_n),
        .q(tb_q)
    );

    // Clock generator
    always #10 tb_clk = ~tb_clk;

    initial begin
        $monitor("Time=%0dns | clk=%b rst_n=%b | Counter value=%d", 
                 $time, tb_clk, tb_rst_n, tb_q);

        // Initialize inputs
        tb_clk = 1'b0; tb_rst_n = 1'b0;
        #15;

        tb_rst_n = 1'b1;
        #200;

        $finish;
    end

endmodule
