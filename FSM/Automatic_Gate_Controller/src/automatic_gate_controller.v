// Module: automatic_gate_controller
// Description: Gate automation controller with limit switches and obstacle detection
// Author: IgniteRTL Contributor

module automatic_gate_controller (
    input  wire clk,               // Clock input
    input  wire rst_n,             // Asynchronous active-low reset
    input  wire sensor_open,       // Sensor detecting approaching car
    input  wire limit_open,        // Limit switch: gate fully open
    input  wire limit_close,       // Limit switch: gate fully closed
    input  wire obstacle,          // Safety sensor: obstacle path blocked
    output reg  motor_open,        // Motor output to open gate
    output reg  motor_close,       // Motor output to close gate
    output reg  warning_led        // Obstacle warning indicator
);

    parameter GATE_CLOSED  = 2'b00;
    parameter GATE_OPENING = 2'b01;
    parameter GATE_OPEN    = 2'b10;
    parameter GATE_CLOSING = 2'b11;

    reg [1:0] state, next_state;
    reg [3:0] timer;

    // Sequential state transition and stay-open timer counting
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state <= GATE_CLOSED;
            timer <= 4'b0000;
        end else begin
            state <= next_state;
            if (state == GATE_OPEN) begin
                timer <= timer + 4'b0001;
            end else begin
                timer <= 4'b0000;
            end
        end
    end

    // Combinational next-state logic
    always @(*) begin
        next_state = state;
        case (state)
            GATE_CLOSED: begin
                if (sensor_open) next_state = GATE_OPENING;
            end
            GATE_OPENING: begin
                if (limit_open) next_state = GATE_OPEN;
            end
            GATE_OPEN: begin
                // Automatically close after 6 cycles (timer reaches 5)
                if (timer >= 4'd5 && !sensor_open) begin
                    next_state = GATE_CLOSING;
                end
            end
            GATE_CLOSING: begin
                if (obstacle || sensor_open) begin
                    next_state = GATE_OPENING; // Safety retract
                end else if (limit_close) begin
                    next_state = GATE_CLOSED;
                end
            end
            default: next_state = GATE_CLOSED;
        endcase
    end

    // Combinational output logic
    always @(*) begin
        motor_open  = 1'b0;
        motor_close = 1'b0;
        warning_led = 1'b0;

        case (state)
            GATE_OPENING: motor_open  = 1'b1;
            GATE_CLOSING: motor_close = 1'b1;
        endcase

        if (obstacle) begin
            warning_led = 1'b1;
        end
    end

endmodule
