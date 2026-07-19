`timescale 1ns / 1ps
// =============================================================================
// Project Name: IgniteRTL
// File Name:    binary_multiplier_tb.v
// Description:  Self-checking testbench for the sequential Binary Multiplier.
//               Generates clock and reset, applies transaction testcases.
//
// Author:       IgniteRTL Contributor
// Date:         2026-07-19
// Version:      1.0
// =============================================================================

module binary_multiplier_tb;

    parameter TEST_WIDTH = 8;

    // Testbench signals
    reg                     tb_clk;
    reg                     tb_rst_n;
    reg                     tb_start;
    reg  [TEST_WIDTH-1:0]   tb_a;
    reg  [TEST_WIDTH-1:0]   tb_b;
    wire [2*TEST_WIDTH-1:0] tb_product;
    wire                    tb_ready;
    wire                    tb_done;
    
    // Tracking errors for self-checking verification
    integer errors;
    integer i;

    // Expected value container
    reg [2*TEST_WIDTH-1:0] expected_val;

    // Instantiate the Design Under Test (DUT)
    binary_multiplier #(
        .WIDTH(TEST_WIDTH)
    ) u_mult (
        .clk     (tb_clk),
        .rst_n   (tb_rst_n),
        .start   (tb_start),
        .a       (tb_a),
        .b       (tb_b),
        .product (tb_product),
        .ready   (tb_ready),
        .done    (tb_done)
    );

    // Clock generation (100MHz clock)
    always #5 tb_clk = ~tb_clk;

    // Task to run a single multiplication transaction
    task run_multiplication;
        input [TEST_WIDTH-1:0] a_val;
        input [TEST_WIDTH-1:0] b_val;
        begin
            // Wait until device is ready
            while (!tb_ready) begin
                @(posedge tb_clk);
            end

            // Apply operands
            tb_a     = a_val;
            tb_b     = b_val;
            tb_start = 1'b1;
            
            @(posedge tb_clk);
            tb_start = 1'b0; // De-assert start on next cycle

            // Wait for completion
            while (!tb_done) begin
                @(posedge tb_clk);
            end

            // Verify result
            expected_val = tb_a * tb_b;
            #1; // Delay slightly to settle
            if (tb_product !== expected_val) begin
                $display("[ERROR] Time=%0dns | Input: a=%d b=%d | Expected Product=%d | Got=%d", 
                         $time, tb_a, tb_b, expected_val, tb_product);
                errors = errors + 1;
            end else begin
                $display("[PASS]  Time=%0dns | Input: a=%d b=%d | Product=%d", 
                         $time, tb_a, tb_b, tb_product);
            end
            @(posedge tb_clk);
        end
    endtask

    // Stimulus generation
    initial begin
        // Initialize VCD dumping for waveform analysis
        $dumpfile("binary_multiplier_tb.vcd");
        $dumpvars(0, binary_multiplier_tb);

        // Initialize variables
        tb_clk   = 1'b0;
        tb_rst_n = 1'b0;
        tb_start = 1'b0;
        tb_a     = 0;
        tb_b     = 0;
        errors   = 0;
        
        $display("==================================================");
        $display("Starting Binary Multiplier Testbench Simulation");
        $display("==================================================");

        // Set up $monitor to track signal changes automatically
        $monitor("Time=%0dns | Monitor: rst_n=%b ready=%b done=%b a=%d b=%d product=%d", 
                 $time, tb_rst_n, tb_ready, tb_done, tb_a, tb_b, tb_product);

        // Apply Reset
        #12;
        tb_rst_n = 1'b1;
        #10;

        // Test Case 1: Zeros
        run_multiplication(8'd0, 8'd0);

        // Test Case 2: Multiplications with Zero
        run_multiplication(8'd25, 8'd0);
        run_multiplication(8'd0, 8'd99);

        // Test Case 3: Identity cases
        run_multiplication(8'd1, 8'd50);
        run_multiplication(8'd128, 8'd1);

        // Test Case 4: Standard cases
        run_multiplication(8'd12, 8'd12);
        run_multiplication(8'd15, 8'd16);

        // Test Case 5: Max limits
        run_multiplication(8'hFF, 8'hFF); // 255 * 255 = 65025

        // Test Case 6: Random Cases
        for (i = 0; i < 15; i = i + 1) begin
            run_multiplication($random % 256, $random % 256);
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
