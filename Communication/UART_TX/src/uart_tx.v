// Module: uart_tx
// Description: Serial transmitter converting parallel 8-bit to UART frame stream
// Author: IgniteRTL Contributor

module uart_tx (
    input  wire clk,        // Clock input
    input  wire rst_n,      // Asynchronous active-low reset
    input  wire tx_start,   // Pulse to start transmission
    input  wire [7:0] din,  // 8-bit Data byte to transmit
    output reg  tx,         // Serial output line
    output reg  tx_active,  // High when transmission is active
    output reg  tx_done     // Pulse when transmission is completed
);

    parameter CLKS_PER_BIT = 8; // Clocks per bit, default = 8 for simulation efficiency

    // State parameters
    parameter S_IDLE  = 2'b00;
    parameter S_START = 2'b01;
    parameter S_DATA  = 2'b10;
    parameter S_STOP  = 2'b11;

    reg [1:0] state, next_state;
    reg [7:0] tx_data;
    reg [2:0] bit_idx;
    reg [7:0] clk_cnt;

    // Sequential state transition
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state     <= S_IDLE;
            clk_cnt   <= 8'd0;
            bit_idx   <= 3'd0;
            tx_data   <= 8'h00;
            tx        <= 1'b1;
            tx_active <= 1'b0;
            tx_done   <= 1'b0;
        end else begin
            state   <= next_state;
            tx_done <= 1'b0;

            case (state)
                S_IDLE: begin
                    tx        <= 1'b1;
                    tx_active <= 1'b0;
                    clk_cnt   <= 8'd0;
                    bit_idx   <= 3'd0;
                    if (tx_start) begin
                        tx_data   <= din;
                        tx_active <= 1'b1;
                    end
                end

                S_START: begin
                    tx <= 1'b0; // Start bit is low
                    if (clk_cnt < CLKS_PER_BIT - 1) begin
                        clk_cnt <= clk_cnt + 8'd1;
                    end else begin
                        clk_cnt <= 8'd0;
                    end
                end

                S_DATA: begin
                    tx <= tx_data[bit_idx];
                    if (clk_cnt < CLKS_PER_BIT - 1) begin
                        clk_cnt <= clk_cnt + 8'd1;
                    end else begin
                        clk_cnt <= 8'd0;
                        if (bit_idx < 3'd7) begin
                            bit_idx <= bit_idx + 3'd1;
                        end else begin
                            bit_idx <= 3'd0;
                        end
                    end
                end

                S_STOP: begin
                    tx <= 1'b1; // Stop bit is high
                    if (clk_cnt < CLKS_PER_BIT - 1) begin
                        clk_cnt <= clk_cnt + 8'd1;
                    end else begin
                        clk_cnt   <= 8'd0;
                        tx_done   <= 1'b1;
                        tx_active <= 1'b0;
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
                if (tx_start) next_state = S_START;
            end
            S_START: begin
                if (clk_cnt == CLKS_PER_BIT - 1) next_state = S_DATA;
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
