// Module: vending_machine_controller
// Description: Dispenses a product worth $1.50 (150 cents)
// Author: IgniteRTL Contributor

module vending_machine_controller (
    input  wire clk,        // Clock input
    input  wire rst_n,      // Asynchronous active-low reset
    input  wire [1:0] coin, // Coin input (2'b00: none, 2'b01: 50c, 2'b10: 100c)
    output reg  dispense,   // Product dispense output
    output reg  change_out  // Change returned ($0.50)
);

    // State parameters
    parameter S_0   = 3'b000;
    parameter S_50  = 3'b001;
    parameter S_100 = 3'b010;
    parameter S_150 = 3'b011;
    parameter S_200 = 3'b100;

    reg [2:0] state, next_state;

    // Sequential state transition
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state <= S_0;
        end else begin
            state <= next_state;
        end
    end

    // Combinational next-state logic
    always @(*) begin
        next_state = state;
        case (state)
            S_0: begin
                if (coin == 2'b01)      next_state = S_50;
                else if (coin == 2'b10) next_state = S_100;
            end
            S_50: begin
                if (coin == 2'b01)      next_state = S_100;
                else if (coin == 2'b10) next_state = S_150;
            end
            S_100: begin
                if (coin == 2'b01)      next_state = S_150;
                else if (coin == 2'b10) next_state = S_200;
            end
            S_150, S_200: begin
                next_state = S_0; // Transient states
            end
            default: next_state = S_0;
        endcase
    end

    // Combinational output logic
    always @(*) begin
        dispense = 1'b0;
        change_out = 1'b0;
        case (state)
            S_150: dispense = 1'b1;
            S_200: begin
                dispense = 1'b1;
                change_out = 1'b1;
            end
        endcase
    end

endmodule
