// Module: i2c_master
// Description: Simplified I2C Master controller
// Author: IgniteRTL Contributor

module i2c_master (
    input  wire clk,       // System clock
    input  wire rst_n,     // Asynchronous active-low reset
    input  wire start,     // Start request strobe
    input  wire [6:0] addr, // 7-bit target slave address
    input  wire [7:0] din,  // 8-bit write data byte
    output reg  done,      // Complete transaction pulse
    output reg  ack_error, // High if slave does not acknowledge
    // Bidirectional bus lines
    inout  wire scl,
    inout  wire sda
);

    parameter S_IDLE  = 3'b000;
    parameter S_START = 3'b001;
    parameter S_ADDR  = 3'b010;
    parameter S_DATA  = 3'b011;
    parameter S_ACK   = 3'b100;
    parameter S_STOP  = 3'b101;

    reg [2:0] state, next_state;
    reg [3:0] bit_cnt;
    reg [7:0] clk_cnt;
    reg scl_out, sda_out;
    reg scl_oe, sda_oe;

    // Emulate Open-Drain buffers
    assign scl = (scl_oe && !scl_out) ? 1'b0 : 1'bz;
    assign sda = (sda_oe && !sda_out) ? 1'b0 : 1'bz;

    // Simple divider generating scl pulses
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            clk_cnt <= 8'd0;
        end else begin
            if (state != S_IDLE) begin
                if (clk_cnt < 8'd19) clk_cnt <= clk_cnt + 8'd1;
                else                 clk_cnt <= 8'd0;
            end else begin
                clk_cnt <= 8'd0;
            end
        end
    end

    // Sequential logic
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state     <= S_IDLE;
            bit_cnt   <= 4'd0;
            done      <= 1'b0;
            ack_error <= 1'b0;
            scl_out   <= 1'b1; scl_oe <= 1'b0;
            sda_out   <= 1'b1; sda_oe <= 1'b0;
        end else begin
            state <= next_state;
            done  <= 1'b0;

            case (state)
                S_IDLE: begin
                    scl_oe <= 1'b0; sda_oe <= 1'b0;
                    scl_out <= 1'b1; sda_out <= 1'b1;
                    bit_cnt <= 4'd0;
                end

                S_START: begin
                    scl_oe <= 1'b1; sda_oe <= 1'b1;
                    scl_out <= 1'b1;
                    if (clk_cnt < 8'd10) begin
                        sda_out <= 1'b1;
                    end else begin
                        sda_out <= 1'b0; // SDA falls while SCL high
                    end
                end

                S_ADDR: begin
                    // Shift out 7-bit addr and 1-bit Write (0)
                    scl_out <= (clk_cnt < 8'd10) ? 1'b0 : 1'b1;
                    if (clk_cnt == 8'd0) begin
                        if (bit_cnt < 4'd7) begin
                            sda_out <= addr[6 - bit_cnt];
                        end else begin
                            sda_out <= 1'b0; // Write mode (0)
                        end
                    end
                    if (clk_cnt == 8'd19) begin
                        if (bit_cnt < 4'd7) bit_cnt <= bit_cnt + 4'd1;
                        else                bit_cnt <= 4'd0;
                    end
                end

                S_DATA: begin
                    scl_out <= (clk_cnt < 8'd10) ? 1'b0 : 1'b1;
                    if (clk_cnt == 8'd0) begin
                        sda_out <= din[7 - bit_cnt];
                    end
                    if (clk_cnt == 8'd19) begin
                        if (bit_cnt < 4'd7) bit_cnt <= bit_cnt + 4'd1;
                        else                bit_cnt <= 4'd0;
                    end
                end

                S_ACK: begin
                    scl_out <= (clk_cnt < 8'd10) ? 1'b0 : 1'b1;
                    sda_oe  <= 1'b0; // Release sda for slave ack
                    if (clk_cnt == 8'd15) begin
                        ack_error <= sda; // sample ack
                    end
                end

                S_STOP: begin
                    scl_oe  <= 1'b1; sda_oe <= 1'b1;
                    scl_out <= (clk_cnt < 8'd10) ? 1'b0 : 1'b1;
                    if (clk_cnt < 8'd10) begin
                        sda_out <= 1'b0;
                    end else begin
                        sda_out <= 1'b1; // SDA rises while SCL high
                        done    <= (clk_cnt == 8'd19) ? 1'b1 : 1'b0;
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
                if (start) next_state = S_START;
            end
            S_START: begin
                if (clk_cnt == 8'd19) next_state = S_ADDR;
            end
            S_ADDR: begin
                if (clk_cnt == 8'd19 && bit_cnt == 4'd7) next_state = S_DATA;
            end
            S_DATA: begin
                if (clk_cnt == 8'd19 && bit_cnt == 4'd7) next_state = S_ACK;
            end
            S_ACK: begin
                if (clk_cnt == 8'd19) next_state = S_STOP;
            end
            S_STOP: begin
                if (clk_cnt == 8'd19) next_state = S_IDLE;
            end
            default: next_state = S_IDLE;
        endcase
    end

endmodule
