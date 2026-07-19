// Module: pipo_shift_register_tb
// Description: Testbench for PIPO Shift Register
// Author: IgniteRTL Contributor

`timescale 1ns / 1ps

module pipo_shift_register_tb;

    reg  tb_clk;
    reg  tb_rst_n;
    reg  [3:0] tb_pi;
    wire [3:0] tb_po;

    // Instantiate the DUT
    pipo_shift_register uut (
        .clk(tb_clk),
        .rst_n(tb_rst_n),
        .pi(tb_pi),
        .po(tb_po)
    );

    // Clock generator
    always #10 tb_clk = ~tb_clk;

    initial begin
        $monitor("Time=%0dns | clk=%b rst_n=%b | pi=%b | po=%b", 
                 $time, tb_clk, tb_rst_n, tb_pi, tb_po);

        // Initialize inputs
        tb_clk = 1'b0; tb_rst_n = 1'b0; tb_pi = 4'b0000;
        #15;

        tb_rst_n = 1'b1;
        #10;

        // Apply parallel inputs
        tb_pi = 4'b1010; #20;
        tb_pi = 4'b0101; #20;
        tb_pi = 4'b1111; #20;

        $finish;
    end

endmodule
