// Module: control_unit
// Description: CPU Control Unit FSM managing instruction cycles (Fetch, Decode, Execute)
// Author: IgniteRTL Contributor

module control_unit (
    input  wire clk,           // Clock input
    input  wire rst_n,         // Asynchronous active-low reset
    input  wire [3:0] opcode,  // Opcode field from Instruction Decoder
    output reg  pc_en,         // Program Counter increment enable
    output reg  pc_load,       // Program Counter load branch target
    output reg  ir_en,         // Instruction Register enable
    output reg  reg_we,        // General Purpose Register File write enable
    output reg  acc_en,        // Accumulator write enable
    output reg  mem_we,        // Data Memory write enable
    output reg  [2:0] alu_op   // ALU Operation Select
);

    // States
    parameter S_FETCH   = 2'b00;
    parameter S_DECODE  = 2'b01;
    parameter S_EXECUTE = 2'b10;

    reg [1:0] state;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state   <= S_FETCH;
            pc_en   <= 1'b0;
            pc_load <= 1'b0;
            ir_en   <= 1'b0;
            reg_we  <= 1'b0;
            acc_en  <= 1'b0;
            mem_we  <= 1'b0;
            alu_op  <= 3'b000;
        end else begin
            case (state)
                S_FETCH: begin
                    pc_en   <= 1'b0;
                    pc_load <= 1'b0;
                    reg_we  <= 1'b0;
                    acc_en  <= 1'b0;
                    mem_we  <= 1'b0;
                    ir_en   <= 1'b1; // Load IR with fetched instruction
                    state   <= S_DECODE;
                end

                S_DECODE: begin
                    ir_en <= 1'b0;
                    state <= S_EXECUTE;
                end

                S_EXECUTE: begin
                    state <= S_FETCH; // Cycle back to Fetch
                    
                    case (opcode)
                        4'h1: begin // ADD
                            alu_op <= 3'b000;
                            reg_we <= 1'b1;
                            pc_en  <= 1'b1;
                        end
                        4'h2: begin // SUB
                            alu_op <= 3'b001;
                            reg_we <= 1'b1;
                            pc_en  <= 1'b1;
                        end
                        4'h3: begin // AND
                            alu_op <= 3'b010;
                            reg_we <= 1'b1;
                            pc_en  <= 1'b1;
                        end
                        4'h5: begin // LOAD
                            reg_we <= 1'b1;
                            pc_en  <= 1'b1;
                        end
                        4'h6: begin // STORE
                            mem_we <= 1'b1;
                            pc_en  <= 1'b1;
                        end
                        4'h7: begin // JUMP
                            pc_load <= 1'b1;
                        end
                        default: begin
                            pc_en <= 1'b1; // default increment
                        end
                    endcase
                end
            endcase
        end
    end

endmodule
