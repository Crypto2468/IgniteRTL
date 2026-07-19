// =============================================================================
// Project Name: IgniteRTL
// File Name:    carry_increment_adder.v
// Description:  8-bit Carry Increment Adder (CIA). Uses a single adder for the 
//               upper block with carry-in=0, and conditionally increments the 
//               sum using a series of half-adders when the lower carry-out 
//               arrives, reducing area compared to Carry Select Adders.
//
// Author:       IgniteRTL Contributor
// Date:         2026-07-19
// Version:      1.0
// =============================================================================

module carry_increment_adder (
    input  wire [7:0] a,    // 8-bit input operand A
    input  wire [7:0] b,    // 8-bit input operand B
    input  wire       cin,  // Carry-in input
    output wire [7:0] sum,  // 8-bit Sum output
    output wire       cout  // Carry-out output
);

    // =========================================================================
    // LOWER 4-BIT BLOCK (Bits 3:0)
    // =========================================================================
    wire [3:0] sum_low;
    wire [4:0] c_low;

    assign c_low[0] = cin;

    generate
        genvar i;
        for (i = 0; i < 4; i = i + 1) begin : gen_low_rca
            assign sum_low[i]  = a[i] ^ b[i] ^ c_low[i];
            assign c_low[i+1]  = (a[i] & b[i]) | (c_low[i] & (a[i] ^ b[i]));
        end
    endgenerate

    wire c4 = c_low[4]; // Carry-out of lower block used to trigger incrementer

    // =========================================================================
    // UPPER 4-BIT BLOCK (Bits 7:4) - Base Addition (cin = 0)
    // =========================================================================
    wire [3:0] sum_high_raw;
    wire [4:0] c_high_raw;

    assign c_high_raw[0] = 1'b0;

    generate
        genvar j;
        for (j = 0; j < 4; j = j + 1) begin : gen_high_rca_raw
            assign sum_high_raw[j]  = a[j+4] ^ b[j+4] ^ c_high_raw[j];
            assign c_high_raw[j+1]  = (a[j+4] & b[j+4]) | (c_high_raw[j] & (a[j+4] ^ b[j+4]));
        end
    endgenerate

    // =========================================================================
    // CONDITIONAL INCREMENT LOGIC (Half-Adder Chain)
    // =========================================================================
    wire [3:0] sum_high_inc;
    wire [3:0] inc_carry;

    // First stage of incrementer: adds sum_high_raw[0] and c4
    assign sum_high_inc[0] = sum_high_raw[0] ^ c4;
    assign inc_carry[0]    = sum_high_raw[0] & c4;

    // Remaining stages of the half-adder chain
    assign sum_high_inc[1] = sum_high_raw[1] ^ inc_carry[0];
    assign inc_carry[1]    = sum_high_raw[1] & inc_carry[0];

    assign sum_high_inc[2] = sum_high_raw[2] ^ inc_carry[1];
    assign inc_carry[2]    = sum_high_raw[2] & inc_carry[1];

    assign sum_high_inc[3] = sum_high_raw[3] ^ inc_carry[2];
    assign inc_carry[3]    = sum_high_raw[3] & inc_carry[2];

    // =========================================================================
    // OUTPUT ASSIGNMENTS
    // =========================================================================
    assign sum[3:0] = sum_low;
    assign sum[7:4] = sum_high_inc;
    
    // Carry-out is high if either the base addition overflowed OR the increment overflowed
    assign cout     = c_high_raw[4] | inc_carry[3];

endmodule
