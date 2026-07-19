// Module: digital_door_lock
// Description: Security FSM validating a 3-digit input sequence (3 -> 1 -> 2)
// Author: IgniteRTL Contributor

module digital_door_lock (
    input  wire clk,         // Clock input
    input  wire rst_n,       // Asynchronous active-low reset
    input  wire [1:0] digit, // Input digit (2-bit binary representation)
    input  wire valid,       // Digit valid pulse
    output reg  unlocked,    // Unlocked output state
    output reg  alarm        // Alarm output state
);

    parameter STATE_LOCKED   = 3'b000;
    parameter STATE_D1       = 3'b001;
    parameter STATE_D2       = 3'b010;
    parameter STATE_UNLOCKED = 3'b011;
    parameter STATE_ALARM    = 3'b100;

    reg [2:0] state, next_state;

    // Sequential state transition
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state <= STATE_LOCKED;
        end else begin
            state <= next_state;
        end
    end

    // Combinational next-state logic
    always @(*) begin
        next_state = state;
        case (state)
            STATE_LOCKED: begin
                if (valid) begin
                    if (digit == 2'b11) next_state = STATE_D1; // Correct first digit: 3
                    else                next_state = STATE_ALARM;
                end
            end
            STATE_D1: begin
                if (valid) begin
                    if (digit == 2'b01) next_state = STATE_D2; // Correct second digit: 1
                    else                next_state = STATE_ALARM;
                end
            end
            STATE_D2: begin
                if (valid) begin
                    if (digit == 2'b10) next_state = STATE_UNLOCKED; // Correct third digit: 2
                    else                next_state = STATE_ALARM;
                end
            end
            STATE_UNLOCKED: begin
                // Remains unlocked until reset
                next_state = STATE_UNLOCKED;
            end
            STATE_ALARM: begin
                // Remains triggered until reset
                next_state = STATE_ALARM;
            end
            default: next_state = STATE_LOCKED;
        endcase
    end

    // Combinational output logic
    always @(*) begin
        unlocked = 1'b0;
        alarm    = 1'b0;
        case (state)
            STATE_UNLOCKED: unlocked = 1'b1;
            STATE_ALARM:    alarm    = 1'b1;
        endcase
    end

endmodule
