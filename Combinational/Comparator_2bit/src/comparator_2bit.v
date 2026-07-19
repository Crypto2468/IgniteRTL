// Module: comparator_2bit
// Description: 2-bit Magnitude Comparator using dataflow modeling
// Author: IgniteRTL Contributor

module comparator_2bit (
    input  wire [1:0] a,      // 2-bit Input A
    input  wire [1:0] b,      // 2-bit Input B
    output wire       a_eq_b, // A == B status flag
    output wire       a_gt_b, // A > B status flag
    output wire       a_lt_b  // A < B status flag
);

    assign a_eq_b = (a == b);
    assign a_gt_b = (a > b);
    assign a_lt_b = (a < b);

endmodule
