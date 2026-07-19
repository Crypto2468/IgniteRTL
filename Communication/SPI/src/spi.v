// Module: spi
// Description: SPI loopback system wrapper connecting Master and Slave
// Author: IgniteRTL Contributor

module spi (
    input  wire clk,            // Clock input
    input  wire rst_n,          // Asynchronous active-low reset
    input  wire master_start,   // Master initiate transfer strobe
    input  wire [7:0] master_tx, // Master transmit payload byte
    output wire [7:0] master_rx, // Master received payload byte
    output wire master_done,     // Master complete transaction status
    input  wire [7:0] slave_tx,  // Slave prepare payload byte
    output wire [7:0] slave_rx,  // Slave received payload byte
    output wire slave_done       // Slave complete transaction status
);

    wire sclk;
    wire ss_n;
    wire mosi;
    wire miso;

    // Instantiate Master
    spi_master #(
        .CLK_DIV(4)
    ) master_inst (
        .clk(clk),
        .rst_n(rst_n),
        .start(master_start),
        .din(master_tx),
        .dout(master_rx),
        .done(master_done),
        .sclk(sclk),
        .ss_n(ss_n),
        .mosi(mosi),
        .miso(miso)
    );

    // Instantiate Slave
    spi_slave slave_inst (
        .rst_n(rst_n),
        .sclk(sclk),
        .ss_n(ss_n),
        .mosi(mosi),
        .miso(miso),
        .tx_data(slave_tx),
        .rx_data(slave_rx),
        .rx_done(slave_done)
    );

endmodule
