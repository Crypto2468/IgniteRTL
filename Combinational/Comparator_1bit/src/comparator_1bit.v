// Module: comparator_1bit
// Description: 1-bit Magnitude Comparator using dataflow modeling
// Author: IgniteRTL Contributor

module comparator_1bit (
    input  wire a,      // 1-bit Input A
    input  wire b,      // 1-bit Input B
    output wire a_eq_b, // A == B status flag
    output wire a_gt_b, // A > B status flag
    output wire a_lt_b  // A < B status flag
);

    assign a_eq_b = (a == b);
    assign a_gt_b = (a > b);
    assign a_lt_b = (a < b);

endmodule
