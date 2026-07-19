// Module: sr_flipflop
// Description: NAND-based Master-Slave SR Flip-Flop (Positive-Edge Triggered)
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

    // Master Stage: Gated NAND SR Latch (Active when clock is low)
    nand (s_gate, s, clk_n);
    nand (r_gate, r, clk_n);
    nand (m_q, s_gate, m_q_n);
    nand (m_q_n, r_gate, m_q);

    // Slave Stage: Gated NAND SR Latch (Active when clock is high)
    nand (m_s_gate, m_q, clk);
    nand (m_r_gate, m_q_n, clk);
    nand (q, m_s_gate, q_n);
    nand (q_n, m_r_gate, q);

endmodule
