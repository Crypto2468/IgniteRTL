// Module: jk_flipflop
// Description: Edge-triggered JK Flip-Flop with synchronous reset
// Author: IgniteRTL Contributor

module jk_flipflop (
    input  wire clk, // Clock input
    input  wire rst, // Synchronous Reset
    input  wire j,   // Jump input
    input  wire k,   // Kill input
    output reg  q,   // Output Q
    output reg  q_n  // Complement output Q_n
);

    always @(posedge clk) begin
        if (rst) begin
            q   <= 1'b0;
            q_n <= 1'b1;
        end else begin
            case ({j, k})
                2'b01: begin
                    q   <= 1'b0;
                    q_n <= 1'b1;
                end
                2'b10: begin
                    q   <= 1'b1;
                    q_n <= 1'b0;
                end
                2'b11: begin
                    q   <= ~q;
                    q_n <= q;
                end
                // 2'b00: hold state
            end
        end
    end

endmodule
