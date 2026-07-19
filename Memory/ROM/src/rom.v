// Module: rom
// Description: 16x8 Synchronous Read-Only Memory (ROM)
// Author: IgniteRTL Contributor

module rom (
    input  wire clk,         // Clock input
    input  wire en,          // ROM enable (active-high)
    input  wire [3:0] addr,  // 4-bit Address input
    output reg  [7:0] data   // 8-bit Data output register
);

    // Memory array: 16 locations, each 8-bits wide
    reg [7:0] mem [15:0];

    // ROM Initialization
    initial begin
        mem[4'h0] = 8'h10;
        mem[4'h1] = 8'h21;
        mem[4'h2] = 8'h32;
        mem[4'h3] = 8'h43;
        mem[4'h4] = 8'h54;
        mem[4'h5] = 8'h65;
        mem[4'h6] = 8'h76;
        mem[4'h7] = 8'h87;
        mem[4'h8] = 8'h98;
        mem[4'h9] = 8'hA9;
        mem[4'hA] = 8'hBA;
        mem[4'hB] = 8'hCB;
        mem[4'hC] = 8'hDC;
        mem[4'hD] = 8'hED;
        mem[4'hE] = 8'hFE;
        mem[4'hF] = 8'h0F;
    end

    // Synchronous Read logic
    always @(posedge clk) begin
        if (en) begin
            data <= mem[addr];
        end
    end

endmodule
