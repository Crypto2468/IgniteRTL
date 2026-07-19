// Module: register_4bit
// Description: 4-bit Parallel Register with Load Enable and Active-Low Reset
// Author: IgniteRTL Contributor

module register_4bit (
    input  wire clk,      // Clock input
    input  wire rst_n,    // Asynchronous active-low reset
    input  wire load,     // Load enable control line
    input  wire [3:0] d,  // 4-bit Parallel Data input
    output reg  [3:0] q   // 4-bit Register output
);

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            q <= 4'b0000;
        end else if (load) begin
            q <= d;
        end
    end

endmodule
