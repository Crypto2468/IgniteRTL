// Module: instruction_register_tb
// Description: Testbench for Instruction Register
// Author: IgniteRTL Contributor

`timescale 1ns / 1ps

module instruction_register_tb;

    reg  tb_clk;
    reg  tb_rst_n;
    reg  tb_ir_enable;
    reg  [15:0] tb_din;
    wire [15:0] tb_instr;

    // Instantiate the DUT
    instruction_register uut (
        .clk(tb_clk),
        .rst_n(tb_rst_n),
        .ir_enable(tb_ir_enable),
        .din(tb_din),
        .instr(tb_instr)
    );

    // Clock generator
    always #10 tb_clk = ~tb_clk;

    initial begin
        $monitor("Time=%0dns | clk=%b rst_n=%b | ir_en=%b din=%h | instr=%h", 
                 $time, tb_clk, tb_rst_n, tb_ir_enable, tb_din, tb_instr);

        tb_clk = 1'b0; tb_rst_n = 1'b0; tb_ir_enable = 1'b0; tb_din = 16'h0000; #25;
        tb_rst_n = 1'b1; #10;

        // Load instruction 16'h51A2
        tb_din = 16'h51A2;
        tb_ir_enable = 1'b1; #20;

        // Disable load, change inputs (output should hold 16'h51A2)
        tb_ir_enable = 1'b0;
        tb_din = 16'hFFFF; #20;

        // Re-enable and load 16'h1234
        tb_ir_enable = 1'b1;
        tb_din = 16'h1234; #20;
        tb_ir_enable = 1'b0; #20;

        $finish;
    end

endmodule
