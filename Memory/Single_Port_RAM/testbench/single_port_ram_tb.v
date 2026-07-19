// Module: single_port_ram_tb
// Description: Testbench for Single-Port RAM
// Author: IgniteRTL Contributor

`timescale 1ns / 1ps

module single_port_ram_tb;

    reg  tb_clk;
    reg  tb_we;
    reg  [3:0] tb_addr;
    reg  [7:0] tb_din;
    wire [7:0] tb_dout;

    single_port_ram uut (
        .clk(tb_clk),
        .we(tb_we),
        .addr(tb_addr),
        .din(tb_din),
        .dout(tb_dout)
    );

    always #10 tb_clk = ~tb_clk;

    initial begin
        $monitor("Time=%0dns | clk=%b we=%b | addr=%h | din=%h | dout=%h", 
                 $time, tb_clk, tb_we, tb_addr, tb_din, tb_dout);

        tb_clk = 1'b0; tb_we = 1'b0; tb_addr = 4'h0; tb_din = 8'h00; #25;

        // Write operation: write 8'hA5 to address 0x2
        tb_we = 1'b1; tb_addr = 4'h2; tb_din = 8'hA5; #20;

        // Write operation: write 8'h5A to address 0x9
        tb_addr = 4'h9; tb_din = 8'h5A; #20;

        // Read operation: read address 0x2
        tb_we = 1'b0; tb_addr = 4'h2; #20;

        // Read operation: read address 0x9
        tb_addr = 4'h9; #20;

        // Read unwritten address 0x0
        tb_addr = 4'h0; #20;

        $finish;
    end

endmodule
