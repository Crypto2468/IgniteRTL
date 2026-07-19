// Module: piso_shift_register
// Description: 4-bit Parallel-In Serial-Out (PISO) Shift Register
// Author: IgniteRTL Contributor

module piso_shift_register (
    input  wire clk,        // Clock input
    input  wire rst_n,      // Asynchronous active-low reset
    input  wire load_shift, // 1: Load parallel inputs, 0: Shift right
    input  wire [3:0] pi,   // 4-bit Parallel input
    output wire so          // Serial output
);

    reg [3:0] r;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            r <= 4'b0000;
        end else begin
            if (load_shift) begin
                r <= pi;
            end else begin
                r <= {1'b0, r[3:1]}; // Shift right, MSB filled with 0
            end
        end
    end

    assign so = r[0];

endmodule
