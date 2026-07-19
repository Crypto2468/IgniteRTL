// =============================================================================
// Project Name: IgniteRTL
// File Name:    full_adder.v
// Description:  1-bit Full Adder module using dataflow modeling. Computes the 
//               sum and carry-out of three 1-bit binary inputs (a, b, cin).
//
// Author:       IgniteRTL Contributor
// Date:         2026-07-19
// Version:      1.0
// =============================================================================

module full_adder (
    input  wire a,    // First 1-bit input operand
    input  wire b,    // Second 1-bit input operand
    input  wire cin,  // Carry-in input
    output wire sum,  // 1-bit Sum output
    output wire cout  // 1-bit Carry-out output
);

    // Continuous assignment representing the boolean equations:
    // Sum = A XOR B XOR Cin
    // Carry-out = (A AND B) OR (Cin AND (A XOR B))
    assign sum  = a ^ b ^ cin;
    assign cout = (a & b) | (cin & (a ^ b));

endmodule
