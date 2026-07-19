// Module: mux_4x1
// Description: 4-to-1 Multiplexer using behavioral modeling
// Author: IgniteRTL Contributor

module mux_4x1 (
    input  wire i0,     // Input line 0
    input  wire i1,     // Input line 1
    input  wire i2,     // Input line 2
    input  wire i3,     // Input line 3
    input  wire [1:0] sel, // 2-bit Select line
    output reg  y       // Output line
);

    always @(*) begin
        case (sel)
            2'b00: y = i0;
            2'b01: y = i1;
            2'b10: y = i2;
            2'b11: y = i3;
            default: y = 1'b0;
        endcase
    end

endmodule
