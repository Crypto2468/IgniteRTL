// Module: t_flipflop
// Description: Edge-triggered T Flip-Flop with active-low reset
// Author: IgniteRTL Contributor

module t_flipflop (
    input  wire clk,   // Clock input
    input  wire rst_n, // Asynchronous active-low reset
    input  wire t,     // Toggle input
    output reg  q,     // Output Q
    output reg  q_n    // Complement output Q_n
);

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            q   <= 1'b0;
            q_n <= 1'b1;
        end else begin
            if (t) begin
                q   <= ~q;
                q_n <= q;
            end
        end
    end

endmodule
