`timescale 1ns / 1ps
// =============================================================================
// Project Name: IgniteRTL
// File Name:    full_subtractor_tb.v
// Description:  Self-checking testbench for the 1-bit Full Subtractor module.
//               Tests all 8 possible input combinations and verifies outputs.
//
// Author:       IgniteRTL Contributor
// Date:         2026-07-19
// Version:      1.0
// =============================================================================

module full_subtractor_tb;

    // Testbench signals
    reg  tb_a;
    reg  tb_b;
    reg  tb_bin;
    wire tb_diff;
    wire tb_bout;
    
    // Tracking errors for self-checking verification
    integer errors;

    // Instantiate the Design Under Test (DUT)
    full_subtractor u_full_subtractor (
        .a    (tb_a),
        .b    (tb_b),
        .bin  (tb_bin),
        .diff (tb_diff),
        .bout (tb_bout)
    );

    // Verification task to check DUT outputs against expected logic
    task check_outputs;
        input expected_diff_val;
        input expected_bout_val;
        begin
            #1; // Wait for propagation delay
            if ((tb_diff !== expected_diff_val) || (tb_bout !== expected_bout_val)) begin
                $display("[ERROR] Time=%0dns | Input: a=%b b=%b bin=%b | Expected: diff=%b bout=%b | Got: diff=%b bout=%b", 
                         $time, tb_a, tb_b, tb_bin, expected_diff_val, expected_bout_val, tb_diff, tb_bout);
                errors = errors + 1;
            end else begin
                $display("[PASS]  Time=%0dns | Input: a=%b b=%b bin=%b | Got: diff=%b bout=%b", 
                         $time, tb_a, tb_b, tb_bin, tb_diff, tb_bout);
            end
        end
    endtask

    // Stimulus generation
    initial begin
        // Initialize VCD dumping for waveform analysis
        $dumpfile("full_subtractor_tb.vcd");
        $dumpvars(0, full_subtractor_tb);

        // Initialize variables
        errors = 0;
        
        $display("==================================================");
        $display("Starting Full Subtractor Testbench Simulation");
        $display("==================================================");

        // Set up $monitor to track signal changes automatically
        $monitor("Time=%0dns | Monitor: a=%b b=%b bin=%b | diff=%b bout=%b", 
                 $time, tb_a, tb_b, tb_bin, tb_diff, tb_bout);

        // Test all 8 cases
        tb_a = 1'b0; tb_b = 1'b0; tb_bin = 1'b0; check_outputs(1'b0, 1'b0);
        tb_a = 1'b0; tb_b = 1'b0; tb_bin = 1'b1; check_outputs(1'b1, 1'b1);
        tb_a = 1'b0; tb_b = 1'b1; tb_bin = 1'b0; check_outputs(1'b1, 1'b1);
        tb_a = 1'b0; tb_b = 1'b1; tb_bin = 1'b1; check_outputs(1'b0, 1'b1);
        tb_a = 1'b1; tb_b = 1'b0; tb_bin = 1'b0; check_outputs(1'b1, 1'b0);
        tb_a = 1'b1; tb_b = 1'b0; tb_bin = 1'b1; check_outputs(1'b0, 1'b0);
        tb_a = 1'b1; tb_b = 1'b1; tb_bin = 1'b0; check_outputs(1'b0, 1'b0);
        tb_a = 1'b1; tb_b = 1'b1; tb_bin = 1'b1; check_outputs(1'b1, 1'b1);

        // End simulation and report results
        #10;
        $display("==================================================");
        if (errors == 0) begin
            $display("ALL TESTS PASSED SUCCESSFULLY!");
        end else begin
            $display("TEST FAILED WITH %0d ERRORS.", errors);
        end
        $display("==================================================");
        $finish;
    end

endmodule
