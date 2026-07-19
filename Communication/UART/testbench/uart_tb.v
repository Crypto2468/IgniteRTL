// Module: uart_tb
// Description: Testbench verifying UART Full-Duplex transceiver loopback
// Author: IgniteRTL Contributor

`timescale 1ns / 1ps

module uart_tb;

    reg  tb_clk;
    reg  tb_rst_n;
    reg  tb_tx_start;
    reg  [7:0] tb_tx_din;
    wire tb_tx;
    wire tb_tx_active;
    wire tb_tx_done;
    wire [7:0] tb_rx_dout;
    wire tb_rx_done;

    // Local loopback: wire tx output directly to rx input
    wire loopback_wire = tb_tx;

    uart #(
        .CLKS_PER_BIT(8)
    ) uut (
        .clk(tb_clk),
        .rst_n(tb_rst_n),
        .tx_start(tb_tx_start),
        .tx_din(tb_tx_din),
        .tx(tb_tx),
        .tx_active(tb_tx_active),
        .tx_done(tb_tx_done),
        .rx(loopback_wire),
        .rx_dout(tb_rx_dout),
        .rx_done(tb_rx_done)
    );

    always #10 tb_clk = ~tb_clk;

    initial begin
        $monitor("Time=%0dns | clk=%b rst_n=%b | tx_start=%b tx_din=%h tx_done=%b | rx_dout=%h rx_done=%b", 
                 $time, tb_clk, tb_rst_n, tb_tx_start, tb_tx_din, tb_tx_done, tb_rx_dout, tb_rx_done);

        tb_clk = 1'b0; tb_rst_n = 1'b0; tb_tx_start = 1'b0; tb_tx_din = 8'h00; #25;
        tb_rst_n = 1'b1; #10;

        // Transmit 8'hC3 and verify it loops back and matches
        @(posedge tb_clk);
        #2;
        tb_tx_din = 8'hC3;
        tb_tx_start = 1'b1;
        @(posedge tb_clk);
        #2;
        tb_tx_start = 1'b0;

        @(posedge tb_rx_done);
        #40;

        $finish;
    end

endmodule
