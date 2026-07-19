// Module: alu_4bit
// Description: 4-bit Arithmetic Logic Unit (ALU) using behavioral modeling
// Author: IgniteRTL Contributor

module alu_4bit (
    input  wire [3:0] a,     // 4-bit Input A
    input  wire [3:0] b,     // 4-bit Input B
    input  wire [2:0] op,    // 3-bit Operation select
    output reg  [3:0] out,   // 4-bit ALU Output
    output reg        carry  // Carry output (valid for addition)
);

    always @(*) begin
        carry = 1'b0;
        case (op)
            3'b000: {carry, out} = a + b; // Addition
            3'b001: out = a - b;          // Subtraction
            3'b010: out = a & b;          // Logical AND
            3'b011: out = a | b;          // Logical OR
            3'b100: out = a ^ b;          // Logical XOR
            3'b101: out = ~a;             // Logical NOT A
            3'b110: out = a << 1;         // Shift Left
            3'b111: out = a >> 1;         // Shift Right
            default: out = 4'b0000;
        endcase
    end

endmodule
