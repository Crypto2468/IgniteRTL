// Module: spi_slave_tb
// Description: Testbench for SPI Slave interface
// Author: IgniteRTL Contributor

`timescale 1ns / 1ps

module spi_slave_tb;

    reg  tb_rst_n;
    reg  tb_sclk;
    reg  tb_ss_n;
    reg  tb_mosi;
    wire tb_miso;
    reg  [7:0] tb_tx_data;
    wire [7:0] tb_rx_data;
    wire tb_rx_done;

    spi_slave uut (
        .rst_n(tb_rst_n),
        .sclk(tb_sclk),
        .ss_n(tb_ss_n),
        .mosi(tb_mosi),
        .miso(tb_miso),
        .tx_data(tb_tx_data),
        .rx_data(tb_rx_data),
        .rx_done(tb_rx_done)
    );

    task send_mosi_bit(input bit_val);
        begin
            tb_sclk = 1'b0;
            tb_mosi = bit_val;
            #10;
            tb_sclk = 1'b1;
            #10;
        end
    endtask

    initial begin
        $monitor("Time=%0dns | sclk=%b ss_n=%b mosi=%b miso=%b | rx_data=%h rx_done=%b", 
                 $time, tb_sclk, tb_ss_n, tb_mosi, tb_miso, tb_rx_data, tb_rx_done);

        tb_rst_n = 1'b0; tb_sclk = 1'b0; tb_ss_n = 1'b1; tb_mosi = 1'b0; tb_tx_data = 8'hB2; #25;
        tb_rst_n = 1'b1; #10;

        // Select Slave
        tb_ss_n = 1'b0; #10;

        // Send byte 8'hA5 (10100101) MSB-first
        send_mosi_bit(1);
        send_mosi_bit(0);
        send_mosi_bit(1);
        send_mosi_bit(0);
        send_mosi_bit(0);
        send_mosi_bit(1);
        send_mosi_bit(0);
        send_mosi_bit(1);

        tb_sclk = 1'b0;
        #10;
        tb_ss_n = 1'b1;
        #40;

        $finish;
    end

endmodule
