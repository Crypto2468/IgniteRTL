`timescale 1ns / 1ps
// =============================================================================
// Project Name: IgniteRTL
// File Name:    ripple_carry_adder_tb.v
// Description:  Self-checking testbench for the parameterized Ripple Carry Adder.
//               Tests corner cases and random test vectors.
//
// Author:       IgniteRTL Contributor
// Date:         2026-07-19
// Version:      1.0
// =============================================================================

module ripple_carry_adder_tb;

    // Define width for testbench instance
    parameter TEST_WIDTH = 8;

    // Testbench signals
    reg  [TEST_WIDTH-1:0] tb_a;
    reg  [TEST_WIDTH-1:0] tb_b;
    reg                   tb_cin;
    wire [TEST_WIDTH-1:0] tb_sum;
    wire                  tb_cout;
    
    // Tracking errors for self-checking verification
    integer errors;
    
    // Auxiliary variables for verification
    reg  [TEST_WIDTH:0] expected_full_sum;
    integer i;

    // Instantiate the Design Under Test (DUT)
    ripple_carry_adder #(
        .WIDTH(TEST_WIDTH)
    ) u_rca (
        .a    (tb_a),
        .b    (tb_b),
        .cin  (tb_cin),
        .sum  (tb_sum),
        .cout (tb_cout)
    );

    // Verification task to check DUT outputs against expected logic
    task check_outputs;
        begin
            #1; // Wait for propagation delay
            expected_full_sum = tb_a + tb_b + tb_cin;
            if ((tb_sum !== expected_full_sum[TEST_WIDTH-1:0]) || (tb_cout !== expected_full_sum[TEST_WIDTH])) begin
                $display("[ERROR] Time=%0dns | Input: a=%d b=%d cin=%b | Expected: sum=%d cout=%b | Got: sum=%d cout=%b", 
                         $time, tb_a, tb_b, tb_cin, expected_full_sum[TEST_WIDTH-1:0], expected_full_sum[TEST_WIDTH], tb_sum, tb_cout);
                errors = errors + 1;
            end else begin
                $display("[PASS]  Time=%0dns | Input: a=%d b=%d cin=%b | Got: sum=%d cout=%b", 
                         $time, tb_a, tb_b, tb_cin, tb_sum, tb_cout);
            end
        end
    endtask

    // Stimulus generation
    initial begin
        // Initialize VCD dumping for waveform analysis
        $dumpfile("ripple_carry_adder_tb.vcd");
        $dumpvars(0, ripple_carry_adder_tb);

        // Initialize variables
        errors = 0;
        
        $display("==================================================");
        $display("Starting Ripple Carry Adder Testbench Simulation");
        $display("==================================================");

        // Set up $monitor to track signal changes automatically
        $monitor("Time=%0dns | Monitor: a=%d b=%d cin=%b | sum=%d cout=%b", 
                 $time, tb_a, tb_b, tb_cin, tb_sum, tb_cout);

        // Test Case 1: Adding Zeros
        tb_a = 0; tb_b = 0; tb_cin = 0; check_outputs();

        // Test Case 2: Adding Max Values without Carry-in
        tb_a = {TEST_WIDTH{1'b1}}; tb_b = {TEST_WIDTH{1'b1}}; tb_cin = 0; check_outputs();

        // Test Case 3: Adding Max Values with Carry-in
        tb_a = {TEST_WIDTH{1'b1}}; tb_b = {TEST_WIDTH{1'b1}}; tb_cin = 1; check_outputs();

        // Test Case 4: Alternating bit patterns
        tb_a = 8'h55; tb_b = 8'hAA; tb_cin = 0; check_outputs();
        tb_a = 8'h55; tb_b = 8'hAA; tb_cin = 1; check_outputs();

        // Test Case 5: Directed random-style cases
        for (i = 0; i < 15; i = i + 1) begin
            tb_a = $random % (2**TEST_WIDTH);
            tb_b = $random % (2**TEST_WIDTH);
            tb_cin = $random % 2;
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
