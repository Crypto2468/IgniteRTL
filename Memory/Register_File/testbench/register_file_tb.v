// Module: register_file_tb
// Description: Testbench for CPU Register File
// Author: IgniteRTL Contributor

`timescale 1ns / 1ps

module register_file_tb;

    reg  tb_clk;
    reg  tb_rst_n;
    reg  tb_we;
    reg  [2:0] tb_wr_addr;
    reg  [7:0] tb_wr_data;
    reg  [2:0] tb_rd_addr_a;
    reg  [2:0] tb_rd_addr_b;
    wire [7:0] tb_rd_data_a;
    wire [7:0] tb_rd_data_b;

    register_file uut (
        .clk(tb_clk),
        .rst_n(tb_rst_n),
        .we(tb_we),
        .wr_addr(tb_wr_addr),
        .wr_data(tb_wr_data),
        .rd_addr_a(tb_rd_addr_a),
        .rd_addr_b(tb_rd_addr_b),
        .rd_data_a(tb_rd_data_a),
        .rd_data_b(tb_rd_data_b)
    );

    always #10 tb_clk = ~tb_clk;

    initial begin
        $monitor("Time=%0dns | clk=%b rst_n=%b | we=%b wr_addr=%d wr_data=%h | rd_a_addr=%d rd_a_data=%h | rd_b_addr=%d rd_b_data=%h", 
                 $time, tb_clk, tb_rst_n, tb_we, tb_wr_addr, tb_wr_data, tb_rd_addr_a, tb_rd_data_a, tb_rd_addr_b, tb_rd_data_b);

        tb_clk = 1'b0; tb_rst_n = 1'b0; tb_we = 1'b0;
        tb_wr_addr = 3'd0; tb_wr_data = 8'h00;
        tb_rd_addr_a = 3'd0; tb_rd_addr_b = 3'd1;
        #25;
        tb_rst_n = 1'b1; #10;

        // Write 8'hF0 to register 3
        tb_we = 1'b1; tb_wr_addr = 3'd3; tb_wr_data = 8'hF0; #20;

        // Write 8'h0F to register 5
        tb_wr_addr = 3'd5; tb_wr_data = 8'h0F; #20;

        // Disable write, read reg 3 on port A and reg 5 on port B
        tb_we = 1'b0;
        tb_rd_addr_a = 3'd3;
        tb_rd_addr_b = 3'd5;
        #20;

        $finish;
    end

endmodule
