// Module: i2c
// Description: Local loopback I2C bus environment linking Master and Slave
// Author: IgniteRTL Contributor

module i2c (
    input  wire clk,            // Master Clock input
    input  wire rst_n,          // Asynchronous active-low reset
    input  wire master_start,   // Master start request strobe
    input  wire [6:0] master_addr, // 7-bit Master Address input
    input  wire [7:0] master_din,  // 8-bit Master Data input
    output wire master_done,     // Master complete transaction status
    output wire master_ack_err,  // Master ACK error check
    output wire [7:0] slave_rx,  // Slave received parallel data
    output wire slave_done       // Slave complete transaction status
);

    wire scl;
    wire sda;

    // Pull-up resistors simulated inside system wrapper
    pullup(scl);
    pullup(sda);

    // Instantiate Master
    i2c_master master_inst (
        .clk(clk),
        .rst_n(rst_n),
        .start(master_start),
        .addr(master_addr),
        .din(master_din),
        .done(master_done),
        .ack_error(master_ack_err),
        .scl(scl),
        .sda(sda)
    );

    // Instantiate Slave (SLAVE_ADDR = 7'h50)
    i2c_slave #(
        .SLAVE_ADDR(7'h50)
    ) slave_inst (
        .rst_n(rst_n),
        .rx_data(slave_rx),
        .rx_done(slave_done),
        .scl(scl),
        .sda(sda)
    );

endmodule
