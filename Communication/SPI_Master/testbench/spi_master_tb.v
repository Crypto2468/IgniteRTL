// Module: spi_master_tb
// Description: Testbench for SPI Master controller
// Author: IgniteRTL Contributor

`timescale 1ns / 1ps

module spi_master_tb;

    reg  tb_clk;
    reg  tb_rst_n;
    reg  tb_start;
    reg  [7:0] tb_din;
    wire [7:0] tb_dout;
    wire tb_done;
    wire tb_sclk;
    wire tb_ss_n;
    wire tb_mosi;
    reg  tb_miso;

    spi_master #(
        .CLK_DIV(4)
    ) uut (
        .clk(tb_clk),
        .rst_n(tb_rst_n),
        .start(tb_start),
        .din(tb_din),
        .dout(tb_dout),
        .done(tb_done),
        .sclk(tb_sclk),
        .ss_n(tb_ss_n),
        .mosi(tb_mosi),
        .miso(tb_miso)
    );

    always #10 tb_clk = ~tb_clk;

    initial begin
        $monitor("Time=%0dns | clk=%b rst_n=%b | state=%b sclk=%b mosi=%b miso=%b | dout=%h done=%b", 
                 $time, tb_clk, tb_rst_n, uut.state, tb_sclk, tb_mosi, tb_miso, tb_dout, tb_done);

        tb_clk = 1'b0; tb_rst_n = 1'b0; tb_start = 1'b0; tb_din = 8'h00; tb_miso = 1'b0; #25;
        tb_rst_n = 1'b1; #10;

        // Start SPI transaction: write 8'hA5 (miso loopback hardwired to 1 for demonstration)
        tb_miso = 1'b1;
        @(posedge tb_clk);
        #2;
        tb_din = 8'hA5;
        tb_start = 1'b1;
        @(posedge tb_clk);
        #2;
        tb_start = 1'b0;

        @(posedge tb_done);
        #40;

        $finish;
    end

endmodule
