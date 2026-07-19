`timescale 1ns / 1ps
// =============================================================================
// Project Name: IgniteRTL
// File Name:    barrel_shifter_tb.v
// Description:  Self-checking testbench for the logarithmic Barrel Shifter.
//               Verifies LSL, LSR, ASR (with sign extension), and ROR modes.
//
// Author:       IgniteRTL Contributor
// Date:         2026-07-19
// Version:      1.0
// =============================================================================

module barrel_shifter_tb;

    // Testbench signals
    reg  [7:0] tb_data_in;
    reg  [2:0] tb_shift_amt;
    reg  [1:0] tb_mode;
    wire [7:0] tb_data_out;
    
    // Tracking errors for self-checking verification
    integer errors;

    // Expected value containers
    reg [7:0] expected_val;

    // Instantiate the Design Under Test (DUT)
    barrel_shifter u_shifter (
        .data_in   (tb_data_in),
        .shift_amt (tb_shift_amt),
        .mode      (tb_mode),
        .data_out  (tb_data_out)
    );

    // Verification task to check DUT outputs against expected logic
    task check_outputs;
        input [7:0] expected_data;
        begin
            #1; // Wait for propagation delay
            if (tb_data_out !== expected_data) begin
                $display("[ERROR] Time=%0dns | Input: %b amt=%d mode=%b | Expected: %b | Got: %b", 
                         $time, tb_data_in, tb_shift_amt, tb_mode, expected_data, tb_data_out);
                errors = errors + 1;
            end else begin
                $display("[PASS]  Time=%0dns | Input: %b amt=%d mode=%b | Got: %b", 
                         $time, tb_data_in, tb_shift_amt, tb_mode, tb_data_out);
            end
        end
    endtask

    // Stimulus generation
    initial begin
        // Initialize VCD dumping for waveform analysis
        $dumpfile("barrel_shifter_tb.vcd");
        $dumpvars(0, barrel_shifter_tb);

        // Initialize variables
        errors = 0;
        
        $display("==================================================");
        $display("Starting Barrel Shifter Testbench Simulation");
        $display("==================================================");

        // Set up $monitor to track signal changes automatically
        $monitor("Time=%0dns | Monitor: mode=%b data_in=%b amt=%d data_out=%b", 
                 $time, tb_mode, tb_data_in, tb_shift_amt, tb_data_out);

        // =====================================================================
        // MODE 00: Logical Shift Left (LSL)
        // =====================================================================
        $display("\n--- Testing Logical Shift Left (LSL) ---");
        tb_mode = 2'b00;
        tb_data_in = 8'b1000_0011;
        
        tb_shift_amt = 3'd0; check_outputs(8'b1000_0011);
        tb_shift_amt = 3'd1; check_outputs(8'b0000_0110);
        tb_shift_amt = 3'd4; check_outputs(8'b0011_0000);
        tb_shift_amt = 3'd7; check_outputs(8'b1000_0000);

        // =====================================================================
        // MODE 01: Logical Shift Right (LSR)
        // =====================================================================
        $display("\n--- Testing Logical Shift Right (LSR) ---");
        tb_mode = 2'b01;
        tb_data_in = 8'b1100_0001;

        tb_shift_amt = 3'd0; check_outputs(8'b1100_0001);
        tb_shift_amt = 3'd1; check_outputs(8'b0110_0000);
        tb_shift_amt = 3'd3; check_outputs(8'b0001_1000);
        tb_shift_amt = 3'd7; check_outputs(8'b0000_0001);

        // =====================================================================
        // MODE 10: Arithmetic Shift Right (ASR)
        // =====================================================================
        $display("\n--- Testing Arithmetic Shift Right (ASR) ---");
        tb_mode = 2'b10;
        
        // Test with MSB = 1 (Negative value, should sign extend)
        tb_data_in = 8'b1100_0010;
        tb_shift_amt = 3'd0; check_outputs(8'b1100_0010);
        tb_shift_amt = 3'd1; check_outputs(8'b1110_0001);
        tb_shift_amt = 3'd4; check_outputs(8'b1111_1100);
        
        // Test with MSB = 0 (Positive value, should fill with 0s)
        tb_data_in = 8'b0100_1000;
        tb_shift_amt = 3'd2; check_outputs(8'b0001_0010);

        // =====================================================================
        // MODE 11: Rotate Right (ROR)
        // =====================================================================
        $display("\n--- Testing Rotate Right (ROR) ---");
        tb_mode = 2'b11;
        tb_data_in = 8'b1000_0111;

        tb_shift_amt = 3'd0; check_outputs(8'b1000_0111);
        tb_shift_amt = 3'd1; check_outputs(8'b1100_0011);
        tb_shift_amt = 3'd3; check_outputs(8'b1111_0000);
        tb_shift_amt = 3'd7; check_outputs(8'b0000_1111);

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
