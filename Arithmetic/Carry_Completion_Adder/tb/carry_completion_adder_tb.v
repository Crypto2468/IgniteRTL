`timescale 1ns / 1ps
// =============================================================================
// Project Name: IgniteRTL
// File Name:    carry_completion_adder_tb.v
// Description:  Self-checking testbench for the Carry Completion Adder.
//               Verifies self-timed carry detection, precharge/start cycles, 
//               and correctness of sums.
//
// Author:       IgniteRTL Contributor
// Date:         2026-07-19
// Version:      1.0
// =============================================================================

module carry_completion_adder_tb;

    parameter TEST_WIDTH = 8;

    // Testbench signals
    reg                   tb_start;
    reg  [TEST_WIDTH-1:0] tb_a;
    reg  [TEST_WIDTH-1:0] tb_b;
    reg                   tb_cin;
    wire [TEST_WIDTH-1:0] tb_sum;
    wire                  tb_cout;
    wire                  tb_done;
    
    // Tracking errors for self-checking verification
    integer errors;
    integer i;

    // Expected value container
    reg [TEST_WIDTH:0] expected_val;

    // Instantiate the Design Under Test (DUT)
    carry_completion_adder #(
        .WIDTH(TEST_WIDTH)
    ) u_cca (
        .start (tb_start),
        .a     (tb_a),
        .b     (tb_b),
        .cin   (tb_cin),
        .sum   (tb_sum),
        .cout  (tb_cout),
        .done  (tb_done)
    );

    // Verification task to check outputs during active evaluation
    task check_evaluation_outputs;
        begin
            #1; // Wait for propagation delay
            expected_val = tb_a + tb_b + tb_cin;
            
            // In simulation, done should settle high almost instantly
            if (tb_done !== 1'b1) begin
                $display("[ERROR] Time=%0dns | Done signal not asserted during evaluation!", $time);
                errors = errors + 1;
            end

            if ((tb_sum !== expected_val[TEST_WIDTH-1:0]) || (tb_cout !== expected_val[TEST_WIDTH])) begin
                $display("[ERROR] Time=%0dns | Input: a=%d b=%d cin=%b | Expected: sum=%d cout=%b | Got: sum=%d cout=%b", 
                         $time, tb_a, tb_b, tb_cin, expected_val[TEST_WIDTH-1:0], expected_val[TEST_WIDTH], tb_sum, tb_cout);
                errors = errors + 1;
            end else begin
                $display("[PASS]  Time=%0dns | Input: a=%d b=%d cin=%b | Got: sum=%d cout=%b done=%b", 
                         $time, tb_a, tb_b, tb_cin, tb_sum, tb_cout, tb_done);
            end
        end
    endtask

    // Stimulus generation
    initial begin
        // Initialize VCD dumping for waveform analysis
        $dumpfile("carry_completion_adder_tb.vcd");
        $dumpvars(0, carry_completion_adder_tb);

        // Initialize variables
        errors = 0;
        tb_start = 0;
        tb_a = 0;
        tb_b = 0;
        tb_cin = 0;
        
        $display("==================================================");
        $display("Starting Carry Completion Adder Testbench Simulation");
        $display("==================================================");

        // Set up $monitor to track signal changes automatically
        $monitor("Time=%0dns | Monitor: start=%b a=%d b=%d | sum=%d cout=%b done=%b", 
                 $time, tb_start, tb_a, tb_b, tb_sum, tb_cout, tb_done);

        #5;

        // Test Case 1: Start low, outputs should be cleared
        tb_a = 8'hFF; tb_b = 8'h01; tb_cin = 0;
        #1;
        if (tb_done !== 1'b0 || tb_sum !== 8'h00 || tb_cout !== 1'b0) begin
            $display("[ERROR] Time=%0dns | Outputs not cleared when start=0!", $time);
            errors = errors + 1;
        end else begin
            $display("[PASS]  Time=%0dns | Correctly cleared state when start=0", $time);
        end

        // Test Case 2: Transition start high, check computation
        tb_start = 1;
        check_evaluation_outputs();

        // Return to clear state
        #5;
        tb_start = 0;
        #1;

        // Test Case 3: Simple values
        tb_a = 8'h0F; tb_b = 8'h0F; tb_cin = 1;
        #5;
        tb_start = 1;
        check_evaluation_outputs();

        // Return to clear state
        #5;
        tb_start = 0;
        #1;

        // Test Case 4: Directed Random Cases
        for (i = 0; i < 15; i = i + 1) begin
            tb_a = $random % 256;
            tb_b = $random % 256;
            tb_cin = $random % 2;
            #5;
            tb_start = 1;
            check_evaluation_outputs();
            #5;
            tb_start = 0;
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
