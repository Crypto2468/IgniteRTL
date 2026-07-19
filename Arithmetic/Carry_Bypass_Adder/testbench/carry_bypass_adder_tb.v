`timescale 1ns / 1ps
// =============================================================================
// Project Name: IgniteRTL
// File Name:    carry_bypass_adder_tb.v
// Description:  Self-checking testbench for the 16-bit Carry Bypass Adder.
//               Verifies sum and carry-out logic, targeting multi-block bypass conditions.
//
// Author:       IgniteRTL Contributor
// Date:         2026-07-19
// Version:      1.0
// =============================================================================

module carry_bypass_adder_tb;

    // Testbench signals
    reg  [15:0] tb_a;
    reg  [15:0] tb_b;
    reg         tb_cin;
    wire [15:0] tb_sum;
    wire        tb_cout;
    
    // Tracking errors for self-checking verification
    integer errors;
    integer i;

    // Expected value container
    reg [16:0] expected_val;

    // Instantiate the Design Under Test (DUT)
    carry_bypass_adder u_cba (
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
            if ((tb_sum !== expected_val[15:0]) || (tb_cout !== expected_val[16])) begin
                $display("[ERROR] Time=%0dns | Input: a=%d b=%d cin=%b | Expected: sum=%d cout=%b | Got: sum=%d cout=%b", 
                         $time, tb_a, tb_b, tb_cin, expected_val[15:0], expected_val[16], tb_sum, tb_cout);
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
        $dumpfile("carry_bypass_adder_tb.vcd");
        $dumpvars(0, carry_bypass_adder_tb);

        // Initialize variables
        errors = 0;
        
        $display("==================================================");
        $display("Starting Carry Bypass Adder Testbench Simulation");
        $display("==================================================");

        // Set up $monitor to track signal changes automatically
        $monitor("Time=%0dns | Monitor: a=%d b=%d cin=%b | sum=%d cout=%b", 
                 $time, tb_a, tb_b, tb_cin, tb_sum, tb_cout);

        // Test Case 1: All Zeros
        tb_a = 16'h0000; tb_b = 16'h0000; tb_cin = 0; check_outputs();

        // Test Case 2: Multi-block Bypass (all blocks satisfy propagate condition)
        // a = 16'hAAAA, b = 16'h5555 -> a ^ b = 16'hFFFF (all bits propagate)
        // cin = 1, should bypass all blocks to cout immediately
        tb_a = 16'hAAAA; tb_b = 16'h5555; tb_cin = 1; check_outputs(); // 0xAAAA + 0x5555 + 1 = 0x10000 (sum=0, cout=1)

        // Test Case 3: Block 0 skips but Block 1 ripples
        // Block 0: a^b = 4'hF, Block 1: a^b = 4'h0
        tb_a = 16'h000A; tb_b = 16'h0005; tb_cin = 1; check_outputs();

        // Test Case 4: Max Addition (0xFFFF + 0xFFFF + 1)
        tb_a = 16'hFFFF; tb_b = 16'hFFFF; tb_cin = 1; check_outputs();

        // Test Case 5: Directed Random Cases
        for (i = 0; i < 20; i = i + 1) begin
            tb_a = $random % 65536;
            tb_b = $random % 65536;
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
