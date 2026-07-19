// Module: decoder_2x4
// Description: 2-to-4 Decoder with active-high Enable using behavioral modeling
// Author: IgniteRTL Contributor

module decoder_2x4 (
    input  wire [1:0] a,  // 2-bit Binary input
    input  wire       en, // Enable input (active-high)
    output reg  y0,       // Output line 0
    output reg  y1,       // Output line 1
    output reg  y2,       // Output line 2
    output reg  y3        // Output line 3
);

    always @(*) begin
        // Reset all outputs to 0 to prevent latch creation
        y0 = 1'b0;
        y1 = 1'b0;
        y2 = 1'b0;
        y3 = 1'b0;
        
        if (en) begin
            case (a)
                2'b00: y0 = 1'b1;
                2'b01: y1 = 1'b1;
                2'b10: y2 = 1'b1;
                2'b11: y3 = 1'b1;
            endcase
        end
    end

endmodule
