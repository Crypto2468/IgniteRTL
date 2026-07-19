// =============================================================================
// Project Name: IgniteRTL
// File Name:    dadda_multiplier.v
// Description:  4x4 Unsigned Dadda Multiplier. Uses a tree of half-adders 
//               and full-adders to reduce 16 partial products to two 8-bit vectors 
//               by keeping column heights within the Dadda sequence (4 -> 3 -> 2).
//
// Author:       IgniteRTL Contributor
// Date:         2026-07-19
// Version:      1.0
// =============================================================================

module dadda_multiplier (
    input  wire [3:0] a,       // 4-bit input operand A
    input  wire [3:0] b,       // 4-bit input operand B
    output wire [7:0] product  // 8-bit multiplication product
);

    // =========================================================================
    // PARTIAL PRODUCTS GENERATION
    // =========================================================================
    wire p00, p01, p02, p03;
    wire p10, p11, p12, p13;
    wire p20, p21, p22, p23;
    wire p30, p31, p32, p33;

    assign p00 = a[0] & b[0]; assign p01 = a[1] & b[0]; assign p02 = a[2] & b[0]; assign p03 = a[3] & b[0];
    assign p10 = a[0] & b[1]; assign p11 = a[1] & b[1]; assign p12 = a[2] & b[1]; assign p13 = a[3] & b[1];
    assign p20 = a[0] & b[2]; assign p21 = a[1] & b[2]; assign p22 = a[2] & b[2]; assign p23 = a[3] & b[2];
    assign p30 = a[0] & b[3]; assign p31 = a[1] & b[3]; assign p32 = a[2] & b[3]; assign p33 = a[3] & b[3];

    // =========================================================================
    // DADDA REDUCTION TREE
    // =========================================================================

    // -------------------------------------------------------------------------
    // STAGE 1: Reduce columns to maximum height of 3
    // -------------------------------------------------------------------------
    // Column 3 has height 4. Reduce to 3 using a Half Adder.
    wire s1_c3_sum, s1_c3_carry;
    assign s1_c3_sum   = p03 ^ p12;
    assign s1_c3_carry = p03 & p12;
    // Column 3 elements are now: p21, p30, s1_c3_sum

    // Column 4 has height 3 + 1 (s1_c3_carry) = 4. Reduce to 3 using a Half Adder.
    wire s1_c4_sum, s1_c4_carry;
    assign s1_c4_sum   = p13 ^ p22;
    assign s1_c4_carry = p13 & p22;
    // Column 4 elements are now: p31, s1_c3_carry, s1_c4_sum

    // Column 5 has height 2 + 1 (s1_c4_carry) = 3. No reduction needed.
    // Column 5 elements are: p23, p32, s1_c4_carry

    // -------------------------------------------------------------------------
    // STAGE 2: Reduce columns to maximum height of 2
    // -------------------------------------------------------------------------
    // Column 2 has height 3 (p02, p11, p20). Reduce using a Full Adder.
    wire s2_c2_sum, s2_c2_carry;
    assign s2_c2_sum   = p02 ^ p11 ^ p20;
    assign s2_c2_carry = (p02 & p11) | (p20 & (p02 ^ p11));

    // Column 3 has height 3 (p21, p30, s1_c3_sum) + 1 carry (s2_c2_carry) = 4.
    // Reduce using a Full Adder.
    wire s2_c3_sum, s2_c3_carry;
    assign s2_c3_sum   = p21 ^ p30 ^ s1_c3_sum;
    assign s2_c3_carry = (p21 & p30) | (s1_c3_sum & (p21 ^ p30));
    // Column 3 final elements: s2_c3_sum, s2_c2_carry

    // Column 4 has height 3 (p31, s1_c3_carry, s1_c4_sum) + 1 carry (s2_c3_carry) = 4.
    // Reduce using a Full Adder.
    wire s2_c4_sum, s2_c4_carry;
    assign s2_c4_sum   = p31 ^ s1_c3_carry ^ s1_c4_sum;
    assign s2_c4_carry = (p31 & s1_c3_carry) | (s1_c4_sum & (p31 ^ s1_c3_carry));
    // Column 4 final elements: s2_c4_sum, s2_c3_carry

    // Column 5 has height 3 (p23, p32, s1_c4_carry) + 1 carry (s2_c4_carry) = 4.
    // Reduce using a Full Adder.
    wire s2_c5_sum, s2_c5_carry;
    assign s2_c5_sum   = p23 ^ p32 ^ s1_c4_carry;
    assign s2_c5_carry = (p23 & p32) | (s1_c4_carry & (p23 ^ p32));
    // Column 5 final elements: s2_c5_sum, s2_c4_carry

    // Column 6 final elements: p33 and s2_c5_carry

    // =========================================================================
    // FINAL TWO-OPERAND VECTOR ADDITION
    // =========================================================================
    wire [7:0] x;
    wire [7:0] y;

    assign x[0] = p00;
    assign x[1] = p01;
    assign x[2] = s2_c2_sum;
    assign x[3] = s2_c3_sum;
    assign x[4] = s2_c4_sum;
    assign x[5] = s2_c5_sum;
    assign x[6] = p33;
    assign x[7] = 1'b0;

    assign y[0] = 1'b0;
    assign y[1] = p10;
    assign y[2] = 1'b0;
    assign y[3] = s2_c2_carry;
    assign y[4] = s2_c3_carry;
    assign y[5] = s2_c4_carry;
    assign y[6] = s2_c5_carry;
    assign y[7] = 1'b0;

    // Final sum
    assign product = x + y;

endmodule
