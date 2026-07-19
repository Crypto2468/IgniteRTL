// =============================================================================
// Project Name: IgniteRTL
// File Name:    carry_save_adder.v
// Description:  Parameterized N-bit Carry Save Adder (CSA). It reduces three 
//               N-bit inputs (a, b, c) into two N-bit outputs (sum, carry) 
//               in parallel with O(1) gate delay.
//
// Author:       IgniteRTL Contributor
// Date:         2026-07-19
// Version:      1.0
// =============================================================================

module carry_save_adder #(
    parameter WIDTH = 8 // Default operand bit width
)(
    input  wire [WIDTH-1:0] a,     // Operand input A
    input  wire [WIDTH-1:0] b,     // Operand input B
    input  wire [WIDTH-1:0] c,     // Operand input C
    output wire [WIDTH-1:0] sum,   // Sum output vector (un-propagated)
    output wire [WIDTH-1:0] carry  // Carry output vector (un-propagated)
);

    // Generate loop to instantiate parallel 1-bit full adder equations
    generate
        genvar i;
        for (i = 0; i < WIDTH; i = i + 1) begin : gen_csa
            assign sum[i]   = a[i] ^ b[i] ^ c[i];
            assign carry[i] = (a[i] & b[i]) | (b[i] & c[i]) | (c[i] & a[i]);
        end
    endgenerate

endmodule
