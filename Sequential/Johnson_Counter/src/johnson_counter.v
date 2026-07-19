// Module: johnson_counter
// Description: 4-bit Johnson Counter using behavioral modeling
// Author: IgniteRTL Contributor

module johnson_counter (
    input  wire clk,   // Clock input
    input  wire rst_n, // Asynchronous active-low reset
    output reg  [3:0] q // 4-bit counter output
);

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            q <= 4'b0000; // Initial state (all bits low)
        end else begin
            q <= {~q[0], q[3:1]}; // Shift right with inverted feedback
        end
    end

endmodule
