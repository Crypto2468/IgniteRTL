// Module: siso_shift_register
// Description: 4-bit Serial-In Serial-Out (SISO) Shift Register
// Author: IgniteRTL Contributor

module siso_shift_register (
    input  wire clk,   // Clock input
    input  wire rst_n, // Asynchronous active-low reset
    input  wire si,    // Serial input
    output wire so     // Serial output
);

    reg [3:0] r;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            r <= 4'b0000;
        end else begin
            r <= {si, r[3:1]};
        end
    end

    assign so = r[0];

endmodule
