// Module: register_4bit_tb
// Description: Testbench for 4-bit Register
// Author: IgniteRTL Contributor

`timescale 1ns / 1ps

module register_4bit_tb;

    reg  tb_clk;
    reg  tb_rst_n;
    reg  tb_load;
    reg  [3:0] tb_d;
    wire [3:0] tb_q;

    // Instantiate the DUT
    register_4bit uut (
        .clk(tb_clk),
        .rst_n(tb_rst_n),
        .load(tb_load),
        .d(tb_d),
        .q(tb_q)
    );

    // Clock generator
    always #10 tb_clk = ~tb_clk;

    initial begin
        $monitor("Time=%0dns | clk=%b rst_n=%b | load=%b D=%b | Q=%b", 
                 $time, tb_clk, tb_rst_n, tb_load, tb_d, tb_q);

        // Initialize inputs
        tb_clk = 1'b0;
        tb_rst_n = 1'b0;
        tb_load = 1'b0;
        tb_d = 4'b0000;
        #15;

        tb_rst_n = 1'b1;
        #10;

        // Try load with load=0 (should remain 0)
        tb_d = 4'b1010; tb_load = 1'b0; #20;

        // Load value
        tb_load = 1'b1; #20;

        // Hold value
        tb_d = 4'b0101; tb_load = 1'b0; #20;

        // Load new value
        tb_load = 1'b1; #20;

        $finish;
    end

endmodule
