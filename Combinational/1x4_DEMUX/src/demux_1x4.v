// Module: demux_1x4
// Description: 1-to-4 Demultiplexer using behavioral modeling
// Author: IgniteRTL Contributor

module demux_1x4 (
    input  wire i,          // Data input line
    input  wire [1:0] sel,  // 2-bit Select line
    output reg  y0,         // Output line 0
    output reg  y1,         // Output line 1
    output reg  y2,         // Output line 2
    output reg  y3          // Output line 3
);

    always @(*) begin
        // Default assignment to avoid latch inference
        y0 = 1'b0;
        y1 = 1'b0;
        y2 = 1'b0;
        y3 = 1'b0;
        
        case (sel)
            2'b00: y0 = i;
            2'b01: y1 = i;
            2'b10: y2 = i;
            2'b11: y3 = i;
        endcase
    end

endmodule
