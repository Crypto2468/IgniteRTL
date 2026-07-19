// Module: mux_8x1
// Description: 8-to-1 Multiplexer using behavioral modeling
// Author: IgniteRTL Contributor

module mux_8x1 (
    input  wire i0,        // Input line 0
    input  wire i1,        // Input line 1
    input  wire i2,        // Input line 2
    input  wire i3,        // Input line 3
    input  wire i4,        // Input line 4
    input  wire i5,        // Input line 5
    input  wire i6,        // Input line 6
    input  wire i7,        // Input line 7
    input  wire [2:0] sel, // 3-bit Select line
    output reg  y          // Output line
);

    always @(*) begin
        case (sel)
            3'b000: y = i0;
            3'b001: y = i1;
            3'b010: y = i2;
            3'b011: y = i3;
            3'b100: y = i4;
            3'b101: y = i5;
            3'b110: y = i6;
            3'b111: y = i7;
            default: y = 1'b0;
        endcase
    end

endmodule
