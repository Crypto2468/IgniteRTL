// Module: siso_shift_register_tb
// Description: Testbench for SISO Shift Register
// Author: IgniteRTL Contributor

`timescale 1ns / 1ps

module siso_shift_register_tb;

    reg  tb_clk;
    reg  tb_rst_n;
    reg  tb_si;
    wire tb_so;

    // Instantiate the DUT
    siso_shift_register uut (
        .clk(tb_clk),
        .rst_n(tb_rst_n),
        .si(tb_si),
        .so(tb_so)
    );

    // Clock generator
    always #10 tb_clk = ~tb_clk;

    initial begin
        $monitor("Time=%0dns | clk=%b rst_n=%b | si=%b | so=%b (internal r=%b)", 
                 $time, tb_clk, tb_rst_n, tb_si, tb_so, uut.r);

        // Initialize inputs
        tb_clk = 1'b0; tb_rst_n = 1'b0; tb_si = 1'b0;
        #15;

        tb_rst_n = 1'b1;
        #10;

        // Shift in binary sequence 1101 LSB first
        tb_si = 1'b1; #20;
        tb_si = 1'b0; #20;
        tb_si = 1'b1; #20;
        tb_si = 1'b1; #20;

        // Shift in zeros to watch final bit shift out
        tb_si = 1'b0; #80;

        $finish;
    end

endmodule
