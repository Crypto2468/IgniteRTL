// Module: lifo_stack
// Description: 8x8 Synchronous Last-In First-Out Stack (LIFO)
// Author: IgniteRTL Contributor

module lifo_stack (
    input  wire clk,        // Clock input
    input  wire rst_n,      // Asynchronous active-low reset
    input  wire push,       // Push data onto stack
    input  wire pop,        // Pop data from stack
    input  wire [7:0] din,  // 8-bit Data Input
    output reg  [7:0] dout, // 8-bit Data Output
    output wire full,       // Stack Full flag
    output wire empty       // Stack Empty flag
);

    reg [7:0] mem [7:0]; // 8-word depth
    reg [3:0] sp;        // Stack Pointer

    assign empty = (sp == 4'd0);
    assign full  = (sp == 4'd8);

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            sp   <= 4'b0000;
            dout <= 8'h00;
        end else begin
            if (push && !full && !pop) begin
                mem[sp] <= din;
                sp <= sp + 4'b0001;
            end else if (pop && !empty && !push) begin
                sp <= sp - 4'b0001;
                dout <= mem[sp - 4'b0001];
            end else if (push && pop && !empty && !full) begin
                // Simultaneous push and pop (top element overwrite)
                mem[sp - 4'b0001] <= din;
                dout <= din;
            end
        end
    end

endmodule
