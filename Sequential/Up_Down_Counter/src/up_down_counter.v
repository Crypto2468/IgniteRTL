// Module: up_down_counter
// Description: 4-bit Synchronous Up/Down Counter using behavioral modeling
// Author: IgniteRTL Contributor

module up_down_counter (
    input  wire clk,     // Clock input
    input  wire rst_n,   // Asynchronous active-low reset
    input  wire up_down, // Direction control (1: Up, 0: Down)
    output reg  [3:0] q   // 4-bit counter output
);

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            q <= 4'b0000;
        end else begin
            if (up_down) begin
                q <= q + 4'b0001; // Count Up
            end else begin
                q <= q - 4'b0001; // Count Down
            end
        end
    end

endmodule
