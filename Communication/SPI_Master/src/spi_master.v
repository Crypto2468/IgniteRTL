// Module: spi_master
// Description: SPI Master controller operating in mode 0 (CPOL=0, CPHA=0)
// Author: IgniteRTL Contributor

module spi_master (
    input  wire clk,        // System Clock input
    input  wire rst_n,      // Asynchronous active-low reset
    input  wire start,      // Start SPI transmission strobe
    input  wire [7:0] din,  // 8-bit Data to shift out
    output reg  [7:0] dout, // 8-bit Data shifted in
    output reg  done,       // SPI transaction complete strobe
    // SPI Bus lines
    output reg  sclk,       // Serial Clock
    output reg  ss_n,       // Active-low Slave Select
    output reg  mosi,       // Master-Out Slave-In serial line
    input  wire miso        // Master-In Slave-Out serial line
);

    parameter CLK_DIV = 4; // clock division factor (must be even, >= 4)

    parameter S_IDLE     = 2'b00;
    parameter S_LOAD     = 2'b01;
    parameter S_TRANSFER = 2'b10;
    parameter S_DONE     = 2'b11;

    reg [1:0] state, next_state;
    reg [7:0] shift_reg;
    reg [2:0] bit_cnt;
    reg [7:0] div_cnt;
    reg spi_clk;

    // Clock divider loop generating SPI Clock
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            div_cnt <= 8'd0;
            spi_clk <= 1'b0;
        end else begin
            if (state == S_TRANSFER) begin
                if (div_cnt < (CLK_DIV/2) - 1) begin
                    div_cnt <= div_cnt + 8'd1;
                end else begin
                    div_cnt <= 8'd0;
                    spi_clk <= ~spi_clk;
                end
            end else begin
                div_cnt <= 8'd0;
                spi_clk <= 1'b0;
            end
        end
    end

    // Sequential logic block
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state     <= S_IDLE;
            bit_cnt   <= 3'd0;
            shift_reg <= 8'h00;
            dout      <= 8'h00;
            done      <= 1'b0;
            sclk      <= 1'b0;
            ss_n      <= 1'b1;
            mosi      <= 1'b0;
        end else begin
            state <= next_state;
            done  <= 1'b0;

            case (state)
                S_IDLE: begin
                    ss_n <= 1'b1;
                    sclk <= 1'b0;
                    mosi <= 1'b0;
                    bit_cnt <= 3'd0;
                end

                S_LOAD: begin
                    ss_n      <= 1'b0;
                    shift_reg <= din;
                    mosi      <= din[7]; // Drive MSB first
                end

                S_TRANSFER: begin
                    sclk <= spi_clk;
                    // Rising edge sampling (CPHA=0): sample miso
                    if (div_cnt == 0 && spi_clk == 1'b1) begin
                        shift_reg[0] <= miso;
                    end
                    // Falling edge shifting (CPHA=0): shift next mosi bit
                    if (div_cnt == 0 && spi_clk == 1'b0) begin
                        if (bit_cnt < 3'd7) begin
                            bit_cnt <= bit_cnt + 3'd1;
                            shift_reg[7:1] <= shift_reg[6:0];
                            mosi <= shift_reg[6];
                        end
                    end
                end

                S_DONE: begin
                    ss_n <= 1'b1;
                    sclk <= 1'b0;
                    mosi <= 1'b0;
                    dout <= shift_reg;
                    done <= 1'b1;
                end
            endcase
        end
    end

    // Combinational next-state logic
    always @(*) begin
        next_state = state;
        case (state)
            S_IDLE: begin
                if (start) next_state = S_LOAD;
            end
            S_LOAD: begin
                next_state = S_TRANSFER;
            end
            S_TRANSFER: begin
                // complete when bit counter is 7 and we are wrapping up the stop interval
                if (bit_cnt == 3'd7 && div_cnt == (CLK_DIV/2) - 1 && spi_clk == 1'b1) begin
                    next_state = S_DONE;
                end
            end
            S_DONE: begin
                next_state = S_IDLE;
            end
            default: next_state = S_IDLE;
        endcase
    end

endmodule
