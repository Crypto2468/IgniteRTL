// Module: instruction_register
// Description: 16-bit Instruction Register (IR) holding fetched instructions
// Author: IgniteRTL Contributor

module instruction_register (
    input  wire clk,          // Clock input
    input  wire rst_n,        // Asynchronous active-low reset
    input  wire ir_enable,    // Enable latching of instruction
    input  wire [15:0] din,   // 16-bit input instruction word
    output reg  [15:0] instr  // Latched instruction output
);

    // Synchronous latching logic
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            instr <= 16'h0000;
        end else if (ir_enable) begin
            instr <= din;
        end
    end

endmodule
