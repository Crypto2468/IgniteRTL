// Module: accumulator
// Description: 8-bit intermediate CPU accumulator register
// Author: IgniteRTL Contributor

module accumulator (
    input  wire clk,        // Clock input
    input  wire rst_n,      // Asynchronous active-low reset
    input  wire en,         // Accumulator write enable
    input  wire [7:0] din,  // 8-bit ALU input data
    output reg  [7:0] dout  // 8-bit accumulated output data
);

    // Latch value on clock edge when enable is active
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            dout <= 8'h00;
        end else if (en) begin
            dout <= din;
        end
    end

endmodule
