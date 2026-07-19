// Module: simple_risc_cpu_tb
// Description: Testbench for the integrated Simple RISC CPU running a program loop
// Author: IgniteRTL Contributor

`timescale 1ns / 1ps

module simple_risc_cpu_tb;

    reg  tb_clk;
    reg  tb_rst_n;
    wire [7:0] tb_pc_out;

    // Instantiate the CPU DUT
    simple_risc_cpu uut (
        .clk(tb_clk),
        .rst_n(tb_rst_n),
        .pc_out(tb_pc_out)
    );

    // Clock generator (50MHz / 20ns period)
    always #10 tb_clk = ~tb_clk;

    initial begin
        $monitor("Time=%0dns | rst_n=%b | PC=%h | Instr=%h Opcode=%h | Reg1=%h Reg2=%h | ALU_Out=%h", 
                 $time, tb_rst_n, tb_pc_out, uut.instr, uut.opcode, uut.gprs.regs[1], uut.gprs.regs[2], uut.alu_result);

        tb_clk = 1'b0; tb_rst_n = 1'b0; #25;
        tb_rst_n = 1'b1;

        // Run execution cycles (each instruction takes 3 clocks: FETCH, DECODE, EXECUTE)
        // Instruction 0 (LOAD R1, 25): Clocks 25 -> 85
        // Instruction 1 (LOAD R2, 10): Clocks 85 -> 145
        // Instruction 2 (ADD R1, R2) : Clocks 145 -> 205
        // Instruction 3 (JUMP 00)    : Clocks 205 -> 265
        #300;

        $finish;
    end

endmodule
