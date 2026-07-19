// Module: sr_latch
// Description: NAND-based SR Latch using structural gate primitives
// Author: IgniteRTL Contributor

module sr_latch (
    input  wire s_n,   // Active-low Set input
    input  wire r_n,   // Active-low Reset input
    output wire q,     // Latch output Q
    output wire q_n    // Complement output Q_n
);

    // Structural feedback connection using NAND gates
    nand g1 (q, s_n, q_n);
    nand g2 (q_n, r_n, q);

endmodule
