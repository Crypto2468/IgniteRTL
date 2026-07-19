// Module: traffic_light_controller
// Description: Dual-highway traffic junction controller with timer
// Author: IgniteRTL Contributor

module traffic_light_controller (
    input  wire clk,      // Clock input
    input  wire rst_n,    // Asynchronous active-low reset
    output reg  [2:0] ns_light, // North-South lights (bit 2:Red, 1:Yellow, 0:Green)
    output reg  [2:0] ew_light  // East-West lights (bit 2:Red, 1:Yellow, 0:Green)
);

    // State parameters
    parameter NS_GREEN  = 2'b00;
    parameter NS_YELLOW = 2'b01;
    parameter EW_GREEN  = 2'b10;
    parameter EW_YELLOW = 2'b11;

    // Timer constraints
    parameter GREEN_CYCLES  = 4'd5; // 6 cycles
    parameter YELLOW_CYCLES = 4'd1; // 2 cycles

    reg [1:0] state, next_state;
    reg [3:0] timer;

    // Sequential state transition and timer counting
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state <= NS_GREEN;
            timer <= 4'b0000;
        end else begin
            state <= next_state;
            if (state != next_state) begin
                timer <= 4'b0000;
            end else begin
                timer <= timer + 4'b0001;
            end
        end
    end

    // Combinational next-state logic
    always @(*) begin
        next_state = state;
        case (state)
            NS_GREEN: begin
                if (timer >= GREEN_CYCLES) next_state = NS_YELLOW;
            end
            NS_YELLOW: begin
                if (timer >= YELLOW_CYCLES) next_state = EW_GREEN;
            end
            EW_GREEN: begin
                if (timer >= GREEN_CYCLES) next_state = EW_YELLOW;
            end
            EW_YELLOW: begin
                if (timer >= YELLOW_CYCLES) next_state = NS_GREEN;
            end
            default: next_state = NS_GREEN;
        endcase
    end

    // Combinational output logic
    always @(*) begin
        // Defaults: Both Red
        ns_light = 3'b100;
        ew_light = 3'b100;

        case (state)
            NS_GREEN: begin
                ns_light = 3'b001; // Green
                ew_light = 3'b100; // Red
            end
            NS_YELLOW: begin
                ns_light = 3'b010; // Yellow
                ew_light = 3'b100; // Red
            end
            EW_GREEN: begin
                ns_light = 3'b100; // Red
                ew_light = 3'b001; // Green
            end
            EW_YELLOW: begin
                ns_light = 3'b100; // Red
                ew_light = 3'b010; // Yellow
            end
        endcase
    end

endmodule
