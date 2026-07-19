`timescale 1ns / 1ps
// =============================================================================
// Project Name: IgniteRTL
// File Name:    dadda_multiplier_tb.v
// Description:  Exhaustive self-checking testbench for the 4x4 Dadda Multiplier.
//               Verifies all 256 input combinations.
//
// Author:       IgniteRTL Contributor
// Date:         2026-07-19
// Version:      1.0
// =============================================================================

module dadda_multiplier_tb;

    // Testbench signals
    reg  [3:0] tb_a;
    reg  [3:0] tb_b;
    wire [7:0] tb_product;
    
    // Tracking errors for self-checking verification
    integer errors;
    integer idx_a, idx_b;
    reg [7:0] expected_val;

    // Instantiate the Design Under Test (DUT)
    dadda_multiplier u_dadda (
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
            end
        end
    endtask

    // Stimulus generation
    initial begin
        // Initialize VCD dumping for waveform analysis
        $dumpfile("dadda_multiplier_tb.vcd");
        $dumpvars(0, dadda_multiplier_tb);

        // Initialize variables
        errors = 0;
        
        $display("==================================================");
        $display("Starting Dadda Multiplier Testbench");
        $display("==================================================");

        // Set up $monitor to track signal changes automatically
        $monitor("Time=%0dns | Monitor: a=%d b=%d | product=%d", 
                 $time, tb_a, tb_b, tb_product);

        // Exhaustive test loops
        for (idx_a = 0; idx_a < 16; idx_a = idx_a + 1) begin
            for (idx_b = 0; idx_b < 16; idx_b = idx_b + 1) begin
                tb_a = idx_a[3:0];
                tb_b = idx_b[3:0];
                check_outputs();
            end
        end

        // End simulation and report results
        #10;
        $display("==================================================");
        if (errors == 0) begin
            $display("ALL 256 TESTS PASSED EXHAUSTIVELY!");
        end else begin
            $display("TEST FAILED WITH %0d ERRORS.", errors);
        end
        $display("==================================================");
        $finish;
    end

endmodule
