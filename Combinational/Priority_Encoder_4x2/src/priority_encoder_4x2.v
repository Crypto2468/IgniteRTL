// Module: priority_encoder_4x2
// Description: 4-to-2 Priority Encoder using behavioral modeling
// Author: IgniteRTL Contributor

module priority_encoder_4x2 (
    input  wire i0,      // Input line 0 (Lowest priority)
    input  wire i1,      // Input line 1
    input  wire i2,      // Input line 2
    input  wire i3,      // Input line 3 (Highest priority)
    output reg  [1:0] y, // 2-bit encoded output
    output reg  v        // Valid output flag (high when any input is active)
);

    always @(*) begin
        v = 1'b1;
        if (i3) begin
            y = 2'b11;
        end else if (i2) begin
            y = 2'b10;
        end else if (i1) begin
            y = 2'b01;
        end else if (i0) begin
            y = 2'b00;
        end else begin
            y = 2'b00;
            v = 1'b0;
        end
    end

endmodule
