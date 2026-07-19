// Module: sr_latch
// Description: NOR-based SR Latch using structural gate primitives
// Author: IgniteRTL Contributor

module sr_latch (
    input  wire s,   // Set input
    input  wire r,   // Reset input
    output wire q,   // Latch output Q
    output wire q_n  // Complement output Q_n
);

    // Structural feedback connection using NOR gates
    nor g1 (q, r, q_n);
    nor g2 (q_n, s, q);

endmodule
