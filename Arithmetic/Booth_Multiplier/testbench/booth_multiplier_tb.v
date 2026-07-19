`timescale 1ns / 1ps
// =============================================================================
// Project Name: IgniteRTL
// File Name:    booth_multiplier_tb.v
// Description:  Self-checking testbench for the signed Booth Multiplier.
//               Verifies positive, negative, and edge-case signed multiplications.
//
// Author:       IgniteRTL Contributor
// Date:         2026-07-19
// Version:      1.0
// =============================================================================

module booth_multiplier_tb;

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

    // Expected signed product container
    reg signed [2*TEST_WIDTH-1:0] expected_val;

    // Instantiate the Design Under Test (DUT)
    booth_multiplier #(
        .WIDTH(TEST_WIDTH)
    ) u_booth_mult (
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

    // Task to run a single signed multiplication transaction
    task run_signed_multiplication;
        input [TEST_WIDTH-1:0] a_val;
        input [TEST_WIDTH-1:0] b_val;
        begin
            // Wait until device is ready
            while (!tb_ready) begin
                @(posedge tb_clk);
            end

            // Apply signed operands
            tb_a     = a_val;
            tb_b     = b_val;
            tb_start = 1'b1;
            
            @(posedge tb_clk);
            tb_start = 1'b0; // De-assert start

            // Wait for completion
            while (!tb_done) begin
                @(posedge tb_clk);
            end

            // Verify signed result
            expected_val = $signed(tb_a) * $signed(tb_b);
            #1; // Delay slightly to settle
            if ($signed(tb_product) !== expected_val) begin
                $display("[ERROR] Time=%0dns | Input: a=%d b=%d | Expected Product=%d | Got=%d", 
                         $time, $signed(tb_a), $signed(tb_b), expected_val, $signed(tb_product));
                errors = errors + 1;
            end else begin
                $display("[PASS]  Time=%0dns | Input: a=%d b=%d | Product=%d", 
                         $time, $signed(tb_a), $signed(tb_b), $signed(tb_product));
            end
            @(posedge tb_clk);
        end
    endtask

    // Stimulus generation
    initial begin
        // Initialize VCD dumping for waveform analysis
        $dumpfile("booth_multiplier_tb.vcd");
        $dumpvars(0, booth_multiplier_tb);

        // Initialize variables
        tb_clk   = 1'b0;
        tb_rst_n = 1'b0;
        tb_start = 1'b0;
        tb_a     = 0;
        tb_b     = 0;
        errors   = 0;
        
        $display("==================================================");
        $display("Starting Booth Multiplier Testbench Simulation");
        $display("==================================================");

        // Set up $monitor to track signal changes automatically
        $monitor("Time=%0dns | Monitor: ready=%b done=%b a=%d b=%d product=%d", 
                 $time, tb_ready, tb_done, $signed(tb_a), $signed(tb_b), $signed(tb_product));

        // Apply Reset
        #12;
        tb_rst_n = 1'b1;
        #10;

        // Test Case 1: Zeros
        run_signed_multiplication(8'd0, 8'd0);

        // Test Case 2: Positive * Positive
        run_signed_multiplication(8'd12, 8'd10);

        // Test Case 3: Positive * Negative
        run_signed_multiplication(8'd15, -8'd6);

        // Test Case 4: Negative * Positive
        run_signed_multiplication(-8'd7, 8'd8);

        // Test Case 5: Negative * Negative
        run_signed_multiplication(-8'd16, -8'd4);

        // Test Case 6: Edge Case (Max signed value: 127 * -128)
        run_signed_multiplication(8'd127, -8'd128);
        run_signed_multiplication(-8'd128, -8'd128);

        // Test Case 7: Directed Random Cases
        for (i = 0; i < 15; i = i + 1) begin
            run_signed_multiplication($random % 128, $random % 128);
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
