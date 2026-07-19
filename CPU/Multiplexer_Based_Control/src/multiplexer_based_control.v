// Module: multiplexer_based_control
// Description: Multiplexer selector directing operands to the ALU in the CPU data path
// Author: IgniteRTL Contributor

module multiplexer_based_control (
    input  wire [1:0] sel,        // MUX selector lines from Control Unit
    input  wire [7:0] reg_data,   // Input data A from GPR file
    input  wire [7:0] acc_data,   // Input data from Accumulator register
    input  wire [7:0] imm_data,   // Input data from immediate extension
    output reg  [7:0] mux_out     // Chosen operand out routed to the ALU
);

    // Combinational multiplexing
    always @(*) begin
        case (sel)
            2'b00: mux_out = reg_data;
            2'b01: mux_out = acc_data;
            2'b10: mux_out = imm_data;
            default: mux_out = 8'h00;
        endcase
    end

endmodule
