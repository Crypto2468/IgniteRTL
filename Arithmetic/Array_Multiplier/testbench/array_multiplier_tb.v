`timescale 1ns / 1ps
// =============================================================================
// Project Name: IgniteRTL
// File Name:    array_multiplier_tb.v
// Description:  Self-checking testbench for the combinational Array Multiplier.
//               Tests multiple combinations, verifying against behavioral multiplication.
//
// Author:       IgniteRTL Contributor
// Date:         2026-07-19
// Version:      1.0
// =============================================================================

module array_multiplier_tb;

    parameter TEST_WIDTH = 8;

    // Testbench signals
    reg  [TEST_WIDTH-1:0]   tb_a;
    reg  [TEST_WIDTH-1:0]   tb_b;
    wire [2*TEST_WIDTH-1:0] tb_product;
    
    // Tracking errors for self-checking verification
    integer errors;
    integer i;

    // Expected value container
    reg [2*TEST_WIDTH-1:0] expected_val;

    // Instantiate the Design Under Test (DUT)
    array_multiplier #(
        .WIDTH(TEST_WIDTH)
    ) u_array_mult (
        .a       (tb_a),
        .b       (tb_b),
        .product (tb_product)
    );

    // Verification task to check DUT outputs against expected logic
    task check_outputs;
        begin
            #1; // Wait for propagation delay
            expected_val = tb_a * tb_b;
            if (tb_product !== expected_val) begin
                $display("[ERROR] Time=%0dns | Input: a=%d b=%d | Expected: %d | Got: %d", 
                         $time, tb_a, tb_b, expected_val, tb_product);
                errors = errors + 1;
            end else begin
                $display("[PASS]  Time=%0dns | Input: a=%d b=%d | Got: %d", 
                         $time, tb_a, tb_b, tb_product);
            end
        end
    endtask

    // Stimulus generation
    initial begin
        // Initialize VCD dumping for waveform analysis
        $dumpfile("array_multiplier_tb.vcd");
        $dumpvars(0, array_multiplier_tb);

        // Initialize variables
        errors = 0;
        
        $display("==================================================");
        $display("Starting Array Multiplier Testbench Simulation");
        $display("==================================================");

        // Set up $monitor to track signal changes automatically
        $monitor("Time=%0dns | Monitor: a=%d b=%d | product=%d", 
                 $time, tb_a, tb_b, tb_product);

        // Test Case 1: Zero inputs
        tb_a = 0; tb_b = 0; check_outputs();
        tb_a = 50; tb_b = 0; check_outputs();
        tb_a = 0; tb_b = 120; check_outputs();

        // Test Case 2: Unity inputs
        tb_a = 1; tb_b = 25; check_outputs();
        tb_a = 135; tb_b = 1; check_outputs();

        // Test Case 3: Standard arithmetic
        tb_a = 15; tb_b = 15; check_outputs();
        tb_a = 32; tb_b = 16; check_outputs();

        // Test Case 4: Maximum boundary (255 * 255)
        tb_a = 8'hFF; tb_b = 8'hFF; check_outputs();

        // Test Case 5: Directed Random Cases
        for (i = 0; i < 20; i = i + 1) begin
            tb_a = $random % 256;
            tb_b = $random % 256;
            check_outputs();
        end

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
