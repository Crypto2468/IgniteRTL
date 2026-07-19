// =============================================================================
// Project Name: IgniteRTL
// File Name:    barrel_shifter.v
// Description:  8-bit Combinational Logarithmic Barrel Shifter. Supports 
//               Logical Shift Left (LSL), Logical Shift Right (LSR), 
//               Arithmetic Shift Right (ASR), and Rotate Right (ROR).
//
// Author:       IgniteRTL Contributor
// Date:         2026-07-19
// Version:      1.0
// =============================================================================

module barrel_shifter (
    input  wire [7:0]   data_in,   // 8-bit input data
    input  wire [2:0]   shift_amt, // 3-bit shift amount (0 to 7)
    input  wire [1:0]   mode,      // Shift mode: 00=LSL, 01=LSR, 10=ASR, 11=ROR
    output reg  [7:0]   data_out   // 8-bit shifted output data
);

    // FSM-like mode parameters for clarity
    localparam MODE_LSL = 2'b00;
    localparam MODE_LSR = 2'b01;
    localparam MODE_ASR = 2'b10;
    localparam MODE_ROR = 2'b11;

    // Stage registers for logarithmic shifting
    reg [7:0] stage0;
    reg [7:0] stage1;

    // =========================================================================
    // STAGE 0: Shift/Rotate by 1 bit (controlled by shift_amt[0])
    // =========================================================================
    always @(*) begin
        if (shift_amt[0]) begin
            case (mode)
                MODE_LSL: stage0 = {data_in[6:0], 1'b0};
                MODE_LSR: stage0 = {1'b0, data_in[7:1]};
                MODE_ASR: stage0 = {data_in[7], data_in[7:1]}; // Sign extension
                MODE_ROR: stage0 = {data_in[0], data_in[7:1]}; // Rotation
                default:  stage0 = data_in;
            endcase
        end else begin
            stage0 = data_in;
        end
    end

    // =========================================================================
    // STAGE 1: Shift/Rotate by 2 bits (controlled by shift_amt[1])
    // =========================================================================
    always @(*) begin
        if (shift_amt[1]) begin
            case (mode)
                MODE_LSL: stage1 = {stage0[5:0], 2'b00};
                MODE_LSR: stage1 = {2'b00, stage0[7:2]};
                MODE_ASR: stage1 = {{2{stage0[7]}}, stage0[7:2]}; // Sign extension
                MODE_ROR: stage1 = {stage0[1:0], stage0[7:2]};    // Rotation
                default:  stage1 = stage0;
            endcase
        end else begin
            stage1 = stage0;
        end
    end

    // =========================================================================
    // STAGE 2: Shift/Rotate by 4 bits (controlled by shift_amt[2])
    // =========================================================================
    always @(*) begin
        if (shift_amt[2]) begin
            case (mode)
                MODE_LSL: data_out = {stage1[3:0], 4'b0000};
                MODE_LSR: data_out = {4'b0000, stage1[7:4]};
                MODE_ASR: data_out = {{4{stage1[7]}}, stage1[7:4]}; // Sign extension
                MODE_ROR: data_out = {stage1[3:0], stage1[7:4]};    // Rotation
                default:  data_out = stage1;
            endcase
        end else begin
            data_out = stage1;
        end
    end

endmodule
