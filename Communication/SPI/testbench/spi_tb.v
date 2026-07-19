// Module: spi_tb
// Description: Testbench verifying local loopback master-slave SPI system
// Author: IgniteRTL Contributor

`timescale 1ns / 1ps

module spi_tb;

    reg  tb_clk;
    reg  tb_rst_n;
    reg  tb_master_start;
    reg  [7:0] tb_master_tx;
    wire [7:0] tb_master_rx;
    wire tb_master_done;
    reg  [7:0] tb_slave_tx;
    wire [7:0] tb_slave_rx;
    wire tb_slave_done;

    spi uut (
        .clk(tb_clk),
        .rst_n(tb_rst_n),
        .master_start(tb_master_start),
        .master_tx(tb_master_tx),
        .master_rx(tb_master_rx),
        .master_done(tb_master_done),
        .slave_tx(tb_slave_tx),
        .slave_rx(tb_slave_rx),
        .slave_done(tb_slave_done)
    );

    always #10 tb_clk = ~tb_clk;

    initial begin
        $monitor("Time=%0dns | clk=%b rst_n=%b | master_start=%b master_tx=%h master_rx=%h master_done=%b | slave_tx=%h slave_rx=%h slave_done=%b", 
                 $time, tb_clk, tb_rst_n, tb_master_start, tb_master_tx, tb_master_rx, tb_master_done, tb_slave_tx, tb_slave_rx, tb_slave_done);

        tb_clk = 1'b0; tb_rst_n = 1'b0; tb_master_start = 1'b0; tb_master_tx = 8'h00; tb_slave_tx = 8'h00; #25;
        tb_rst_n = 1'b1; #10;

        // Prepare data for transfer: Master sends 8'h55, Slave sends 8'hAA
        @(posedge tb_clk);
        #2;
        tb_master_tx = 8'h55;
        tb_slave_tx  = 8'hAA;
        tb_master_start = 1'b1;
        @(posedge tb_clk);
        #2;
        tb_master_start = 1'b0;

        @(posedge tb_master_done);
        #40;

        $finish;
    end

endmodule
