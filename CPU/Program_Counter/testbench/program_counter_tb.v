// Module: program_counter_tb
// Description: Testbench for 8-bit Program Counter
// Author: IgniteRTL Contributor

`timescale 1ns / 1ps

module program_counter_tb;

    reg  tb_clk;
    reg  tb_rst_n;
    reg  tb_en;
    reg  tb_load;
    reg  [7:0] tb_din;
    wire [7:0] tb_pc;

    // Instantiate the DUT
    program_counter uut (
        .clk(tb_clk),
        .rst_n(tb_rst_n),
        .en(tb_en),
        .load(tb_load),
        .din(tb_din),
        .pc(tb_pc)
    );

    // Clock generator (50MHz / 20ns period)
    always #10 tb_clk = ~tb_clk;

    initial begin
        $monitor("Time=%0dns | clk=%b rst_n=%b | en=%b load=%b din=%h | pc=%h", 
                 $time, tb_clk, tb_rst_n, tb_en, tb_load, tb_din, tb_pc);

        // Initialize signals
        tb_clk = 1'b0;
        tb_rst_n = 1'b0;
        tb_en = 1'b0;
        tb_load = 1'b0;
        tb_din = 8'h00;
        #25;
        tb_rst_n = 1'b1; #10;

        // Verify increment behavior
        tb_en = 1'b1; #60; // Count 3 cycles (pc should go to 03)

        // Verify hold behavior
        tb_en = 1'b0; #40;

        // Verify load behavior
        tb_din = 8'h2C;
        tb_load = 1'b1; #20;
        tb_load = 1'b0; #10;

        // Verify counting resumes from loaded address
        tb_en = 1'b1; #40;

        // Verify reset behavior
        tb_rst_n = 1'b0; #20;
        tb_rst_n = 1'b1; #20;

        $finish;
    end

endmodule
