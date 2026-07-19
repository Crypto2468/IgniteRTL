`timescale 1ns / 1ps
// =============================================================================
// Project Name: IgniteRTL
// File Name:    carry_save_adder_tb.v
// Description:  Self-checking testbench for the Carry Save Adder module.
//               Verifies that sum + (carry << 1) equals the addition of the 
//               three operands (a + b + c).
//
// Author:       IgniteRTL Contributor
// Date:         2026-07-19
// Version:      1.0
// =============================================================================

module carry_save_adder_tb;

    parameter TEST_WIDTH = 8;

    // Testbench signals
    reg  [TEST_WIDTH-1:0] tb_a;
    reg  [TEST_WIDTH-1:0] tb_b;
    reg  [TEST_WIDTH-1:0] tb_c;
    wire [TEST_WIDTH-1:0] tb_sum;
    wire [TEST_WIDTH-1:0] tb_carry;
    
    // Tracking errors for self-checking verification
    integer errors;
    integer i;

    // Reconstructed total sum variables
    reg [TEST_WIDTH+1:0] expected_sum;
    reg [TEST_WIDTH+1:0] actual_sum;

    // Instantiate the Design Under Test (DUT)
    carry_save_adder #(
        .WIDTH(TEST_WIDTH)
    ) u_csa (
        .a     (tb_a),
        .b     (tb_b),
        .c     (tb_c),
        .sum   (tb_sum),
        .carry (tb_carry)
    );

    // Verification task to check DUT outputs against expected logic
    task check_outputs;
        begin
            #1; // Wait for propagation delay
            expected_sum = tb_a + tb_b + tb_c;
            // Reconstruct the actual sum: sum + (carry << 1)
            actual_sum = tb_sum + (tb_carry << 1);

            // Compare up to WIDTH+1 bits (since adding 3 N-bit values can overflow by 2 bits)
            if (actual_sum[TEST_WIDTH:0] !== expected_sum[TEST_WIDTH:0]) begin
                $display("[ERROR] Time=%0dns | Input: a=%d b=%d c=%d | Expected: %d | Got: sum=%d carry=%d (Reconstructed: %d)", 
                         $time, tb_a, tb_b, tb_c, expected_sum[TEST_WIDTH:0], tb_sum, tb_carry, actual_sum[TEST_WIDTH:0]);
                errors = errors + 1;
            end else begin
                $display("[PASS]  Time=%0dns | Input: a=%d b=%d c=%d | Reconstructed: %d", 
                         $time, tb_a, tb_b, tb_c, actual_sum[TEST_WIDTH:0]);
            end
        end
    endtask

    // Stimulus generation
    initial begin
        // Initialize VCD dumping for waveform analysis
        $dumpfile("carry_save_adder_tb.vcd");
        $dumpvars(0, carry_save_adder_tb);

        // Initialize variables
        errors = 0;
        
        $display("==================================================");
        $display("Starting Carry Save Adder Testbench Simulation");
        $display("==================================================");

        // Set up $monitor to track signal changes automatically
        $monitor("Time=%0dns | Monitor: a=%d b=%d c=%d | sum=%d carry=%d", 
                 $time, tb_a, tb_b, tb_c, tb_sum, tb_carry);

        // Test Case 1: All Zeros
        tb_a = 0; tb_b = 0; tb_c = 0; check_outputs();

        // Test Case 2: Maximum Values
        tb_a = {TEST_WIDTH{1'b1}}; tb_b = {TEST_WIDTH{1'b1}}; tb_c = {TEST_WIDTH{1'b1}}; check_outputs();

        // Test Case 3: Alternating Patterns
        tb_a = 8'h55; tb_b = 8'hAA; tb_c = 8'hFF; check_outputs();

        // Test Case 4: Directed Random Cases
        for (i = 0; i < 20; i = i + 1) begin
            tb_a = $random % (2**TEST_WIDTH);
            tb_b = $random % (2**TEST_WIDTH);
            tb_c = $random % (2**TEST_WIDTH);
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
