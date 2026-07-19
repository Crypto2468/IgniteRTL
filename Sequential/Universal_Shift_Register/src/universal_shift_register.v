// Module: universal_shift_register
// Description: 4-bit Universal Shift Register
// Author: IgniteRTL Contributor

module universal_shift_register (
    input  wire clk,        // Clock input
    input  wire rst_n,      // Asynchronous active-low reset
    input  wire [1:0] mode, // Mode select (00:Hold, 01:Shift Right, 10:Shift Left, 11:Load)
    input  wire srin,       // Serial input for shift right
    input  wire slin,       // Serial input for shift left
    input  wire [3:0] d,    // 4-bit Parallel data input
    output reg  [3:0] q     // 4-bit Register output
);

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            q <= 4'b0000;
        end else begin
            case (mode)
                2'b01:   q <= {srin, q[3:1]}; // Shift Right
                2'b10:   q <= {q[2:0], slin}; // Shift Left
                2'b11:   q <= d;              // Parallel Load
                default: q <= q;              // Hold (00 and default)
            endcase
        end
    end

endmodule
