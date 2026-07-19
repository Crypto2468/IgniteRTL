// Module: d_latch
// Description: NAND-based Gated D Latch using structural gate primitives
// Author: IgniteRTL Contributor

module d_latch (
    input  wire d,   // Data input
    input  wire en,  // Enable input (active-high)
    output wire q,   // Output Q
    output wire q_n  // Complement output Q_n
);

    wire d_n;
    wire s_gate, r_gate;

    // Data inverter
    not (d_n, d);

    // Gating stages (NAND)
    nand (s_gate, d, en);
    nand (r_gate, d_n, en);

    // Cross-coupled NAND latch
    nand (q, s_gate, q_n);
    nand (q_n, r_gate, q);

endmodule
