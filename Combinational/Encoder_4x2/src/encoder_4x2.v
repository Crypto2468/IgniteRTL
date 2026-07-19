// Module: encoder_4x2
// Description: 4-to-2 Binary Encoder using behavioral modeling
// Author: IgniteRTL Contributor

module encoder_4x2 (
    input  wire i0,      // Input line 0
    input  wire i1,      // Input line 1
    input  wire i2,      // Input line 2
    input  wire i3,      // Input line 3
    output reg  [1:0] y  // 2-bit encoded output
);

    always @(*) begin
        case ({i3, i2, i1, i0})
            4'b0001: y = 2'b00;
            4'b0010: y = 2'b01;
            4'b0100: y = 2'b10;
            4'b1000: y = 2'b11;
            default: y = 2'b00;
        endcase
    end

endmodule
