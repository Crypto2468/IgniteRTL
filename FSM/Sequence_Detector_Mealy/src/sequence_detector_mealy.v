// Module: sequence_detector_mealy
// Description: Mealy 1011 overlapping sequence detector
// Author: IgniteRTL Contributor

module sequence_detector_mealy (
    input  wire clk,   // Clock input
    input  wire rst_n, // Asynchronous active-low reset
    input  wire din,   // Serial data input
    output reg  dout   // Sequence detected output
);

    // State definitions using parameters
    parameter S_RESET = 2'b00;
    parameter S_1     = 2'b01;
    parameter S_10    = 2'b10;
    parameter S_101   = 2'b11;

    reg [1:0] state, next_state;

    // Sequential state transition block
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state <= S_RESET;
        end else begin
            state <= next_state;
        end
    end

    // Combinational next-state and output logic block
    always @(*) begin
        // Defaults
        next_state = state;
        dout = 1'b0;

        case (state)
            S_RESET: begin
                if (din) begin
                    next_state = S_1;
                end else begin
                    next_state = S_RESET;
                end
            end

            S_1: begin
                if (!din) begin
                    next_state = S_10;
                end else begin
                    next_state = S_1;
                end
            end

            S_10: begin
                if (din) begin
                    next_state = S_101;
                end else begin
                    next_state = S_RESET;
                end
            end

            S_101: begin
                if (din) begin
                    next_state = S_1;
                    dout = 1'b1; // Sequence 1011 detected
                end else begin
                    next_state = S_10;
                end
            end

            default: begin
                next_state = S_RESET;
                dout = 1'b0;
            end
        endcase
    end

endmodule
