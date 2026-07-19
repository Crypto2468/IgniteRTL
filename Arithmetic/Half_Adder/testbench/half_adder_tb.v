`timescale 1ns / 1ps
// =============================================================================
// Project Name: IgniteRTL
// File Name:    half_adder_tb.v
// Description:  Self-checking testbench for the 1-bit Half Adder module.
//               Tests all possible combinations of inputs and verifies sum
//               and carry-out outputs.
//
// Author:       IgniteRTL Contributor
// Date:         2026-07-19
// Version:      1.0
// =============================================================================

module half_adder_tb;

    // Testbench signals
    reg  tb_a;
    reg  tb_b;
    wire tb_sum;
    wire tb_co;
    
    // Tracking errors for self-checking verification
    integer errors;

    // Instantiate the Design Under Test (DUT)
    half_adder u_half_adder (
        .a   (tb_a),
        .b   (tb_b),
        .sum (tb_sum),
        .co  (tb_co)
    );

    // Verification task to check DUT outputs against expected logic
    task check_outputs;
        input expected_sum_val;
        input expected_co_val;
        begin
            #1; // Wait for propagation delay
            if ((tb_sum !== expected_sum_val) || (tb_co !== expected_co_val)) begin
                $display("[ERROR] Time=%0dns | Input: a=%b b=%b | Expected: sum=%b co=%b | Got: sum=%b co=%b", 
                         $time, tb_a, tb_b, expected_sum_val, expected_co_val, tb_sum, tb_co);
                errors = errors + 1;
            end else begin
                $display("[PASS]  Time=%0dns | Input: a=%b b=%b | Got: sum=%b co=%b", 
                         $time, tb_a, tb_b, tb_sum, tb_co);
            end
        end
    endtask

    // Stimulus generation
    initial begin
        // Initialize VCD dumping for waveform analysis
        $dumpfile("half_adder_tb.vcd");
        $dumpvars(0, half_adder_tb);

        // Initialize variables
        errors = 0;
        
        $display("==================================================");
        $display("Starting Half Adder Testbench Simulation");
        $display("==================================================");

        // Set up $monitor to track signal changes automatically
        $monitor("Time=%0dns | Monitor: a=%b b=%b | sum=%b co=%b", 
                 $time, tb_a, tb_b, tb_sum, tb_co);

        // Test Case 1: 0 + 0 = 0 (sum=0, co=0)
        tb_a = 1'b0; tb_b = 1'b0;
        check_outputs(1'b0, 1'b0);

        // Test Case 2: 0 + 1 = 1 (sum=1, co=0)
        tb_a = 1'b0; tb_b = 1'b1;
        check_outputs(1'b1, 1'b0);

        // Test Case 3: 1 + 0 = 1 (sum=1, co=0)
        tb_a = 1'b1; tb_b = 1'b0;
        check_outputs(1'b1, 1'b0);

        // Test Case 4: 1 + 1 = 2 (sum=0, co=1)
        tb_a = 1'b1; tb_b = 1'b1;
        check_outputs(1'b0, 1'b1);

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
