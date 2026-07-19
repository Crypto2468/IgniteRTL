// Module: decoder_3x8
// Description: 3-to-8 Decoder with active-high Enable using behavioral modeling
// Author: IgniteRTL Contributor

module decoder_3x8 (
    input  wire [2:0] a,  // 3-bit Binary input
    input  wire       en, // Enable input (active-high)
    output reg  y0,       // Output line 0
    output reg  y1,       // Output line 1
    output reg  y2,       // Output line 2
    output reg  y3,       // Output line 3
    output reg  y4,       // Output line 4
    output reg  y5,       // Output line 5
    output reg  y6,       // Output line 6
    output reg  y7        // Output line 7
);

    always @(*) begin
        // Reset all outputs to 0 to prevent latch creation
        y0 = 1'b0; y1 = 1'b0; y2 = 1'b0; y3 = 1'b0;
        y4 = 1'b0; y5 = 1'b0; y6 = 1'b0; y7 = 1'b0;
        
        if (en) begin
            case (a)
                3'b000: y0 = 1'b1;
                3'b001: y1 = 1'b1;
                3'b010: y2 = 1'b1;
                3'b011: y3 = 1'b1;
                3'b100: y4 = 1'b1;
                3'b101: y5 = 1'b1;
                3'b110: y6 = 1'b1;
                3'b111: y7 = 1'b1;
            endcase
        end
    end

endmodule
