// Module: spi_slave
// Description: SPI Slave interface operating in mode 0
// Author: IgniteRTL Contributor

module spi_slave (
    input  wire rst_n,          // Asynchronous active-low reset
    input  wire sclk,           // SPI Serial clock input
    input  wire ss_n,           // Active-low Slave Select input
    input  wire mosi,           // Master-Out Slave-In serial input
    output reg  miso,           // Master-In Slave-Out serial output
    input  wire [7:0] tx_data,  // 8-bit parallel data to load for transfer
    output reg  [7:0] rx_data,  // 8-bit received parallel data
    output reg  rx_done         // Strobe pulsed when byte is successfully read
);

    reg [7:0] shift_reg;
    reg [2:0] bit_cnt;

    // Shift in MOSI (Rising edge, Mode 0)
    always @(posedge sclk or negedge rst_n) begin
        if (!rst_n) begin
            rx_data  <= 8'h00;
            rx_done  <= 1'b0;
            bit_cnt  <= 3'd0;
            shift_reg <= 8'h00;
        end else if (!ss_n) begin
            rx_done <= 1'b0;
            shift_reg[0] <= mosi;
            if (bit_cnt < 3'd7) begin
                bit_cnt   <= bit_cnt + 3'd1;
                shift_reg[7:1] <= shift_reg[6:0];
            end else begin
                bit_cnt <= 3'd0;
                rx_data <= {shift_reg[6:0], mosi};
                rx_done <= 1'b1;
            end
        end
    end

    // Shift out MISO (Falling edge, Mode 0)
    always @(negedge sclk or negedge rst_n) begin
        if (!rst_n) begin
            miso <= 1'b0;
        end else if (!ss_n) begin
            if (bit_cnt == 3'd0) begin
                miso <= tx_data[7];
            end else begin
                miso <= tx_data[7 - bit_cnt];
            end
        end else begin
            miso <= 1'b0;
        end
    end

endmodule
