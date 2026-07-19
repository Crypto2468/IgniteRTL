// Module: demux_1x2
// Description: 1-to-2 Demultiplexer using dataflow modeling
// Author: IgniteRTL Contributor

module demux_1x2 (
    input  wire i,   // Data input line
    input  wire sel, // Select line
    output wire y0,  // Output line 0
    output wire y1   // Output line 1
);

    assign y0 = (~sel) ? i : 1'b0;
    assign y1 = (sel) ? i : 1'b0;

endmodule
