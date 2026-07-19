// Module: sipo_shift_register_tb
// Description: Testbench for SIPO Shift Register
// Author: IgniteRTL Contributor

`timescale 1ns / 1ps

module sipo_shift_register_tb;

    reg  tb_clk;
    reg  tb_rst_n;
    reg  tb_si;
    wire [3:0] tb_po;

    // Instantiate the DUT
    sipo_shift_register uut (
        .clk(tb_clk),
        .rst_n(tb_rst_n),
        .si(tb_si),
        .po(tb_po)
    );

    // Clock generator
    always #10 tb_clk = ~tb_clk;

    initial begin
        $monitor("Time=%0dns | clk=%b rst_n=%b | si=%b | po=%b", 
                 $time, tb_clk, tb_rst_n, tb_si, tb_po);

        // Initialize inputs
        tb_clk = 1'b0; tb_rst_n = 1'b0; tb_si = 1'b0;
        #15;

        tb_rst_n = 1'b1;
        #10;

        // Shift in sequence 1011 (one bit per clock)
        tb_si = 1'b1; #20;
        tb_si = 1'b1; #20;
        tb_si = 1'b0; #20;
        tb_si = 1'b1; #20;

        $finish;
    end

endmodule
