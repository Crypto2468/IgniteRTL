`timescale 1ns / 1ps
// =============================================================================
// Project Name: IgniteRTL
// File Name:    alu_tb.v
// Description:  Self-checking testbench for the parameterized 8-bit ALU.
//               Verifies all 16 operations and all status flags (Z, N, C, V).
//
// Author:       IgniteRTL Contributor
// Date:         2026-07-19
// Version:      1.0
// =============================================================================

module alu_tb;

    parameter TEST_WIDTH = 8;

    // Testbench signals
    reg  [TEST_WIDTH-1:0] tb_a;
    reg  [TEST_WIDTH-1:0] tb_b;
    reg  [3:0]            tb_opcode;
    reg                   tb_cin;
    wire [TEST_WIDTH-1:0] tb_result;
    wire                  tb_cout;
    wire                  tb_zero;
    wire                  tb_negative;
    wire                  tb_overflow;
    
    // Tracking errors for self-checking verification
    integer errors;

    // Instantiate the Design Under Test (DUT)
    alu #(
        .WIDTH(TEST_WIDTH)
    ) u_alu (
        .a        (tb_a),
        .b        (tb_b),
        .opcode   (tb_opcode),
        .cin      (tb_cin),
        .result   (tb_result),
        .cout     (tb_cout),
        .zero     (tb_zero),
        .negative (tb_negative),
        .overflow (tb_overflow)
    );

    // Verification task
    task verify_alu;
        input [TEST_WIDTH-1:0] expected_res;
        input                  expected_c;
        input                  expected_z;
        input                  expected_n;
        input                  expected_v;
        begin
            #1; // Wait for propagation delay
            if ((tb_result !== expected_res) ||
                (tb_cout !== expected_c) ||
                (tb_zero !== expected_z) ||
                (tb_negative !== expected_n) ||
                (tb_overflow !== expected_v)) begin
                $display("[ERROR] Time=%0dns | Opcode=%b | Input: a=%d b=%d cin=%b | Expected: Res=%b C=%b Z=%b N=%b V=%b | Got: Res=%b C=%b Z=%b N=%b V=%b", 
                         $time, tb_opcode, tb_a, tb_b, tb_cin, 
                         expected_res, expected_c, expected_z, expected_n, expected_v,
                         tb_result, tb_cout, tb_zero, tb_negative, tb_overflow);
                errors = errors + 1;
            end else begin
                $display("[PASS]  Time=%0dns | Opcode=%b | Input: a=%d b=%d cin=%b | Got: Res=%d C=%b Z=%b N=%b V=%b", 
                         $time, tb_opcode, tb_a, tb_b, tb_cin, tb_result, tb_cout, tb_zero, tb_negative, tb_overflow);
            end
        end
    endtask

    // Stimulus generation
    initial begin
        // Initialize VCD dumping for waveform analysis
        $dumpfile("alu_tb.vcd");
        $dumpvars(0, alu_tb);

        // Initialize variables
        errors = 0;
        tb_a = 0;
        tb_b = 0;
        tb_opcode = 0;
        tb_cin = 0;
        
        $display("==================================================");
        $display("Starting ALU Testbench Simulation");
        $display("==================================================");

        // Set up $monitor to track signal changes automatically
        $monitor("Time=%0dns | Monitor: op=%b a=%d b=%d | Res=%d C=%b Z=%b N=%b V=%b", 
                 $time, tb_opcode, tb_a, tb_b, tb_result, tb_cout, tb_zero, tb_negative, tb_overflow);

        // =====================================================================
        // OP_ADD (0000)
        // =====================================================================
        $display("\n--- Testing OP_ADD ---");
        tb_opcode = 4'b0000;
        
        // Simple Add: 10 + 20 = 30 (Z=0, N=0, C=0, V=0)
        tb_a = 8'd10; tb_b = 8'd20; tb_cin = 0;
        verify_alu(8'd30, 1'b0, 1'b0, 1'b0, 1'b0);

        // Carry-out test: 200 + 100 = 300 (wrapped 44) (Z=0, N=0, C=1, V=0)
        tb_a = 8'd200; tb_b = 8'd100; tb_cin = 0;
        verify_alu(8'd44, 1'b1, 1'b0, 1'b0, 1'b0);

        // Signed Overflow test: 120 + 10 = 130 (wrapped -126) (Z=0, N=1, C=0, V=1)
        tb_a = 8'd120; tb_b = 8'd10; tb_cin = 0;
        verify_alu(8'd130, 1'b0, 1'b0, 1'b1, 1'b1);

        // =====================================================================
        // OP_SUB (0001)
        // =====================================================================
        $display("\n--- Testing OP_SUB ---");
        tb_opcode = 4'b0001;

        // Simple Sub: 50 - 20 = 30 (Z=0, N=0, C=0, V=0)
        tb_a = 8'd50; tb_b = 8'd20; tb_cin = 0;
        verify_alu(8'd30, 1'b0, 1'b0, 1'b0, 1'b0);

        // Borrow out test: 10 - 20 = -10 (wrapped 246) (Z=0, N=1, C=1, V=0)
        tb_a = 8'd10; tb_b = 8'd20; tb_cin = 0;
        verify_alu(8'd246, 1'b1, 1'b0, 1'b1, 1'b0);

        // Signed Overflow test: -120 - 10 = -130 (wrapped 126) (Z=0, N=0, C=0, V=1)
        tb_a = -8'd120; tb_b = 8'd10; tb_cin = 0;
        verify_alu(8'd126, 1'b0, 1'b0, 1'b0, 1'b1);

        // =====================================================================
        // LOGICAL OPERATIONS
        // =====================================================================
        $display("\n--- Testing Logical Operations ---");
        tb_a = 8'hF0; tb_b = 8'h3C; tb_cin = 0;

        // OP_AND (0010): F0 & 3C = 30
        tb_opcode = 4'b0010; verify_alu(8'h30, 1'b0, 1'b0, 1'b0, 1'b0);

        // OP_OR (0011): F0 | 3C = FC
        tb_opcode = 4'b0011; verify_alu(8'hFC, 1'b0, 1'b0, 1'b1, 1'b0);

        // OP_XOR (0100): F0 ^ 3C = CC
        tb_opcode = 4'b0100; verify_alu(8'hCC, 1'b0, 1'b0, 1'b1, 1'b0);

        // OP_NOR (0101): ~(F0 | 3C) = 03
        tb_opcode = 4'b0101; verify_alu(8'h03, 1'b0, 1'b0, 1'b0, 1'b0);

        // OP_NAND (0110): ~(F0 & 3C) = CF
        tb_opcode = 4'b0110; verify_alu(8'hCF, 1'b0, 1'b0, 1'b1, 1'b0);

        // OP_XNOR (0111): ~(F0 ^ 3C) = 33
        tb_opcode = 4'b0111; verify_alu(8'h33, 1'b0, 1'b0, 1'b0, 1'b0);

        // =====================================================================
        // SHIFTS
        // =====================================================================
        $display("\n--- Testing Shifts ---");
        
        // OP_LSL (1000): 80 << 1 = 00 (C=1, Z=1)
        tb_opcode = 4'b1000; tb_a = 8'h80;
        verify_alu(8'h00, 1'b1, 1'b1, 1'b0, 1'b0);

        // OP_LSR (1001): 81 >> 1 = 40 (C=1, Z=0)
        tb_opcode = 4'b1001; tb_a = 8'h81;
        verify_alu(8'h40, 1'b1, 1'b0, 1'b0, 1'b0);

        // OP_ASR (1010): 81 >>> 1 = C0 (C=1, Z=0, N=1)
        tb_opcode = 4'b1010; tb_a = 8'h81;
        verify_alu(8'hC0, 1'b1, 1'b0, 1'b1, 1'b0);

        // =====================================================================
        // INC, DEC, NOT, PASS
        // =====================================================================
        $display("\n--- Testing Increments and Miscellaneous ---");
        
        // OP_INC (1011): FF + 1 = 00 (C=1, Z=1)
        tb_opcode = 4'b1011; tb_a = 8'hFF;
        verify_alu(8'h00, 1'b1, 1'b1, 1'b0, 1'b0);

        // OP_DEC (1100): 00 - 1 = FF (C=1, Z=0, N=1)
        tb_opcode = 4'b1100; tb_a = 8'h00;
        verify_alu(8'hFF, 1'b1, 1'b0, 1'b1, 1'b0);

        // OP_NOT (1101): ~55 = AA
        tb_opcode = 4'b1101; tb_a = 8'h55;
        verify_alu(8'hAA, 1'b0, 1'b0, 1'b1, 1'b0);

        // OP_PASSA (1110): A = AA
        tb_opcode = 4'b1110; tb_a = 8'hAA;
        verify_alu(8'hAA, 1'b0, 1'b0, 1'b1, 1'b0);

        // OP_PASSB (1111): B = 55
        tb_opcode = 4'b1111; tb_b = 8'h55;
        verify_alu(8'h55, 1'b0, 1'b0, 1'b0, 1'b0);

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
