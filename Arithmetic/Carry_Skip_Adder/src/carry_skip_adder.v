// =============================================================================
// Project Name: IgniteRTL
// File Name:    carry_skip_adder.v
// Description:  8-bit Carry Skip Adder (also known as Carry Bypass Adder). 
//               Divided into two 4-bit blocks. If all bits in a block propagate, 
//               the block carry-in bypasses the ripple chain and is skipped 
//               directly to the block carry-out.
//
// Author:       IgniteRTL Contributor
// Date:         2026-07-19
// Version:      1.0
// =============================================================================

module carry_skip_adder (
    input  wire [7:0] a,    // 8-bit input operand A
    input  wire [7:0] b,    // 8-bit input operand B
    input  wire       cin,  // Carry-in input
    output wire [7:0] sum,  // 8-bit Sum output
    output wire       cout  // Carry-out output
);

    // Propagate terms for each bit
    wire [7:0] p;
    assign p = a ^ b;

    // =========================================================================
    // BLOCK 0 (Bits 3:0)
    // =========================================================================
    wire [3:0] sum_low;
    wire [4:0] c_ripple_low;
    wire       p_block0;
    wire       c4;

    assign c_ripple_low[0] = cin;

    generate
        genvar i;
        for (i = 0; i < 4; i = i + 1) begin : gen_ripple_low
            assign sum_low[i]  = a[i] ^ b[i] ^ c_ripple_low[i];
            assign c_ripple_low[i+1] = (a[i] & b[i]) | (c_ripple_low[i] & p[i]);
        end
    endgenerate

    // Block 0 Propagate condition: All 4 bits must propagate
    assign p_block0 = p[0] & p[1] & p[2] & p[3];

    // Carry skip multiplexer for block 0
    assign c4 = (p_block0) ? cin : c_ripple_low[4];

    // =========================================================================
    // BLOCK 1 (Bits 7:4)
    // =========================================================================
    wire [3:0] sum_high;
    wire [4:0] c_ripple_high;
    wire       p_block1;

    assign c_ripple_high[0] = c4;

    generate
        genvar j;
        for (j = 0; j < 4; j = j + 1) begin : gen_ripple_high
            assign sum_high[j]  = a[j+4] ^ b[j+4] ^ c_ripple_high[j];
            assign c_ripple_high[j+1] = (a[j+4] & b[j+4]) | (c_ripple_high[j] & p[j+4]);
        end
    endgenerate

    // Block 1 Propagate condition: All 4 bits must propagate
    assign p_block1 = p[4] & p[5] & p[6] & p[7];

    // Carry skip multiplexer for block 1
    assign cout = (p_block1) ? c4 : c_ripple_high[4];

    // Combine outputs
    assign sum = {sum_high, sum_low};

endmodule
