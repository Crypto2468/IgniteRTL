// Module: piso_shift_register_tb
// Description: Testbench for PISO Shift Register
// Author: IgniteRTL Contributor

`timescale 1ns / 1ps

module piso_shift_register_tb;

    reg  tb_clk;
    reg  tb_rst_n;
    reg  tb_load_shift;
    reg  [3:0] tb_pi;
    wire tb_so;

    // Instantiate the DUT
    piso_shift_register uut (
        .clk(tb_clk),
        .rst_n(tb_rst_n),
        .load_shift(tb_load_shift),
        .pi(tb_pi),
        .so(tb_so)
    );

    // Clock generator
    always #10 tb_clk = ~tb_clk;

    initial begin
        $monitor("Time=%0dns | clk=%b rst_n=%b | load_shift=%b pi=%b | so=%b (internal r=%b)", 
                 $time, tb_clk, tb_rst_n, tb_load_shift, tb_pi, tb_so, uut.r);

        // Initialize inputs
        tb_clk = 1'b0; tb_rst_n = 1'b0; tb_load_shift = 1'b0; tb_pi = 4'b0000;
        #15;

        tb_rst_n = 1'b1;
        #10;

        // Load parallel value: 1011
        tb_pi = 4'b1011; tb_load_shift = 1'b1; #20;

        // Shift out serially (load_shift = 0)
        tb_load_shift = 1'b0; #80;

        $finish;
    end

endmodule
