// Module: uart_tx_tb
// Description: Testbench for UART Transmitter
// Author: IgniteRTL Contributor

`timescale 1ns / 1ps

module uart_tx_tb;

    reg  tb_clk;
    reg  tb_rst_n;
    reg  tb_tx_start;
    reg  [7:0] tb_din;
    wire tb_tx;
    wire tb_tx_active;
    wire tb_tx_done;

    // Instantiate the DUT (Configure CLKS_PER_BIT to 8 for fast simulation)
    uart_tx #(
        .CLKS_PER_BIT(8)
    ) uut (
        .clk(tb_clk),
        .rst_n(tb_rst_n),
        .tx_start(tb_tx_start),
        .din(tb_din),
        .tx(tb_tx),
        .tx_active(tb_tx_active),
        .tx_done(tb_tx_done)
    );

    // Clock generator (50MHz / 20ns period)
    always #10 tb_clk = ~tb_clk;

    initial begin
        $monitor("Time=%0dns | clk=%b rst_n=%b | state=%b active=%b done=%b | tx=%b | clk_cnt=%d bit_idx=%d", 
                 $time, tb_clk, tb_rst_n, uut.state, tb_tx_active, tb_tx_done, tb_tx, uut.clk_cnt, uut.bit_idx);

        // Initialize signals
        tb_clk = 1'b0;
        tb_rst_n = 1'b0;
        tb_tx_start = 1'b0;
        tb_din = 8'h00;
        #25;
        tb_rst_n = 1'b1; #10;

        // Transmit 8'h5A (binary 01011010)
        // Expected bits: Start (0) -> 0 -> 1 -> 0 -> 1 -> 1 -> 0 -> 1 -> 0 -> Stop (1)
        @(posedge tb_clk);
        #2;
        tb_din = 8'h5A;
        tb_tx_start = 1'b1;
        @(posedge tb_clk);
        #2;
        tb_tx_start = 1'b0;

        // Wait until done
        @(posedge tb_tx_done);
        #40;

        // Transmit 8'hC3 (binary 11000011)
        @(posedge tb_clk);
        #2;
        tb_din = 8'hC3;
        tb_tx_start = 1'b1;
        @(posedge tb_clk);
        #2;
        tb_tx_start = 1'b0;

        @(posedge tb_tx_done);
        #40;

        $finish;
    end

endmodule
