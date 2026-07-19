// =============================================================================
// Project Name: IgniteRTL
// File Name:    carry_completion_adder.v
// Description:  Parameterized Carry Completion Adder (CCA). Models asynchronous 
//               self-timed carry propagation using dual-rail carry logic. 
//               Forced to unresolved state when start=0, and evaluates when start=1. 
//               Asserts 'done' when the carry chain has fully stabilized.
//
// Author:       IgniteRTL Contributor
// Date:         2026-07-19
// Version:      1.0
// =============================================================================

module carry_completion_adder #(
    parameter WIDTH = 8
)(
    input  wire             start, // Start evaluation (high=evaluate, low=clear)
    input  wire [WIDTH-1:0] a,     // Operand input A
    input  wire [WIDTH-1:0] b,     // Operand input B
    input  wire             cin,   // Carry-in input
    output wire [WIDTH-1:0] sum,   // Sum output
    output wire             cout,  // Carry-out output
    output wire             done   // Completion signal (high when carry is stable)
);

    // Dual-rail carry signals: c_one (carry is 1) and c_zero (carry is 0)
    wire [WIDTH:0] c_one;
    wire [WIDTH:0] c_zero;
    wire [WIDTH-1:0] complete;

    // LSB carry initialization
    assign c_one[0]  = start ? cin  : 1'b0;
    assign c_zero[0] = start ? ~cin : 1'b0;

    // Generate dual-rail carry networks for each bit
    generate
        genvar i;
        for (i = 0; i < WIDTH; i = i + 1) begin : gen_cca_rail
            // Carry is 1 if generated, or if propagated and previous carry was 1
            assign c_one[i+1] = start ? ((a[i] & b[i]) | ((a[i] ^ b[i]) & c_one[i])) : 1'b0;

            // Carry is 0 if killed, or if propagated and previous carry was 0
            assign c_zero[i+1] = start ? ((~a[i] & ~b[i]) | ((a[i] ^ b[i]) & c_zero[i])) : 1'b0;

            // Completion check for this bit: carry must have resolved to either 1 or 0
            assign complete[i] = c_one[i+1] ^ c_zero[i+1];
        end
    endgenerate

    // Sum is computed using the resolved c_one values
    assign sum  = a ^ b ^ c_one[WIDTH-1:0];
    assign cout = c_one[WIDTH];

    // Done is asserted when all bits have resolved their carry status
    assign done = start ? (&complete) : 1'b0;

endmodule
