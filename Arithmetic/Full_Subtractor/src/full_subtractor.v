// =============================================================================
// Project Name: IgniteRTL
// File Name:    full_subtractor.v
// Description:  1-bit Full Subtractor module using dataflow modeling. Computes 
//               the difference and borrow-out of three 1-bit binary inputs 
//               (a, b, bin).
//
// Author:       IgniteRTL Contributor
// Date:         2026-07-19
// Version:      1.0
// =============================================================================

module full_subtractor (
    input  wire a,    // Minuend input
    input  wire b,    // Subtrahend input
    input  wire bin,  // Borrow-in input
    output wire diff, // Difference output
    output wire bout  // Borrow-out output
);

    // Continuous assignment representing the boolean equations:
    // Difference = A XOR B XOR Bin
    // Borrow-out = (~A AND B) OR (~A AND Bin) OR (B AND Bin)
    assign diff = a ^ b ^ bin;
    assign bout = (~a & b) | (~a & bin) | (b & bin);

endmodule
