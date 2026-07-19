`timescale 1ns / 1ps
// =============================================================================
// Project Name: IgniteRTL
// File Name:    carry_increment_adder_tb.v
// Description:  Self-checking testbench for the 8-bit Carry Increment Adder.
//               Tests all edge cases (incrementer trigger, raw overflow, randoms).
//
// Author:       IgniteRTL Contributor
// Date:         2026-07-19
// Version:      1.0
// =============================================================================

module carry_increment_adder_tb;

    // Testbench signals
    reg  [7:0] tb_a;
    reg  [7:0] tb_b;
    reg        tb_cin;
    wire [7:0] tb_sum;
    wire       tb_cout;
    
    // Tracking errors for self-checking verification
    integer errors;
    integer i;

    // Expected value container
    reg [8:0] expected_val;

    // Instantiate the Design Under Test (DUT)
    carry_increment_adder u_cia (
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
            expected_val = tb_a + tb_b + tb_cin;
            if ((tb_sum !== expected_val[7:0]) || (tb_cout !== expected_val[8])) begin
                $display("[ERROR] Time=%0dns | Input: a=%d b=%d cin=%b | Expected: sum=%d cout=%b | Got: sum=%d cout=%b", 
                         $time, tb_a, tb_b, tb_cin, expected_val[7:0], expected_val[8], tb_sum, tb_cout);
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
        $dumpfile("carry_increment_adder_tb.vcd");
        $dumpvars(0, carry_increment_adder_tb);

        // Initialize variables
        errors = 0;
        
        $display("==================================================");
        $display("Starting Carry Increment Adder Testbench Simulation");
        $display("==================================================");

        // Set up $monitor to track signal changes automatically
        $monitor("Time=%0dns | Monitor: a=%d b=%d cin=%b | sum=%d cout=%b", 
                 $time, tb_a, tb_b, tb_cin, tb_sum, tb_cout);

        // Test Case 1: Zero addition
        tb_a = 8'h00; tb_b = 8'h00; tb_cin = 0; check_outputs();

        // Test Case 2: Lower block carry-out triggers incrementer (15 + 1)
        tb_a = 8'h0F; tb_b = 8'h01; tb_cin = 0; check_outputs(); // sum=16 (sum_low=0, sum_high_raw=1, incremented to 1)

        // Test Case 3: Upper block overflow with cin=0 (240 + 16)
        tb_a = 8'hF0; tb_b = 8'h10; tb_cin = 0; check_outputs(); // expects sum=0, cout=1

        // Test Case 4: Upper block overflow with incrementer trigger (255 + 1)
        tb_a = 8'hFF; tb_b = 8'h01; tb_cin = 0; check_outputs(); // expects sum=0, cout=1

        // Test Case 5: Alternating bits
        tb_a = 8'h55; tb_b = 8'hAA; tb_cin = 1; check_outputs(); // expects sum=0, cout=1

        // Test Case 6: Directed Random Cases
        for (i = 0; i < 20; i = i + 1) begin
            tb_a = $random % 256;
            tb_b = $random % 256;
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
