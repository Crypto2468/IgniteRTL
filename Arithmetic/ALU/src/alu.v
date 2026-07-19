// =============================================================================
// Project Name: IgniteRTL
// File Name:    alu.v
// Description:  Parameterized 8-bit Arithmetic Logic Unit (ALU). 
//               Computes 16 different arithmetic, logical, and shift operations 
//               based on a 4-bit opcode, generating status flags for Zero, 
//               Negative, Carry-out, and Signed Overflow.
//
// Author:       IgniteRTL Contributor
// Date:         2026-07-19
// Version:      1.0
// =============================================================================

module alu #(
    parameter WIDTH = 8 // Default data path bit width
)(
    input  wire [WIDTH-1:0]     a,        // Input operand A
    input  wire [WIDTH-1:0]     b,        // Input operand B
    input  wire [3:0]           opcode,   // 4-bit Operation Code
    input  wire                 cin,      // Carry-in input
    output reg  [WIDTH-1:0]     result,   // ALU calculation result
    output reg                  cout,     // Carry-out / Borrow-out flag
    output wire                 zero,     // Zero output flag
    output wire                 negative, // Negative result flag
    output reg                  overflow  // Signed arithmetic overflow flag
);

    // Opcode definitions
    localparam OP_ADD    = 4'b0000;
    localparam OP_SUB    = 4'b0001;
    localparam OP_AND    = 4'b0010;
    localparam OP_OR     = 4'b0011;
    localparam OP_XOR    = 4'b0100;
    localparam OP_NOR    = 4'b0101;
    localparam OP_NAND   = 4'b0110;
    localparam OP_XNOR   = 4'b0111;
    localparam OP_LSL    = 4'b1000;
    localparam OP_LSR    = 4'b1001;
    localparam OP_ASR    = 4'b1010;
    localparam OP_INC    = 4'b1011;
    localparam OP_DEC    = 4'b1100;
    localparam OP_NOT    = 4'b1101;
    localparam OP_PASSA  = 4'b1110;
    localparam OP_PASSB  = 4'b1111;

    // Intermediate variables for carry and overflow calculations
    wire [WIDTH:0] adder_sum;
    wire [WIDTH:0] subtract_diff;
    wire           ovf_add;
    wire           ovf_sub;

    // Subtraction and addition with full width to capture carry/borrow
    assign adder_sum     = a + b + cin;
    assign subtract_diff = a - b - cin;

    // Signed overflow detection logic
    // Addition overflow: operands have same sign, but result sign is different
    assign ovf_add = (a[WIDTH-1] == b[WIDTH-1]) && (result[WIDTH-1] != a[WIDTH-1]);

    // Subtraction overflow: operands have opposite sign, and result sign differs from A's sign
    assign ovf_sub = (a[WIDTH-1] != b[WIDTH-1]) && (result[WIDTH-1] != a[WIDTH-1]);

    // Primary ALU execution block
    always @(*) begin
        // Reset defaults
        cout     = 1'b0;
        overflow = 1'b0;
        
        case (opcode)
            OP_ADD: begin
                result   = adder_sum[WIDTH-1:0];
                cout     = adder_sum[WIDTH];
                overflow = ovf_add;
            end
            OP_SUB: begin
                result   = subtract_diff[WIDTH-1:0];
                cout     = subtract_diff[WIDTH]; // High indicates borrow
                overflow = ovf_sub;
            end
            OP_AND: begin
                result   = a & b;
            end
            OP_OR: begin
                result   = a | b;
            end
            OP_XOR: begin
                result   = a ^ b;
            end
            OP_NOR: begin
                result   = ~(a | b);
            end
            OP_NAND: begin
                result   = ~(a & b);
            end
            OP_XNOR: begin
                result   = ~(a ^ b);
            end
            OP_LSL: begin
                result   = {a[WIDTH-2:0], 1'b0};
                cout     = a[WIDTH-1];
            end
            OP_LSR: begin
                result   = {1'b0, a[WIDTH-1:1]};
                cout     = a[0];
            end
            OP_ASR: begin
                result   = {a[WIDTH-1], a[WIDTH-1:1]}; // Sign extension
                cout     = a[0];
            end
            OP_INC: begin
                result   = a + 1'b1;
                cout     = (a == {WIDTH{1'b1}});
            end
            OP_DEC: begin
                result   = a - 1'b1;
                cout     = (a == 0);
            end
            OP_NOT: begin
                result   = ~a;
            end
            OP_PASSA: begin
                result   = a;
            end
            OP_PASSB: begin
                result   = b;
            end
            default: begin
                result   = {WIDTH{1'b0}};
            end
        endcase
    end

    // Assign status flags combinationally
    assign zero     = (result == {WIDTH{1'b0}});
    assign negative = result[WIDTH-1];

endmodule
