// Module: johnson_counter_tb
// Description: Testbench for Johnson Counter
// Author: IgniteRTL Contributor

`timescale 1ns / 1ps

module johnson_counter_tb;

    reg  tb_clk;
    reg  tb_rst_n;
    wire [3:0] tb_q;

    // Instantiate the DUT
    johnson_counter uut (
        .clk(tb_clk),
        .rst_n(tb_rst_n),
        .q(tb_q)
    );

    // Clock generator
    always #10 tb_clk = ~tb_clk;

    initial begin
        $monitor("Time=%0dns | clk=%b rst_n=%b | Output state: Q=%b", 
                 $time, tb_clk, tb_rst_n, tb_q);

        // Initialize inputs
        tb_clk = 1'b0; tb_rst_n = 1'b0;
        #15;

        tb_rst_n = 1'b1; // Release reset
        #180; // Let it run for 9 clock cycles

        $finish;
    end

endmodule
