// =============================================================================
// Project Name: IgniteRTL
// File Name:    carry_bypass_adder.v
// Description:  16-bit Carry Bypass Adder (also known as Carry Skip Adder).
//               Composed of four 4-bit blocks. Each block evaluates its 
//               group propagate term and bypasses the carry input directly 
//               to the next block when active, speeding up carry propagation.
//
// Author:       IgniteRTL Contributor
// Date:         2026-07-19
// Version:      1.0
// =============================================================================

module carry_bypass_adder (
    input  wire [15:0] a,    // 16-bit input operand A
    input  wire [15:0] b,    // 16-bit input operand B
    input  wire        cin,  // Carry-in input
    output wire [15:0] sum,  // 16-bit Sum output
    output wire        cout  // Carry-out output
);

    // Bit-wise propagate signals
    wire [15:0] p;
    assign p = a ^ b;

    // Carry connections between blocks
    wire c4, c8, c12;

    // =========================================================================
    // BLOCK 0 (Bits 3:0)
    // =========================================================================
    wire [3:0] sum_b0;
    wire [4:0] c_rip_b0;
    wire       p_block0;

    assign c_rip_b0[0] = cin;
    assign sum_b0[0]   = a[0] ^ b[0] ^ c_rip_b0[0];
    assign c_rip_b0[1] = (a[0] & b[0]) | (c_rip_b0[0] & p[0]);
    assign sum_b0[1]   = a[1] ^ b[1] ^ c_rip_b0[1];
    assign c_rip_b0[2] = (a[1] & b[1]) | (c_rip_b0[1] & p[1]);
    assign sum_b0[2]   = a[2] ^ b[2] ^ c_rip_b0[2];
    assign c_rip_b0[3] = (a[2] & b[2]) | (c_rip_b0[2] & p[2]);
    assign sum_b0[3]   = a[3] ^ b[3] ^ c_rip_b0[3];
    assign c_rip_b0[4] = (a[3] & b[3]) | (c_rip_b0[3] & p[3]);

    assign p_block0 = p[0] & p[1] & p[2] & p[3];
    assign c4       = (p_block0) ? cin : c_rip_b0[4];

    // =========================================================================
    // BLOCK 1 (Bits 7:4)
    // =========================================================================
    wire [3:0] sum_b1;
    wire [4:0] c_rip_b1;
    wire       p_block1;

    assign c_rip_b1[0] = c4;
    assign sum_b1[0]   = a[4] ^ b[4] ^ c_rip_b1[0];
    assign c_rip_b1[1] = (a[4] & b[4]) | (c_rip_b1[0] & p[4]);
    assign sum_b1[1]   = a[5] ^ b[5] ^ c_rip_b1[1];
    assign c_rip_b1[2] = (a[5] & b[5]) | (c_rip_b1[1] & p[5]);
    assign sum_b1[2]   = a[6] ^ b[6] ^ c_rip_b1[2];
    assign c_rip_b1[3] = (a[6] & b[6]) | (c_rip_b1[2] & p[6]);
    assign sum_b1[3]   = a[7] ^ b[7] ^ c_rip_b1[3];
    assign c_rip_b1[4] = (a[7] & b[7]) | (c_rip_b1[3] & p[7]);

    assign p_block1 = p[4] & p[5] & p[6] & p[7];
    assign c8       = (p_block1) ? c4 : c_rip_b1[4];

    // =========================================================================
    // BLOCK 2 (Bits 11:8)
    // =========================================================================
    wire [3:0] sum_b2;
    wire [4:0] c_rip_b2;
    wire       p_block2;

    assign c_rip_b2[0] = c8;
    assign sum_b2[0]   = a[8] ^ b[8] ^ c_rip_b2[0];
    assign c_rip_b2[1] = (a[8] & b[8]) | (c_rip_b2[0] & p[8]);
    assign sum_b2[1]   = a[9] ^ b[9] ^ c_rip_b2[1];
    assign c_rip_b2[2] = (a[9] & b[9]) | (c_rip_b2[1] & p[9]);
    assign sum_b2[2]   = a[10] ^ b[10] ^ c_rip_b2[2];
    assign c_rip_b2[3] = (a[10] & b[10]) | (c_rip_b2[2] & p[10]);
    assign sum_b2[3]   = a[11] ^ b[11] ^ c_rip_b2[3];
    assign c_rip_b2[4] = (a[11] & b[11]) | (c_rip_b2[3] & p[11]);

    assign p_block2 = p[8] & p[9] & p[10] & p[11];
    assign c12      = (p_block2) ? c8 : c_rip_b2[4];

    // =========================================================================
    // BLOCK 3 (Bits 15:12)
    // =========================================================================
    wire [3:0] sum_b3;
    wire [4:0] c_rip_b3;
    wire       p_block3;

    assign c_rip_b3[0] = c12;
    assign sum_b3[0]   = a[12] ^ b[12] ^ c_rip_b3[0];
    assign c_rip_b3[1] = (a[12] & b[12]) | (c_rip_b3[0] & p[12]);
    assign sum_b3[1]   = a[13] ^ b[13] ^ c_rip_b3[1];
    assign c_rip_b3[2] = (a[13] & b[13]) | (c_rip_b3[1] & p[13]);
    assign sum_b3[2]   = a[14] ^ b[14] ^ c_rip_b3[2];
    assign c_rip_b3[3] = (a[14] & b[14]) | (c_rip_b3[2] & p[14]);
    assign sum_b3[3]   = a[15] ^ b[15] ^ c_rip_b3[3];
    assign c_rip_b3[4] = (a[15] & b[15]) | (c_rip_b3[3] & p[15]);

    assign p_block3 = p[12] & p[13] & p[14] & p[15];
    assign cout     = (p_block3) ? c12 : c_rip_b3[4];

    // =========================================================================
    // OUTPUT ASSEMBLING
    // =========================================================================
    assign sum = {sum_b3, sum_b2, sum_b1, sum_b0};

endmodule
