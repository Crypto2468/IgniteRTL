// Module: universal_shift_register_tb
// Description: Testbench for Universal Shift Register
// Author: IgniteRTL Contributor

`timescale 1ns / 1ps

module universal_shift_register_tb;

    reg  tb_clk;
    reg  tb_rst_n;
    reg  [1:0] tb_mode;
    reg  tb_srin;
    reg  tb_slin;
    reg  [3:0] tb_d;
    wire [3:0] tb_q;

    // Instantiate the DUT
    universal_shift_register uut (
        .clk(tb_clk),
        .rst_n(tb_rst_n),
        .mode(tb_mode),
        .srin(tb_srin),
        .slin(tb_slin),
        .d(tb_d),
        .q(tb_q)
    );

    // Clock generator
    always #10 tb_clk = ~tb_clk;

    initial begin
        $monitor("Time=%0dns | clk=%b rst_n=%b | mode=%b Q=%b", 
                 $time, tb_clk, tb_rst_n, tb_mode, tb_q);

        // Initialize inputs
        tb_clk = 1'b0; tb_rst_n = 1'b0;
        tb_mode = 2'b00; tb_srin = 1'b0; tb_slin = 1'b0; tb_d = 4'b0000;
        #15;

        tb_rst_n = 1'b1;
        #10;

        // Test Load Mode: 11
        tb_d = 4'b1101; tb_mode = 2'b11; #20;

        // Test Hold Mode: 00
        tb_mode = 2'b00; #20;

        // Test Shift Right Mode: 01 (Shift in a '1')
        tb_srin = 1'b1; tb_mode = 2'b01; #20;
        tb_srin = 1'b0; #20;

        // Test Shift Left Mode: 10 (Shift in a '1')
        tb_slin = 1'b1; tb_mode = 2'b10; #20;

        $finish;
    end

endmodule
