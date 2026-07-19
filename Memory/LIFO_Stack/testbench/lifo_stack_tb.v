// Module: lifo_stack_tb
// Description: Testbench for LIFO Stack
// Author: IgniteRTL Contributor

`timescale 1ns / 1ps

module lifo_stack_tb;

    reg  tb_clk;
    reg  tb_rst_n;
    reg  tb_push;
    reg  tb_pop;
    reg  [7:0] tb_din;
    wire [7:0] tb_dout;
    wire tb_full;
    wire tb_empty;

    lifo_stack uut (
        .clk(tb_clk),
        .rst_n(tb_rst_n),
        .push(tb_push),
        .pop(tb_pop),
        .din(tb_din),
        .dout(tb_dout),
        .full(tb_full),
        .empty(tb_empty)
    );

    always #10 tb_clk = ~tb_clk;

    task push_stack(input [7:0] data);
        begin
            @(posedge tb_clk);
            #2;
            tb_push = 1'b1;
            tb_din = data;
            @(posedge tb_clk);
            #2;
            tb_push = 1'b0;
        end
    endtask

    task pop_stack;
        begin
            @(posedge tb_clk);
            #2;
            tb_pop = 1'b1;
            @(posedge tb_clk);
            #2;
            tb_pop = 1'b0;
        end
    endtask

    initial begin
        $monitor("Time=%0dns | clk=%b rst_n=%b | push=%b pop=%b din=%h dout=%h | sp=%d full=%b empty=%b", 
                 $time, tb_clk, tb_rst_n, tb_push, tb_pop, tb_din, tb_dout, uut.sp, tb_full, tb_empty);

        tb_clk = 1'b0; tb_rst_n = 1'b0; tb_push = 1'b0; tb_pop = 1'b0; tb_din = 8'h00; #25;
        tb_rst_n = 1'b1; #10;

        // Push 3 values
        push_stack(8'h11);
        push_stack(8'h22);
        push_stack(8'h33);
        #20;

        // Pop values (should arrive in reverse: 33, then 22)
        pop_stack();
        pop_stack();
        #20;

        // Push another value
        push_stack(8'h44);
        pop_stack();
        #20;

        $finish;
    end

endmodule
