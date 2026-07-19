// Module: i2c_slave
// Description: Simplified I2C Slave peripheral listening for address matching
// Author: IgniteRTL Contributor

module i2c_slave (
    input  wire rst_n,          // Asynchronous active-low reset
    output reg  [7:0] rx_data,  // 8-bit received parallel data
    output reg  rx_done,        // Valid data received strobe
    // I2C bus lines
    input  wire scl,
    inout  wire sda
);

    parameter SLAVE_ADDR = 7'h50;

    parameter S_IDLE  = 2'b00;
    parameter S_ADDR  = 2'b01;
    parameter S_DATA  = 2'b10;
    parameter S_ACK   = 2'b11;

    reg [1:0] state;
    reg [3:0] bit_cnt;
    reg [7:0] shift_reg;
    reg sda_out;
    reg sda_oe;

    assign sda = (sda_oe && !sda_out) ? 1'b0 : 1'bz;

    // Detect START and STOP conditions asynchronously
    reg start_detected;
    always @(negedge sda or negedge rst_n) begin
        if (!rst_n) begin
            start_detected <= 1'b0;
        end else begin
            if (scl == 1'b1) begin
                start_detected <= 1'b1;
            end
        end
    end

    // Sequential logic synced to SCL rising edge
    always @(posedge scl or negedge rst_n) begin
        if (!rst_n) begin
            state    <= S_IDLE;
            bit_cnt  <= 4'd0;
            shift_reg <= 8'h00;
            rx_data  <= 8'h00;
            rx_done  <= 1'b0;
            sda_out  <= 1'b1; sda_oe <= 1'b0;
        end else begin
            rx_done <= 1'b0;
            if (start_detected && state == S_IDLE) begin
                state <= S_ADDR;
                bit_cnt <= 4'd0;
            end else begin
                case (state)
                    S_ADDR: begin
                        shift_reg[0] <= sda;
                        if (bit_cnt < 4'd7) begin
                            bit_cnt <= bit_cnt + 4'd1;
                            shift_reg[7:1] <= shift_reg[6:0];
                        end else begin
                            bit_cnt <= 4'd0;
                            // Check matching address {shift_reg[6:0], sda} == {SLAVE_ADDR, write_mode}
                            if (shift_reg[6:0] == SLAVE_ADDR) begin
                                state <= S_ACK;
                            end else begin
                                state <= S_IDLE;
                            end
                        end
                    end

                    S_DATA: begin
                        shift_reg[0] <= sda;
                        if (bit_cnt < 4'd7) begin
                            bit_cnt <= bit_cnt + 4'd1;
                            shift_reg[7:1] <= shift_reg[6:0];
                        end else begin
                            bit_cnt <= 4'd0;
                            rx_data <= {shift_reg[6:0], sda};
                            rx_done <= 1'b1;
                            state   <= S_ACK;
                        end
                    end

                    S_ACK: begin
                        state <= S_DATA;
                    end
                endcase
            end
        end
    end

    // Drive SDA ACK low on falling edge of SCL preceding the 9th bit
    always @(negedge scl or negedge rst_n) begin
        if (!rst_n) begin
            sda_out <= 1'b1; sda_oe <= 1'b0;
        end else begin
            if (state == S_ACK) begin
                sda_oe  <= 1'b1;
                sda_out <= 1'b0; // ACK pulled down
            end else begin
                sda_oe  <= 1'b0;
                sda_out <= 1'b1;
            end
        end
    end

endmodule
