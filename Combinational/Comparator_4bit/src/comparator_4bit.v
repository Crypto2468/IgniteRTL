// Module: comparator_4bit
// Description: 4-bit Magnitude Comparator using dataflow modeling
// Author: IgniteRTL Contributor

module comparator_4bit (
    input  wire [3:0] a,      // 4-bit Input A
    input  wire [3:0] b,      // 4-bit Input B
    output wire       a_eq_b, // A == B status flag
    output wire       a_gt_b, // A > B status flag
    output wire       a_lt_b  // A < B status flag
);

    assign a_eq_b = (a == b);
    assign a_gt_b = (a > b);
    assign a_lt_b = (a < b);

endmodule
