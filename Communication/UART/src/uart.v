// Module: uart
// Description: Full-Duplex UART Transceiver instantiation wrapper
// Author: IgniteRTL Contributor

module uart (
    input  wire clk,        // Clock input
    input  wire rst_n,      // Asynchronous active-low reset
    // TX interface
    input  wire tx_start,   // Pulse to start transmission
    input  wire [7:0] tx_din, // Data byte to transmit
    output wire tx,         // Serial output line
    output wire tx_active,  // High when transmitting
    output wire tx_done,    // Complete status pulse
    // RX interface
    input  wire rx,         // Serial input line
    output wire [7:0] rx_dout, // Received data byte
    output wire rx_done     // Valid received pulse
);

    parameter CLKS_PER_BIT = 8;

    // Instantiate Transmitter
    uart_tx #(
        .CLKS_PER_BIT(CLKS_PER_BIT)
    ) tx_inst (
        .clk(clk),
        .rst_n(rst_n),
        .tx_start(tx_start),
        .din(tx_din),
        .tx(tx),
        .tx_active(tx_active),
        .tx_done(tx_done)
    );

    // Instantiate Receiver
    uart_rx #(
        .CLKS_PER_BIT(CLKS_PER_BIT)
    ) rx_inst (
        .clk(clk),
        .rst_n(rst_n),
        .rx(rx),
        .dout(rx_dout),
        .rx_done(rx_done)
    );

endmodule
