// Module: washing_machine_controller
// Description: Automated washing machine cycle controller
// Author: IgniteRTL Contributor

module washing_machine_controller (
    input  wire clk,            // Clock input
    input  wire rst_n,          // Asynchronous active-low reset
    input  wire start,          // Start machine cycle
    input  wire cycle_complete, // Pulse indicating stage complete
    output reg  water_inlet,    // Fill water valve control
    output reg  agitator,       // Agitator wash motor control
    output reg  pump_out,       // Drain water pump control
    output reg  spin_dry        // Spin dry engine control
);

    parameter STATE_IDLE  = 3'b000;
    parameter STATE_FILL  = 3'b001;
    parameter STATE_WASH  = 3'b010;
    parameter STATE_RINSE = 3'b011;
    parameter STATE_SPIN  = 3'b100;

    reg [2:0] state, next_state;

    // Sequential state transition
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state <= STATE_IDLE;
        end else begin
            state <= next_state;
        end
    end

    // Combinational next-state logic
    always @(*) begin
        next_state = state;
        case (state)
            STATE_IDLE: begin
                if (start) next_state = STATE_FILL;
            end
            STATE_FILL: begin
                if (cycle_complete) next_state = STATE_WASH;
            end
            STATE_WASH: begin
                if (cycle_complete) next_state = STATE_RINSE;
            end
            STATE_RINSE: begin
                if (cycle_complete) next_state = STATE_SPIN;
            end
            STATE_SPIN: begin
                if (cycle_complete) next_state = STATE_IDLE;
            end
            default: next_state = STATE_IDLE;
        endcase
    end

    // Combinational output logic
    always @(*) begin
        water_inlet = 1'b0;
        agitator    = 1'b0;
        pump_out    = 1'b0;
        spin_dry    = 1'b0;

        case (state)
            STATE_FILL:  water_inlet = 1'b1;
            STATE_WASH:  agitator    = 1'b1;
            STATE_RINSE: begin
                water_inlet = 1'b1;
                pump_out    = 1'b1;
            end
            STATE_SPIN: begin
                pump_out = 1'b1;
                spin_dry = 1'b1;
            end
        endcase
    end

endmodule
