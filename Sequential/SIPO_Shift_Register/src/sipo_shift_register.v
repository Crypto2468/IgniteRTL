// Module: sipo_shift_register
// Description: 4-bit Serial-In Parallel-Out (SIPO) Shift Register
// Author: IgniteRTL Contributor

module sipo_shift_register (
    input  wire clk,    // Clock input
    input  wire rst_n,  // Asynchronous active-low reset
    input  wire si,     // Serial input
    output reg  [3:0] po // 4-bit Parallel output
);

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            po <= 4'b0000;
        end else begin
            po <= {si, po[3:1]};
        end
    end

endmodule
