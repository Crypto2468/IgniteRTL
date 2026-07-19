`timescale 1ns / 1ps
// =============================================================================
// Project Name: IgniteRTL
// File Name:    full_adder_tb.v
// Description:  Self-checking testbench for the 1-bit Full Adder module.
//               Tests all 8 possible input combinations and verifies outputs.
//
// Author:       IgniteRTL Contributor
// Date:         2026-07-19
// Version:      1.0
// =============================================================================

module full_adder_tb;

    // Testbench signals
    reg  tb_a;
    reg  tb_b;
    reg  tb_cin;
    wire tb_sum;
    wire tb_cout;
    
    // Tracking errors for self-checking verification
    integer errors;

    // Instantiate the Design Under Test (DUT)
    full_adder u_full_adder (
        .a    (tb_a),
        .b    (tb_b),
        .cin  (tb_cin),
        .sum  (tb_sum),
        .cout (tb_cout)
    );

    // Verification task to check DUT outputs against expected logic
    task check_outputs;
        input expected_sum_val;
        input expected_cout_val;
        begin
            #1; // Wait for propagation delay
            if ((tb_sum !== expected_sum_val) || (tb_cout !== expected_cout_val)) begin
                $display("[ERROR] Time=%0dns | Input: a=%b b=%b cin=%b | Expected: sum=%b cout=%b | Got: sum=%b cout=%b", 
                         $time, tb_a, tb_b, tb_cin, expected_sum_val, expected_cout_val, tb_sum, tb_cout);
                errors = errors + 1;
            end else begin
                $display("[PASS]  Time=%0dns | Input: a=%b b=%b cin=%b | Got: sum=%b cout=%b", 
                         $time, tb_a, tb_b, tb_cin, tb_sum, tb_cout);
            end
        end
    endtask

    // Stimulus generation
    initial begin
        // Initialize VCD dumping for waveform analysis
        $dumpfile("full_adder_tb.vcd");
        $dumpvars(0, full_adder_tb);

        // Initialize variables
        errors = 0;
        
        $display("==================================================");
        $display("Starting Full Adder Testbench Simulation");
        $display("==================================================");

        // Set up $monitor to track signal changes automatically
        $monitor("Time=%0dns | Monitor: a=%b b=%b cin=%b | sum=%b cout=%b", 
                 $time, tb_a, tb_b, tb_cin, tb_sum, tb_cout);

        // Test all 8 cases
        tb_a = 1'b0; tb_b = 1'b0; tb_cin = 1'b0; check_outputs(1'b0, 1'b0);
        tb_a = 1'b0; tb_b = 1'b0; tb_cin = 1'b1; check_outputs(1'b1, 1'b0);
        tb_a = 1'b0; tb_b = 1'b1; tb_cin = 1'b0; check_outputs(1'b1, 1'b0);
        tb_a = 1'b0; tb_b = 1'b1; tb_cin = 1'b1; check_outputs(1'b0, 1'b1);
        tb_a = 1'b1; tb_b = 1'b0; tb_cin = 1'b0; check_outputs(1'b1, 1'b0);
        tb_a = 1'b1; tb_b = 1'b0; tb_cin = 1'b1; check_outputs(1'b0, 1'b1);
        tb_a = 1'b1; tb_b = 1'b1; tb_cin = 1'b0; check_outputs(1'b0, 1'b1);
        tb_a = 1'b1; tb_b = 1'b1; tb_cin = 1'b1; check_outputs(1'b1, 1'b1);

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
