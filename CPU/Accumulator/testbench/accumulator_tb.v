// Module: accumulator_tb
// Description: Testbench for Accumulator Register
// Author: IgniteRTL Contributor

`timescale 1ns / 1ps

module accumulator_tb;

    reg  tb_clk;
    reg  tb_rst_n;
    reg  tb_en;
    reg  [7:0] tb_din;
    wire [7:0] tb_dout;

    // Instantiate the DUT
    accumulator uut (
        .clk(tb_clk),
        .rst_n(tb_rst_n),
        .en(tb_en),
        .din(tb_din),
        .dout(tb_dout)
    );

    // Clock generator
    always #10 tb_clk = ~tb_clk;

    initial begin
        $monitor("Time=%0dns | clk=%b rst_n=%b | en=%b din=%h | dout=%h", 
                 $time, tb_clk, tb_rst_n, tb_en, tb_din, tb_dout);

        tb_clk = 1'b0; tb_rst_n = 1'b0; tb_en = 1'b0; tb_din = 8'h00; #25;
        tb_rst_n = 1'b1; #10;

        // Load value 8'hAA
        tb_din = 8'hAA;
        tb_en = 1'b1; #20;

        // Disable write, verify hold
        tb_en = 1'b0;
        tb_din = 8'h55; #20;

        // Re-enable and load 8'h55
        tb_en = 1'b1; #20;
        tb_en = 1'b0; #20;

        $finish;
    end

endmodule
