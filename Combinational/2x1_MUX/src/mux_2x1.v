// Module: mux_2x1
// Description: 2-to-1 Multiplexer using dataflow modeling
// Author: IgniteRTL Contributor

module mux_2x1 (
    input  wire i0,  // Input line 0
    input  wire i1,  // Input line 1
    input  wire sel, // Select line
    output wire y    // Output line
);

    assign y = (sel) ? i1 : i0;

endmodule
