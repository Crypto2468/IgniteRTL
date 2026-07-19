`timescale 1ns / 1ps
// =============================================================================
// Project Name: IgniteRTL
// File Name:    carry_lookahead_adder_tb.v
// Description:  Exhaustive self-checking testbench for the 4-bit Carry Lookahead 
//               Adder. Tests all 512 input combinations and verifies outputs.
//
// Author:       IgniteRTL Contributor
// Date:         2026-07-19
// Version:      1.0
// =============================================================================

module carry_lookahead_adder_tb;

    // Testbench signals
    reg  [3:0] tb_a;
    reg  [3:0] tb_b;
    reg        tb_cin;
    wire [3:0] tb_sum;
    wire       tb_cout;
    wire       tb_pg;
    wire       tb_gg;
    
    // Tracking errors for self-checking verification
    integer errors;
    
    // Loop counters and expected calculations
    integer idx_a, idx_b, idx_cin;
    reg [4:0] expected_val;
    reg expected_pg;
    reg expected_gg;
    reg [3:0] p_term;
    reg [3:0] g_term;

    // Instantiate the Design Under Test (DUT)
    carry_lookahead_adder u_cla (
        .a    (tb_a),
        .b    (tb_b),
        .cin  (tb_cin),
        .sum  (tb_sum),
        .cout (tb_cout),
        .pg   (tb_pg),
        .gg   (tb_gg)
    );

    // Verification task to check outputs
    task check_outputs;
        begin
            #1; // Wait for propagation delay
            expected_val = tb_a + tb_b + tb_cin;
            
            // Recompute PG and GG expectations
            p_term = tb_a ^ tb_b;
            g_term = tb_a & tb_b;
            expected_pg = &p_term;
            expected_gg = g_term[3] | 
                          (p_term[3] & g_term[2]) | 
                          (p_term[3] & p_term[2] & g_term[1]) | 
                          (p_term[3] & p_term[2] & p_term[1] & g_term[0]);

            if ((tb_sum !== expected_val[3:0]) || 
                (tb_cout !== expected_val[4]) || 
                (tb_pg !== expected_pg) || 
                (tb_gg !== expected_gg)) begin
                $display("[ERROR] Time=%0dns | Input: a=%d b=%d cin=%b | Got: sum=%d cout=%b pg=%b gg=%b | Expected: sum=%d cout=%b pg=%b gg=%b", 
                         $time, tb_a, tb_b, tb_cin, tb_sum, tb_cout, tb_pg, tb_gg, expected_val[3:0], expected_val[4], expected_pg, expected_gg);
                errors = errors + 1;
            end
        end
    endtask

    // Stimulus generation
    initial begin
        // Initialize VCD dumping for waveform analysis
        $dumpfile("carry_lookahead_adder_tb.vcd");
        $dumpvars(0, carry_lookahead_adder_tb);

        // Initialize variables
        errors = 0;
        
        $display("==================================================");
        $display("Starting Carry Lookahead Adder Testbench Simulation");
        $display("==================================================");

        // Set up $monitor to track signal changes automatically
        $monitor("Time=%0dns | Monitor: a=%d b=%d cin=%b | sum=%d cout=%b pg=%b gg=%b", 
                 $time, tb_a, tb_b, tb_cin, tb_sum, tb_cout, tb_pg, tb_gg);

        // Exhaustive verification loops
        for (idx_cin = 0; idx_cin < 2; idx_cin = idx_cin + 1) begin
            for (idx_a = 0; idx_a < 16; idx_a = idx_a + 1) begin
                for (idx_b = 0; idx_b < 16; idx_b = idx_b + 1) begin
                    tb_cin = idx_cin[0];
                    tb_a   = idx_a[3:0];
                    tb_b   = idx_b[3:0];
                    check_outputs();
                end
            end
        end

        // End simulation and report results
        #10;
        $display("==================================================");
        if (errors == 0) begin
            $display("ALL 512 TESTS PASSED EXHAUSTIVELY!");
        end else begin
            $display("TEST FAILED WITH %0d ERRORS.", errors);
        end
        $display("==================================================");
        $finish;
    end

endmodule
