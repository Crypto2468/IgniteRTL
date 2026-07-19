// Module: synchronous_down_counter
// Description: 4-bit Synchronous Down Counter using behavioral modeling
// Author: IgniteRTL Contributor

module synchronous_down_counter (
    input  wire clk,   // Clock input
    input  wire rst_n, // Asynchronous active-low reset
    output reg  [3:0] q // 4-bit counter output
);

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            q <= 4'b0000;
        end else begin
            q <= q - 4'b0001;
        end
    end

endmodule
