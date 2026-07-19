// Module: uart_rx
// Description: Serial receiver converting UART frame stream to parallel 8-bit
// Author: IgniteRTL Contributor

module uart_rx (
    input  wire clk,        // Clock input
    input  wire rst_n,      // Asynchronous active-low reset
    input  wire rx,         // Serial input line
    output reg  [7:0] dout, // 8-bit parallel output data
    output reg  rx_done     // Pulse when byte is received successfully
);

    parameter CLKS_PER_BIT = 8; // Clocks per bit, default = 8 for simulation efficiency

    // State parameters
    parameter S_IDLE  = 2'b00;
    parameter S_START = 2'b01;
    parameter S_DATA  = 2'b10;
    parameter S_STOP  = 2'b11;

    reg [1:0] state, next_state;
    reg [7:0] rx_data;
    reg [2:0] bit_idx;
    reg [7:0] clk_cnt;

    // Sequential state transition
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state   <= S_IDLE;
            clk_cnt <= 8'd0;
            bit_idx <= 3'd0;
            rx_data <= 8'h00;
            dout    <= 8'h00;
            rx_done <= 1'b0;
        end else begin
            state   <= next_state;
            rx_done <= 1'b0;

            case (state)
                S_IDLE: begin
                    clk_cnt <= 8'd0;
                    bit_idx <= 3'd0;
                end

                S_START: begin
                    // Sample start bit in the middle of bit time
                    if (clk_cnt == (CLKS_PER_BIT/2) - 1) begin
                        if (rx == 1'b0) begin
                            clk_cnt <= 8'd0; // Reset counter for start bit alignment
                        end else begin
                            state <= S_IDLE; // False start, go back to IDLE
                        end
                    end else begin
                        clk_cnt <= clk_cnt + 8'd1;
                    end
                end

                S_DATA: begin
                    if (clk_cnt < CLKS_PER_BIT - 1) begin
                        clk_cnt <= clk_cnt + 8'd1;
                    end else begin
                        clk_cnt <= 8'd0;
                        rx_data[bit_idx] <= rx;
                        if (bit_idx < 3'd7) begin
                            bit_idx <= bit_idx + 3'd1;
                        end else begin
                            bit_idx <= 3'd0;
                        end
                    end
                end

                S_STOP: begin
                    if (clk_cnt < CLKS_PER_BIT - 1) begin
                        clk_cnt <= clk_cnt + 8'd1;
                    end else begin
                        clk_cnt <= 8'd0;
                        rx_done <= 1'b1;
                        dout    <= rx_data;
                    end
                end
            endcase
        end
    end

    // Combinational next-state logic
    always @(*) begin
        next_state = state;
        case (state)
            S_IDLE: begin
                if (rx == 1'b0) next_state = S_START;
            end
            S_START: begin
                if (clk_cnt == (CLKS_PER_BIT/2) - 1 && rx == 1'b0) next_state = S_DATA;
            end
            S_DATA: begin
                if (clk_cnt == CLKS_PER_BIT - 1 && bit_idx == 3'd7) next_state = S_STOP;
            end
            S_STOP: begin
                if (clk_cnt == CLKS_PER_BIT - 1) next_state = S_IDLE;
            end
            default: next_state = S_IDLE;
        endcase
    end

endmodule
