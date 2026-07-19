// Module: sram
// Description: 16x8 Static RAM (SRAM) with Bidirectional Data Bus
// Author: IgniteRTL Contributor

module sram (
    input  wire clk,         // Clock input (for stable write control)
    input  wire cs_n,        // Chip Select (active-low)
    input  wire we_n,        // Write Enable (active-low)
    input  wire oe_n,        // Output Enable (active-low)
    input  wire [3:0] addr,  // 4-bit Address input
    inout  wire [7:0] data   // 8-bit Bidirectional Data Bus
);

    reg [7:0] mem [15:0];
    reg [7:0] read_data;

    // Tri-state logic for bidirectional bus
    assign data = (!cs_n && !oe_n && we_n) ? read_data : 8'hzz;

    // Synchronous write block
    always @(posedge clk) begin
        if (!cs_n && !we_n) begin
            mem[addr] <= data;
        end
    end

    // Asynchronous read block
    always @(*) begin
        if (!cs_n && we_n) begin
            read_data = mem[addr];
        end else begin
            read_data = 8'h00;
        end
    end

endmodule
