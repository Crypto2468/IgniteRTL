// Module: fifo_tb
// Description: Testbench for FIFO Circular Queue
// Author: IgniteRTL Contributor

`timescale 1ns / 1ps

module fifo_tb;

    reg  tb_clk;
    reg  tb_rst_n;
    reg  tb_wr_en;
    reg  tb_rd_en;
    reg  [7:0] tb_din;
    wire [7:0] tb_dout;
    wire tb_full;
    wire tb_empty;

    fifo uut (
        .clk(tb_clk),
        .rst_n(tb_rst_n),
        .wr_en(tb_wr_en),
        .rd_en(tb_rd_en),
        .din(tb_din),
        .dout(tb_dout),
        .full(tb_full),
        .empty(tb_empty)
    );

    always #10 tb_clk = ~tb_clk;

    task write_fifo(input [7:0] data);
        begin
            @(posedge tb_clk);
            #2;
            tb_wr_en = 1'b1;
            tb_din = data;
            @(posedge tb_clk);
            #2;
            tb_wr_en = 1'b0;
        end
    endtask

    task read_fifo;
        begin
            @(posedge tb_clk);
            #2;
            tb_rd_en = 1'b1;
            @(posedge tb_clk);
            #2;
            tb_rd_en = 1'b0;
        end
    endtask

    initial begin
        $monitor("Time=%0dns | clk=%b rst_n=%b | wr=%b rd=%b din=%h dout=%h | cnt=%d full=%b empty=%b", 
                 $time, tb_clk, tb_rst_n, tb_wr_en, tb_rd_en, tb_din, tb_dout, uut.fifo_cnt, tb_full, tb_empty);

        tb_clk = 1'b0; tb_rst_n = 1'b0; tb_wr_en = 1'b0; tb_rd_en = 1'b0; tb_din = 8'h00; #25;
        tb_rst_n = 1'b1; #10;

        // Write 3 values
        write_fifo(8'h11);
        write_fifo(8'h22);
        write_fifo(8'h33);
        #20;

        // Read 2 values
        read_fifo();
        read_fifo();
        #20;

        // Fill up the FIFO to assert FULL flag
        write_fifo(8'h44);
        write_fifo(8'h55);
        write_fifo(8'h66);
        write_fifo(8'h77);
        write_fifo(8'h88);
        write_fifo(8'h99);
        write_fifo(8'hAA); // should assert FULL
        #20;

        $finish;
    end

endmodule
