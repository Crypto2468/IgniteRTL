// Module: d_flipflop
// Description: Edge-triggered D Flip-Flop with asynchronous active-low reset
// Author: IgniteRTL Contributor

module d_flipflop (
    input  wire clk,   // Clock input
    input  wire rst_n, // Asynchronous active-low reset
    input  wire d,     // Data input
    output reg  q,     // Output Q
    output reg  q_n    // Complement output Q_n
);

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            q   <= 1'b0;
            q_n <= 1'b1;
        end else begin
            q   <= d;
            q_n <= ~d;
        end
    end

endmodule
