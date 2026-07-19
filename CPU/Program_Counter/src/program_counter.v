// Module: program_counter
// Description: 8-bit Program Counter (PC) register with count enable and load branch target
// Author: IgniteRTL Contributor

module program_counter (
    input  wire clk,        // Clock input
    input  wire rst_n,      // Asynchronous active-low reset
    input  wire en,         // Count Enable
    input  wire load,       // Load branch/jump target address
    input  wire [7:0] din,  // Target address inputs
    output reg  [7:0] pc    // Current program counter output
);

    // Sequential Program Counter updates
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            pc <= 8'h00;
        end else begin
            if (load) begin
                pc <= din;
            end else if (en) begin
                pc <= pc + 8'h01;
            end
        end
    end

endmodule
