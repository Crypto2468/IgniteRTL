// Module: dual_port_ram_tb
// Description: Testbench for Dual-Port RAM
// Author: IgniteRTL Contributor

`timescale 1ns / 1ps

module dual_port_ram_tb;

    reg  tb_clk;
    reg  tb_we_a;
    reg  [3:0] tb_addr_a;
    reg  [7:0] tb_din_a;
    wire [7:0] tb_dout_a;

    reg  tb_we_b;
    reg  [3:0] tb_addr_b;
    reg  [7:0] tb_din_b;
    wire [7:0] tb_dout_b;

    dual_port_ram uut (
        .clk(tb_clk),
        .we_a(tb_we_a),
        .addr_a(tb_addr_a),
        .din_a(tb_din_a),
        .dout_a(tb_dout_a),
        .we_b(tb_we_b),
        .addr_b(tb_addr_b),
        .din_b(tb_din_b),
        .dout_b(tb_dout_b)
    );

    always #10 tb_clk = ~tb_clk;

    initial begin
        $monitor("Time=%0dns | clk=%b | Port A: we=%b addr=%h din=%h dout=%h | Port B: we=%b addr=%h din=%h dout=%h", 
                 $time, tb_clk, tb_we_a, tb_addr_a, tb_din_a, tb_dout_a, tb_we_b, tb_addr_b, tb_din_b, tb_dout_b);

        // Initialize inputs
        tb_clk = 1'b0;
        tb_we_a = 1'b0; tb_addr_a = 4'h0; tb_din_a = 8'h00;
        tb_we_b = 1'b0; tb_addr_b = 4'h0; tb_din_b = 8'h00;
        #25;

        // Write on Port A, Write on Port B at the same time at different addresses
        tb_we_a = 1'b1; tb_addr_a = 4'h3; tb_din_a = 8'hAA;
        tb_we_b = 1'b1; tb_addr_b = 4'hC; tb_din_b = 8'h55;
        #20;

        // Disable write, read Port A from address 0xC (just written by B), read Port B from address 0x3 (just written by A)
        tb_we_a = 1'b0; tb_addr_a = 4'hC;
        tb_we_b = 1'b0; tb_addr_b = 4'h3;
        #20;

        #20;
        $finish;
    end

endmodule
