// Module: parity_checker
// Description: 4-bit Even Parity Checker using dataflow modeling
// Author: IgniteRTL Contributor

module parity_checker (
    input  wire [3:0] data_in, // Received 4-bit data
    input  wire       parity,  // Received parity bit
    output wire       error    // Active-high error detection flag
);

    // Error is asserted high if the total number of 1s (data + parity) is odd
    assign error = ^({data_in, parity});

endmodule
