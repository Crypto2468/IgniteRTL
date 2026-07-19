// Module: instruction_decoder
// Description: Combinational instruction decoder splitting instruction fields
// Author: IgniteRTL Contributor

module instruction_decoder (
    input  wire [15:0] instr, // 16-bit instruction word input
    output wire [3:0] opcode, // 4-bit operation code output
    output wire [1:0] rd,     // 2-bit destination register address
    output wire [1:0] rs,     // 2-bit source register address
    output wire [7:0] imm     // 8-bit immediate / address operand
);

    // Splitting 16-bit instruction bits:
    // Bits [15:12] -> Opcode
    // Bits [11:10] -> Destination register rd
    // Bits [9:8]   -> Source register rs
    // Bits [7:0]   -> Immediate/Address value
    assign opcode = instr[15:12];
    assign rd     = instr[11:10];
    assign rs     = instr[9:8];
    assign imm    = instr[7:0];

endmodule
