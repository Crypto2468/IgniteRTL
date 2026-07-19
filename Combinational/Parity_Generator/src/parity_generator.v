// Module: parity_generator
// Description: 4-bit Even and Odd Parity Generator using dataflow modeling
// Author: IgniteRTL Contributor

module parity_generator (
    input  wire [3:0] data_in,     // 4-bit Input data
    output wire       parity_even, // Even parity bit output
    output wire       parity_odd   // Odd parity bit output
);

    // Even parity is 1 if the number of 1s in input is odd (XOR reduction)
    assign parity_even = ^data_in;

    // Odd parity is 1 if the number of 1s in input is even (XNOR reduction)
    assign parity_odd  = ~^data_in;

endmodule
