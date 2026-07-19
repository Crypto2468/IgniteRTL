// Module: elevator_controller
// Description: Basic multi-floor elevator controller (Floors 0, 1, 2)
// Author: IgniteRTL Contributor

module elevator_controller (
    input  wire clk,              // Clock input
    input  wire rst_n,            // Asynchronous active-low reset
    input  wire [1:0] req_floor,  // Floor request destination (0, 1, 2)
    output reg  [1:0] current_floor, // Current floor location
    output reg  motor_up,         // Upward motor motor active
    output reg  motor_down,       // Downward motor active
    output reg  door_open         // Elevator cabin door open
);

    parameter STATE_IDLE = 2'b00;
    parameter STATE_UP   = 2'b01;
    parameter STATE_DOWN = 2'b10;
    parameter STATE_DOOR = 2'b11;

    reg [1:0] state, next_state;

    // Sequential state transition and position update
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state <= STATE_IDLE;
            current_floor <= 2'b00;
        end else begin
            state <= next_state;
            if (state == STATE_UP) begin
                current_floor <= current_floor + 2'b01;
            end else if (state == STATE_DOWN) begin
                current_floor <= current_floor - 2'b01;
            end
        end
    end

    // Combinational next-state logic
    always @(*) begin
        next_state = state;
        case (state)
            STATE_IDLE: begin
                if (req_floor > current_floor) begin
                    next_state = STATE_UP;
                end else if (req_floor < current_floor) begin
                    next_state = STATE_DOWN;
                end else if (req_floor == current_floor) begin
                    next_state = STATE_DOOR;
                end
            end
            STATE_UP: begin
                if (current_floor + 2'b01 == req_floor) begin
                    next_state = STATE_DOOR;
                end
            end
            STATE_DOWN: begin
                if (current_floor - 2'b01 == req_floor) begin
                    next_state = STATE_DOOR;
                end
            end
            STATE_DOOR: begin
                next_state = STATE_IDLE;
            end
            default: next_state = STATE_IDLE;
        endcase
    end

    // Combinational output logic
    always @(*) begin
        motor_up   = 1'b0;
        motor_down = 1'b0;
        door_open  = 1'b0;

        case (state)
            STATE_UP:   motor_up   = 1'b1;
            STATE_DOWN: motor_down = 1'b1;
            STATE_DOOR: door_open  = 1'b1;
        endcase
    end

endmodule
