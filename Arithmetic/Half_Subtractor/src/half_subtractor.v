// =============================================================================
// Project Name: IgniteRTL
// File Name:    half_subtractor.v
// Description:  1-bit Half Subtractor module using dataflow modeling. Computes 
//               the difference and borrow-out of two 1-bit binary inputs (a, b).
//
// Author:       IgniteRTL Contributor
// Date:         2026-07-19
// Version:      1.0
// =============================================================================

module half_subtractor (
    input  wire a,    // Minuend input
    input  wire b,    // Subtrahend input
    output wire diff, // Difference output
    output wire bout  // Borrow-out output
);

    // Continuous assignment representing the boolean equations:
    // Difference = A XOR B
    // Borrow-out = (NOT A) AND B
    assign diff = a ^ b;
    assign bout = ~a & b;

endmodule
