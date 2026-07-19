// Module: fifo
// Description: 8x8 Synchronous Circular Queue (FIFO)
// Author: IgniteRTL Contributor

module fifo (
    input  wire clk,        // Clock input
    input  wire rst_n,      // Asynchronous active-low reset
    input  wire wr_en,      // Write Enable
    input  wire rd_en,      // Read Enable
    input  wire [7:0] din,  // 8-bit Data Input
    output reg  [7:0] dout, // 8-bit Data Output
    output wire full,       // FIFO Full flag
    output wire empty       // FIFO Empty flag
);

    reg [7:0] mem [7:0]; // 8-word depth
    reg [2:0] wr_ptr;
    reg [2:0] rd_ptr;
    reg [3:0] fifo_cnt;

    assign empty = (fifo_cnt == 4'd0);
    assign full  = (fifo_cnt == 4'd8);

    // Pointer and counter update
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            wr_ptr   <= 3'b000;
            rd_ptr   <= 3'b000;
            fifo_cnt <= 4'b0000;
            dout     <= 8'h00;
        end else begin
            // Write cycle
            if (wr_en && !full) begin
                mem[wr_ptr] <= din;
                wr_ptr <= wr_ptr + 3'b001;
            end
            
            // Read cycle
            if (rd_en && !empty) begin
                dout <= mem[rd_ptr];
                rd_ptr <= rd_ptr + 3'b001;
            end

            // Counter cycle
            case ({wr_en && !full, rd_en && !empty})
                2'b10: fifo_cnt <= fifo_cnt + 4'b0001;
                2'b01: fifo_cnt <= fifo_cnt - 4'b0001;
                // 2'b11 and 2'b00 keep count constant
            endcase
        end
    end

endmodule
