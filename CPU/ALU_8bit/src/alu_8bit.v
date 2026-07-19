// Module: alu_8bit
// Description: 8-bit Arithmetic Logic Unit supporting basic RISC instructions
// Author: IgniteRTL Contributor

module alu_8bit (
    input  wire [2:0] op_sel, // Operation selector
    input  wire [7:0] a,      // Input operand A
    input  wire [7:0] b,      // Input operand B
    output reg  [7:0] result, // Output calculation result
    output wire zero,         // Zero flag output
    output reg  carry         // Carry flag output
);

    // ALU Operation Selectors
    parameter OP_ADD = 3'b000;
    parameter OP_SUB = 3'b001;
    parameter OP_AND = 3'b010;
    parameter OP_OR  = 3'b011;
    parameter OP_XOR = 3'b100;
    parameter OP_NOT = 3'b101;
    parameter OP_SHL = 3'b110;
    parameter OP_SHR = 3'b111;

    // Zero Flag Assignment
    assign zero = (result == 8'h00);

    // Combinational calculation logic
    always @(*) begin
        result = 8'h00;
        carry  = 1'b0;

        case (op_sel)
            OP_ADD: {carry, result} = a + b;
            OP_SUB: result = a - b;
            OP_AND: result = a & b;
            OP_OR:  result = a | b;
            OP_XOR: result = a ^ b;
            OP_NOT: result = ~a;
            OP_SHL: result = a << 1;
            OP_SHR: result = a >> 1;
            default: begin
                result = 8'h00;
                carry  = 1'b0;
            end
        endcase
    end

endmodule
