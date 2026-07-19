// =============================================================================
// Project Name: IgniteRTL
// File Name:    carry_select_adder.v
// Description:  8-bit Carry Select Adder (CSLA). Splits the adder into two 
//               4-bit blocks. The upper 4-bit block pre-computes results 
//               for both carry-in assumptions (0 and 1) and multiplexes 
//               them based on the lower stage's carry-out.
//
// Author:       IgniteRTL Contributor
// Date:         2026-07-19
// Version:      1.0
// =============================================================================

module carry_select_adder (
    input  wire [7:0] a,    // 8-bit input operand A
    input  wire [7:0] b,    // 8-bit input operand B
    input  wire       cin,  // Carry-in input
    output wire [7:0] sum,  // 8-bit Sum output
    output wire       cout  // Carry-out output
);

    // =========================================================================
    // LOWER 4-BIT BLOCK (Bits 3:0) - Standard Ripple Carry
    // =========================================================================
    wire [3:0] sum_low;
    wire [4:0] c_low;

    assign c_low[0] = cin;

    generate
        genvar i;
        for (i = 0; i < 4; i = i + 1) begin : gen_low_adder
            assign sum_low[i]  = a[i] ^ b[i] ^ c_low[i];
            assign c_low[i+1] = (a[i] & b[i]) | (c_low[i] & (a[i] ^ b[i]));
        end
    endgenerate

    wire c4 = c_low[4]; // Selection signal for the upper block

    // =========================================================================
    // UPPER 4-BIT BLOCK (Bits 7:4) - Path for Carry-In = 0
    // =========================================================================
    wire [3:0] sum_high_c0;
    wire [4:0] c_high_c0;

    assign c_high_c0[0] = 1'b0;

    generate
        genvar j;
        for (j = 0; j < 4; j = j + 1) begin : gen_high_adder_c0
            assign sum_high_c0[j]  = a[j+4] ^ b[j+4] ^ c_high_c0[j];
            assign c_high_c0[j+1] = (a[j+4] & b[j+4]) | (c_high_c0[j] & (a[j+4] ^ b[j+4]));
        end
    endgenerate

    // =========================================================================
    // UPPER 4-BIT BLOCK (Bits 7:4) - Path for Carry-In = 1
    // =========================================================================
    wire [3:0] sum_high_c1;
    wire [4:0] c_high_c1;

    assign c_high_c1[0] = 1'b1;

    generate
        genvar k;
        for (k = 0; k < 4; k = k + 1) begin : gen_high_adder_c1
            assign sum_high_c1[k]  = a[j+4] ^ b[j+4] ^ c_high_c1[k];
            assign c_high_c1[k+1] = (a[j+4] & b[j+4]) | (c_high_c1[k] & (a[j+4] ^ b[j+4]));
        end
    endgenerate

    // =========================================================================
    // MULTIPLEXER SELECT LOGIC
    // =========================================================================
    assign sum[3:0] = sum_low;
    assign sum[7:4] = (c4) ? sum_high_c1 : sum_high_c0;
    assign cout     = (c4) ? c_high_c1[4] : c_high_c0[4];

endmodule
