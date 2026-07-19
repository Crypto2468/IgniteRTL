// Module: lift_controller
// Description: Synchronous Lift Cabin Request Queue Controller
// Author: IgniteRTL Contributor

module lift_controller (
    input  wire clk,              // Clock input
    input  wire rst_n,            // Asynchronous active-low reset
    input  wire [2:0] req_floors, // Floor requests vector (Floor 2, 1, 0)
    output reg  [1:0] current_floor, // Current floor location (0, 1, 2)
    output reg  motor_up,         // Lift motor up control
    output reg  motor_down,       // Lift motor down control
    output reg  door_open         // Lift door status indicator
);

    parameter LIFT_IDLE = 2'b00;
    parameter LIFT_UP   = 2'b01;
    parameter LIFT_DOWN = 2'b10;

    reg [1:0] state, next_state;

    // Sequential state transition and position update
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state <= LIFT_IDLE;
            current_floor <= 2'b00;
        end else begin
            state <= next_state;
            if (state == LIFT_UP) begin
                current_floor <= current_floor + 2'b01;
            end else if (state == LIFT_DOWN) begin
                current_floor <= current_floor - 2'b01;
            end
        end
    end

    // Combinational next-state logic
    always @(*) begin
        next_state = state;
        case (state)
            LIFT_IDLE: begin
                // Check if door is open to service request
                if (req_floors[current_floor]) begin
                    next_state = LIFT_IDLE; 
                end else if (req_floors > (3'b001 << current_floor) && current_floor < 2'd2) begin
                    next_state = LIFT_UP;
                end else if (req_floors < (3'b001 << current_floor) && req_floors != 3'b000) begin
                    next_state = LIFT_DOWN;
                end
            end
            LIFT_UP: begin
                // Stop if target floor matches requested list
                if (req_floors[current_floor + 2'b01]) begin
                    next_state = LIFT_IDLE;
                end
            end
            LIFT_DOWN: begin
                if (req_floors[current_floor - 2'b01]) begin
                    next_state = LIFT_IDLE;
                end
            end
            default: next_state = LIFT_IDLE;
        endcase
    end

    // Combinational output logic
    always @(*) begin
        motor_up   = 1'b0;
        motor_down = 1'b0;
        door_open  = 1'b0;

        case (state)
            LIFT_IDLE: begin
                if (req_floors[current_floor]) begin
                    door_open = 1'b1;
                end
            end
            LIFT_UP:   motor_up   = 1'b1;
            LIFT_DOWN: motor_down = 1'b1;
        endcase
    end

endmodule
