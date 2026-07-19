// Module: pipo_shift_register
// Description: 4-bit Parallel-In Parallel-Out (PIPO) Shift Register
// Author: IgniteRTL Contributor

module pipo_shift_register (
    input  wire clk,    // Clock input
    input  wire rst_n,  // Asynchronous active-low reset
    input  wire [3:0] pi, // 4-bit Parallel input
    output reg  [3:0] po // 4-bit Parallel output
);

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            po <= 4'b0000;
        end else begin
            po <= pi;
        end
    end

endmodule
