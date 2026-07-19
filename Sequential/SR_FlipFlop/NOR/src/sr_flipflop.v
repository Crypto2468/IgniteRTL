// Module: sr_flipflop
// Description: NOR-based Master-Slave SR Flip-Flop (Positive-Edge Triggered)
// Author: IgniteRTL Contributor

module sr_flipflop (
    input  wire clk,   // Clock input
    input  wire s,     // Set input
    input  wire r,     // Reset input
    output wire q,     // Output Q
    output wire q_n    // Complement output Q_n
);

    wire clk_n;
    wire m_q, m_q_n;
    wire s_gate, r_gate;
    wire m_s_gate, m_r_gate;

    // Clock inverter
    not (clk_n, clk);

    // Master Stage: Gated NOR SR Latch (Active when clock is low)
    and (s_gate, s, clk_n);
    and (r_gate, r, clk_n);
    nor (m_q, r_gate, m_q_n);
    nor (m_q_n, s_gate, m_q);

    // Slave Stage: Gated NOR SR Latch (Active when clock is high)
    and (m_s_gate, m_q, clk);
    and (m_r_gate, m_q_n, clk);
    nor (q, m_r_gate, q_n);
    nor (q_n, m_s_gate, q);

endmodule
