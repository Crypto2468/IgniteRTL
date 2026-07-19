// Module: sequence_detector_moore
// Description: Moore 1011 overlapping sequence detector
// Author: IgniteRTL Contributor

module sequence_detector_moore (
    input  wire clk,   // Clock input
    input  wire rst_n, // Asynchronous active-low reset
    input  wire din,   // Serial data input
    output reg  dout   // Sequence detected output
);

    // State definitions
    parameter S_RESET = 3'b000;
    parameter S_1     = 3'b001;
    parameter S_10    = 3'b010;
    parameter S_101   = 3'b011;
    parameter S_1011  = 3'b100;

    reg [2:0] state, next_state;

    // Sequential state transition
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state <= S_RESET;
        end else begin
            state <= next_state;
        end
    end

    // Combinational next-state logic
    always @(*) begin
        case (state)
            S_RESET: begin
                if (din) next_state = S_1;
                else     next_state = S_RESET;
            end
            S_1: begin
                if (!din) next_state = S_10;
                else      next_state = S_1;
            end
            S_10: begin
                if (din) next_state = S_101;
                else     next_state = S_RESET;
            end
            S_101: begin
                if (din) next_state = S_1011;
                else     next_state = S_10;
            end
            S_1011: begin
                if (din) next_state = S_1;
                else     next_state = S_10;
            end
            default: next_state = S_RESET;
        endcase
    end

    // Output logic (purely dependent on state)
    always @(*) begin
        if (state == S_1011) begin
            dout = 1'b1;
        end else begin
            dout = 1'b0;
        end
    end

endmodule
