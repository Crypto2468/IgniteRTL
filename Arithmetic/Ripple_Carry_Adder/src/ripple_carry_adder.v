// =============================================================================
// Project Name: IgniteRTL
// File Name:    ripple_carry_adder.v
// Description:  Parameterized N-bit Ripple Carry Adder using continuous 
//               generate loop expressions. Fully synthesizable and self-contained.
//
// Author:       IgniteRTL Contributor
// Date:         2026-07-19
// Version:      1.0
// =============================================================================

module ripple_carry_adder #(
    parameter WIDTH = 8 // Default operand bit width
)(
    input  wire [WIDTH-1:0] a,    // First N-bit input operand
    input  wire [WIDTH-1:0] b,    // Second N-bit input operand
    input  wire             cin,  // Carry-in input
    output wire [WIDTH-1:0] sum,  // N-bit Sum output
    output wire             cout  // Carry-out output
);

    // Internal carry network
    wire [WIDTH:0] carry;

    // Connect carry-in to the first carry net
    assign carry[0] = cin;

    // Generate loop to compute sum and carry bits iteratively
    generate
        genvar i;
        for (i = 0; i < WIDTH; i = i + 1) begin : gen_rca
            assign sum[i] = a[i] ^ b[i] ^ carry[i];
            assign carry[i+1] = (a[i] & b[i]) | (carry[i] & (a[i] ^ b[i]));
        end
    endgenerate

    // Connect final carry net to output Carry-out
    assign cout = carry[WIDTH];

endmodule
