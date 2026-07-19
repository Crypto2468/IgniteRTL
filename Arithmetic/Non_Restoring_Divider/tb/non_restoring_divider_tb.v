`timescale 1ns / 1ps
// =============================================================================
// Project Name: IgniteRTL
// File Name:    non_restoring_divider_tb.v
// Description:  Self-checking testbench for the sequential Non-Restoring Divider.
//               Verifies quotient, remainder, and division-by-zero detection.
//
// Author:       IgniteRTL Contributor
// Date:         2026-07-19
// Version:      1.0
// =============================================================================

module non_restoring_divider_tb;

    parameter TEST_WIDTH = 8;

    // Testbench signals
    reg                   tb_clk;
    reg                   tb_rst_n;
    reg                   tb_start;
    reg  [TEST_WIDTH-1:0] tb_dividend;
    reg  [TEST_WIDTH-1:0] tb_divisor;
    wire [TEST_WIDTH-1:0] tb_quotient;
    wire [TEST_WIDTH-1:0] tb_remainder;
    wire                  tb_ready;
    wire                  tb_done;
    wire                  tb_div_by_zero;
    
    // Tracking errors for self-checking verification
    integer errors;
    integer i;

    // Expected value containers
    reg [TEST_WIDTH-1:0] expected_quotient;
    reg [TEST_WIDTH-1:0] expected_remainder;

    // Instantiate the Design Under Test (DUT)
    non_restoring_divider #(
        .WIDTH(TEST_WIDTH)
    ) u_divider (
        .clk         (tb_clk),
        .rst_n       (tb_rst_n),
        .start       (tb_start),
        .dividend    (tb_dividend),
        .divisor     (tb_divisor),
        .quotient    (tb_quotient),
        .remainder   (tb_remainder),
        .ready       (tb_ready),
        .done        (tb_done),
        .div_by_zero (tb_div_by_zero)
    );

    // Clock generation (100MHz clock)
    always #5 tb_clk = ~tb_clk;

    // Task to run a single division transaction
    task run_division;
        input [TEST_WIDTH-1:0] dividend_val;
        input [TEST_WIDTH-1:0] divisor_val;
        begin
            // Wait until device is ready
            while (!tb_ready) begin
                @(posedge tb_clk);
            end

            // Apply operands
            tb_dividend = dividend_val;
            tb_divisor  = divisor_val;
            tb_start    = 1'b1;
            
            @(posedge tb_clk);
            tb_start = 1'b0; // De-assert start

            // Wait for completion
            while (!tb_done) begin
                @(posedge tb_clk);
            end

            // Verify result
            #1; // Delay slightly to settle
            if (divisor_val == 0) begin
                if (!tb_div_by_zero) begin
                    $display("[ERROR] Time=%0dns | Expected div_by_zero flag high for divisor=0!", $time);
                    errors = errors + 1;
                end else begin
                    $display("[PASS]  Time=%0dns | Detected Division by Zero successfully!", $time);
                end
            end else begin
                expected_quotient  = dividend_val / divisor_val;
                expected_remainder = dividend_val % divisor_val;
                if ((tb_quotient !== expected_quotient) || (tb_remainder !== expected_remainder) || tb_div_by_zero) begin
                    $display("[ERROR] Time=%0dns | Input: %d / %d | Expected: Q=%d R=%d | Got: Q=%d R=%d div_by_zero=%b", 
                             $time, tb_dividend, tb_divisor, expected_quotient, expected_remainder, tb_quotient, tb_remainder, tb_div_by_zero);
                    errors = errors + 1;
                end else begin
                    $display("[PASS]  Time=%0dns | Input: %d / %d | Got: Q=%d R=%d", 
                             $time, tb_dividend, tb_divisor, tb_quotient, tb_remainder);
                end
            end
            @(posedge tb_clk);
        end
    endtask

    // Stimulus generation
    initial begin
        // Initialize VCD dumping for waveform analysis
        $dumpfile("non_restoring_divider_tb.vcd");
        $dumpvars(0, non_restoring_divider_tb);

        // Initialize variables
        tb_clk   = 1'b0;
        tb_rst_n = 1'b0;
        tb_start = 1'b0;
        tb_dividend = 0;
        tb_divisor  = 0;
        errors   = 0;
        
        $display("==================================================");
        $display("Starting Non-Restoring Divider Testbench Simulation");
        $display("==================================================");

        // Set up $monitor to track signal changes automatically
        $monitor("Time=%0dns | Monitor: ready=%b done=%b div_by_zero=%b dividend=%d divisor=%d Q=%d R=%d", 
                 $time, tb_ready, tb_done, tb_div_by_zero, tb_dividend, tb_divisor, tb_quotient, tb_remainder);

        // Apply Reset
        #12;
        tb_rst_n = 1'b1;
        #10;

        // Test Case 1: Division by Zero
        run_division(8'd80, 8'd0);

        // Test Case 2: Dividend smaller than divisor
        run_division(8'd6, 8'd12);

        // Test Case 3: Exact division
        run_division(8'd120, 8'd12);

        // Test Case 4: Non-exact division
        run_division(8'd99, 8'd4);

        // Test Case 5: Max limits
        run_division(8'hFF, 8'd3);

        // Test Case 6: Random Cases
        for (i = 0; i < 15; i = i + 1) begin
            run_division($random % 256, ($random % 255) + 1);
        end

        // End simulation and report results
        #20;
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
