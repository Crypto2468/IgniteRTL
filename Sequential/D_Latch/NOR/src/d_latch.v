// Module: d_latch
// Description: NOR-based Gated D Latch using structural gate primitives
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

    // Gating stages (AND)
    and (s_gate, d, en);
    and (r_gate, d_n, en);

    // Cross-coupled NOR latch
    nor (q, r_gate, q_n);
    nor (q_n, s_gate, q);

endmodule
