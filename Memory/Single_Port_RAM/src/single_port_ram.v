// Module: single_port_ram
// Description: 16x8 Synchronous Single-Port RAM
// Author: IgniteRTL Contributor

module single_port_ram (
    input  wire clk,        // Clock input
    input  wire we,         // Write Enable (active-high)
    input  wire [3:0] addr, // 4-bit Address input
    input  wire [7:0] din,  // 8-bit Data input
    output reg  [7:0] dout  // 8-bit Data output
);

    // Memory array: 16 locations, each 8-bits wide
    reg [7:0] mem [15:0];

    // Synchronous Write and Read
    always @(posedge clk) begin
        if (we) begin
            mem[addr] <= din;
        end
        dout <= mem[addr]; // Synchronous read
    end

endmodule
