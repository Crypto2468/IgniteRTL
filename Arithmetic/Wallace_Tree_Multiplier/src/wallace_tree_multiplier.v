// =============================================================================
// Project Name: IgniteRTL
// File Name:    wallace_tree_multiplier.v
// Description:  4x4 Unsigned Wallace Tree Multiplier. Uses a tree of half-adders 
//               and full-adders to reduce 16 partial products to two 8-bit vectors, 
//               which are then added combinationally.
//
// Author:       IgniteRTL Contributor
// Date:         2026-07-19
// Version:      1.0
// =============================================================================

module wallace_tree_multiplier (
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
    // WALLACE REDUCTION TREE
    // =========================================================================
    
    // Column 0: 1 element (p00) -> goes directly to final vector X

    // Column 1: 2 elements (p01, p10)
    wire s_c1_1, c_c1_1;
    assign s_c1_1 = p01 ^ p10;
    assign c_c1_1 = p01 & p10;

    // Column 2: 3 elements (p02, p11, p20) + 1 carry (c_c1_1)
    wire s_c2_1, c_c2_1;
    // Reduce first 3 elements using a full adder
    assign s_c2_1 = p02 ^ p11 ^ p20;
    assign c_c2_1 = (p02 & p11) | (p20 & (p02 ^ p11));

    // Column 3: 4 elements (p03, p12, p21, p30) + 1 carry (c_c2_1)
    wire s_c3_1, c_c3_1;
    wire s_c3_2, c_c3_2;
    // Reduce first 3 elements (p03, p12, p21)
    assign s_c3_1 = p03 ^ p12 ^ p21;
    assign c_c3_1 = (p03 & p12) | (p21 & (p03 ^ p12));
    // Reduce remaining 2 elements (p30, c_c2_1)
    assign s_c3_2 = p30 ^ c_c2_1;
    assign c_c3_2 = p30 & c_c2_1;

    // Column 4: 3 elements (p13, p22, p31) + 2 carries (c_c3_1, c_c3_2)
    wire s_c4_1, c_c4_1;
    wire s_c4_2, c_c4_2;
    // Reduce first 3 elements (p13, p22, p31)
    assign s_c4_1 = p13 ^ p22 ^ p31;
    assign c_c4_1 = (p13 & p22) | (p31 & (p13 ^ p22));
    // Reduce carries (c_c3_1, c_c3_2)
    assign s_c4_2 = c_c3_1 ^ c_c3_2;
    assign c_c4_2 = c_c3_1 & c_c3_2;

    // Column 5: 2 elements (p23, p32) + 2 carries (c_c4_1, c_c4_2)
    wire s_c5_1, c_c5_1;
    // Reduce 3 elements (p23, p32, c_c4_1)
    assign s_c5_1 = p23 ^ p32 ^ c_c4_1;
    assign c_c5_1 = (p23 & p32) | (c_c4_1 & (p23 ^ p32));
    // Remaining element c_c4_2 is passed down

    // Column 6: 1 element (p33) + 1 carry (c_c5_1) -> both go to final vectors

    // =========================================================================
    // FINAL TWO-OPERAND VECTOR ADDITION
    // =========================================================================
    wire [7:0] x;
    wire [7:0] y;

    assign x[0] = p00;
    assign x[1] = s_c1_1;
    assign x[2] = s_c2_1;
    assign x[3] = s_c3_1;
    assign x[4] = s_c4_1;
    assign x[5] = s_c5_1;
    assign x[6] = p33;
    assign x[7] = 1'b0;

    assign y[0] = 1'b0;
    assign y[1] = 1'b0;
    assign y[2] = c_c1_1;
    assign y[3] = s_c3_2;
    assign y[4] = s_c4_2;
    assign y[5] = c_c4_2;
    assign y[6] = c_c5_1;
    assign y[7] = 1'b0;

    // Final sum
    assign product = x + y;

endmodule
