// =============================================================================
// Project Name: IgniteRTL
// File Name:    carry_lookahead_adder.v
// Description:  4-bit Carry Lookahead Adder (CLA) module using explicit 
//               parallel carry lookahead equations. Provides low latency 
//               addition by computing carry signals in parallel.
//
// Author:       IgniteRTL Contributor
// Date:         2026-07-19
// Version:      1.0
// =============================================================================

module carry_lookahead_adder (
    input  wire [3:0] a,    // 4-bit input operand A
    input  wire [3:0] b,    // 4-bit input operand B
    input  wire       cin,  // Carry-in
    output wire [3:0] sum,  // 4-bit Sum output
    output wire       cout, // Carry-out
    output wire       pg,   // Block Propagate (for hierarchy cascading)
    output wire       gg    // Block Generate (for hierarchy cascading)
);

    // Internal propagate and generate wires
    wire [3:0] p;
    wire [3:0] g;
    wire [4:0] c;

    // Generate and Propagate terms
    assign p = a ^ b;
    assign g = a & b;

    // Connect carry-in to internal carry index 0
    assign c[0] = cin;

    // Carry Lookahead logic equations
    assign c[1] = g[0] | (p[0] & c[0]);
    
    assign c[2] = g[1] | 
                  (p[1] & g[0]) | 
                  (p[1] & p[0] & c[0]);
                  
    assign c[3] = g[2] | 
                  (p[2] & g[1]) | 
                  (p[2] & p[1] & g[0]) | 
                  (p[2] & p[1] & p[0] & c[0]);
                  
    assign c[4] = g[3] | 
                  (p[3] & g[2]) | 
                  (p[3] & p[2] & g[1]) | 
                  (p[3] & p[2] & p[1] & g[0]) | 
                  (p[3] & p[2] & p[1] & p[0] & c[0]);

    // Sum calculation
    assign sum = p ^ c[3:0];

    // Carry-out mapping
    assign cout = c[4];

    // Block level propagate and generate (PG/GG) logic
    assign pg = p[3] & p[2] & p[1] & p[0];
    assign gg = g[3] | 
                (p[3] & g[2]) | 
                (p[3] & p[2] & g[1]) | 
                (p[3] & p[2] & p[1] & g[0]);

endmodule
