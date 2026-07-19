// Module: simple_risc_cpu
// Description: Integrated 8-bit Simple RISC CPU Core
// Author: IgniteRTL Contributor

module simple_risc_cpu (
    input  wire clk,         // System clock
    input  wire rst_n,       // Asynchronous active-low reset
    output wire [7:0] pc_out // Output PC for program execution monitoring
);

    // Internal bus signals
    wire [7:0] pc;
    wire [15:0] instr;
    wire [3:0] opcode;
    wire [1:0] rd, rs;
    wire [7:0] imm;
    
    // Control lines
    wire pc_en, pc_load, ir_en, reg_we, acc_en, mem_we;
    wire [2:0] alu_op;

    // Data path lines
    wire [7:0] reg_data_a, reg_data_b;
    wire [7:0] acc_data;
    wire [7:0] alu_b_operand;
    wire [7:0] alu_result;
    wire alu_zero, alu_carry;

    assign pc_out = pc;

    // Hardwired Instruction ROM (Internal Memory table for demonstration)
    reg [15:0] rom [15:0];
    initial begin
        // Program table:
        rom[0] = 16'h5425; // LOAD  R[1] <= 8'h25
        rom[1] = 16'h5810; // LOAD  R[2] <= 8'h10
        rom[2] = 16'h1480; // ADD   R[1] <= R[1] + R[2] (adds 25 + 10 = 35)
        rom[3] = 16'h7000; // JUMP  PC   <= 8'h00 (infinite loop)
        rom[4] = 16'h0000;
        rom[5] = 16'h0000;
        rom[6] = 16'h0000;
        rom[7] = 16'h0000;
        rom[8] = 16'h0000;
        rom[9] = 16'h0000;
        rom[10] = 16'h0000;
        rom[11] = 16'h0000;
        rom[12] = 16'h0000;
        rom[13] = 16'h0000;
        rom[14] = 16'h0000;
        rom[15] = 16'h0000;
    end
    wire [15:0] rom_instr = rom[pc[3:0]];

    // 1. Program Counter
    program_counter pc_unit (
        .clk(clk),
        .rst_n(rst_n),
        .en(pc_en),
        .load(pc_load),
        .din(imm),
        .pc(pc)
    );

    // 2. Instruction Register
    instruction_register ir_unit (
        .clk(clk),
        .rst_n(rst_n),
        .ir_enable(ir_en),
        .din(rom_instr),
        .instr(instr)
    );

    // 3. Instruction Decoder
    instruction_decoder dec_unit (
        .instr(instr),
        .opcode(opcode),
        .rd(rd),
        .rs(rs),
        .imm(imm)
    );

    // 4. Control Unit
    control_unit ctrl_unit (
        .clk(clk),
        .rst_n(rst_n),
        .opcode(opcode),
        .pc_en(pc_en),
        .pc_load(pc_load),
        .ir_en(ir_en),
        .reg_we(reg_we),
        .acc_en(acc_en),
        .mem_we(mem_we),
        .alu_op(alu_op)
    );

    // 5. Register File
    // If loading immediate, write 'imm' directly. Otherwise write ALU result.
    wire [7:0] writeback_data = (opcode == 4'h5) ? imm : alu_result;
    register_file gprs (
        .clk(clk),
        .rst_n(rst_n),
        .we(reg_we),
        .wr_addr(rd),
        .wr_data(writeback_data),
        .rd_addr_a(rd),
        .rd_addr_b(rs),
        .rd_data_a(reg_data_a),
        .rd_data_b(reg_data_b)
    );

    // 6. Multiplexer selecting Operand B
    // In our simplified instruction set, operand B can be immediate or GPR source.
    multiplexer_based_control mux_b (
        .sel((opcode == 4'h5) ? 2'b10 : 2'b00),
        .reg_data(reg_data_b),
        .acc_data(8'h00),
        .imm_data(imm),
        .mux_out(alu_b_operand)
    );

    // 7. 8-Bit ALU
    alu_8bit alu (
        .op_sel(alu_op),
        .a(reg_data_a),
        .b(alu_b_operand),
        .result(alu_result),
        .zero(alu_zero),
        .carry(alu_carry)
    );

endmodule
