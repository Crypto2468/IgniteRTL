// Module: dual_port_ram
// Description: 16x8 Dual-Port RAM (Independent read/write ports)
// Author: IgniteRTL Contributor

module dual_port_ram (
    input  wire clk,          // Shared Clock input
    // Port A Controls
    input  wire we_a,         // Port A Write Enable
    input  wire [3:0] addr_a, // Port A Address
    input  wire [7:0] din_a,  // Port A Data Input
    output reg  [7:0] dout_a, // Port A Data Output
    // Port B Controls
    input  wire we_b,         // Port B Write Enable
    input  wire [3:0] addr_b, // Port B Address
    input  wire [7:0] din_b,  // Port B Data Input
    output reg  [7:0] dout_b  // Port B Data Output
);

    // Memory array: 16 locations, each 8-bits wide
    reg [7:0] mem [15:0];

    // Port A Operation
    always @(posedge clk) begin
        if (we_a) begin
            mem[addr_a] <= din_a;
        end
        dout_a <= mem[addr_a];
    end

    // Port B Operation
    always @(posedge clk) begin
        if (we_b) begin
            mem[addr_b] <= din_b;
        end
        dout_b <= mem[addr_b];
    end

endmodule
