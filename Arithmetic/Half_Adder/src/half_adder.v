// =============================================================================
// Project Name: IgniteRTL
// File Name:    half_adder.v
// Description:  Implementation of a basic 1-bit Half Adder module using 
//               dataflow modeling. It computes the sum and carry of two 
//               1-bit binary inputs.
//
// Author:       IgniteRTL Contributor
// Date:         2026-07-19
// Version:      1.0
// =============================================================================

module half_adder (
    input  wire a,   // First 1-bit input operand
    input  wire b,   // Second 1-bit input operand
    output wire sum, // 1-bit Sum output
    output wire co   // 1-bit Carry-out output
);

    // Continuous assignment representing the boolean equations:
    // Sum = A XOR B
    // Carry-out = A AND B
    assign sum = a ^ b;
    assign co  = a & b;

endmodule
