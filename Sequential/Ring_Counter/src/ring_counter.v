// Module: ring_counter
// Description: 4-bit Ring Counter using behavioral modeling
// Author: IgniteRTL Contributor

module ring_counter (
    input  wire clk,   // Clock input
    input  wire rst_n, // Asynchronous active-low reset
    output reg  [3:0] q // 4-bit counter output
);

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            q <= 4'b0001; // Initial state (only one bit high)
        end else begin
            q <= {q[0], q[3:1]}; // Circular right shift
        end
    end

endmodule
