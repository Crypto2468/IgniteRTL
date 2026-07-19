// Module: up_down_counter_tb
// Description: Testbench for Synchronous Up/Down Counter
// Author: IgniteRTL Contributor

`timescale 1ns / 1ps

module up_down_counter_tb;

    reg  tb_clk;
    reg  tb_rst_n;
    reg  tb_up_down;
    wire [3:0] tb_q;

    // Instantiate the DUT
    up_down_counter uut (
        .clk(tb_clk),
        .rst_n(tb_rst_n),
        .up_down(tb_up_down),
        .q(tb_q)
    );

    // Clock generator
    always #10 tb_clk = ~tb_clk;

    initial begin
        $monitor("Time=%0dns | clk=%b rst_n=%b | up_down=%b | Counter=%d", 
                 $time, tb_clk, tb_rst_n, tb_up_down, tb_q);

        // Initialize inputs
        tb_clk = 1'b0; tb_rst_n = 1'b0; tb_up_down = 1'b1;
        #15;

        tb_rst_n = 1'b1;
        #80; // Count up to 4

        // Switch direction to count down
        tb_up_down = 1'b0; #100;

        $finish;
    end

endmodule
