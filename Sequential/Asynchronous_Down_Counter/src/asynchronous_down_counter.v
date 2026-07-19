// Module: asynchronous_down_counter
// Description: 4-bit Asynchronous (Ripple) Down Counter using structural T Flip-flops
// Author: IgniteRTL Contributor

module asynchronous_down_counter (
    input  wire clk,   // Clock input for stage 0
    input  wire rst_n, // Asynchronous active-low reset
    output wire [3:0] q // 4-bit counter output
);

    wire [3:0] q_n;

    // Stage 0: Clocked by main clock
    t_ff_cell tf0 (.clk(clk),   .rst_n(rst_n), .q(q[0]), .q_n(q_n[0]));
    // Stage 1: Clocked by output Q of stage 0
    t_ff_cell tf1 (.clk(q[0]),   .rst_n(rst_n), .q(q[1]), .q_n(q_n[1]));
    // Stage 2: Clocked by output Q of stage 1
    t_ff_cell tf2 (.clk(q[1]),   .rst_n(rst_n), .q(q[2]), .q_n(q_n[2]));
    // Stage 3: Clocked by output Q of stage 2
    t_ff_cell tf3 (.clk(q[2]),   .rst_n(rst_n), .q(q[3]), .q_n(q_n[3]));

endmodule

// Helper Cell
module t_ff_cell (
    input  wire clk,
    input  wire rst_n,
    output reg  q,
    output reg  q_n
);
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            q   <= 1'b0;
            q_n <= 1'b1;
        end else begin
            q   <= ~q;
            q_n <= q;
        end
    end
endmodule
