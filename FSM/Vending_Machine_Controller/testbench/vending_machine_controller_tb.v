// Module: vending_machine_controller_tb
// Description: Testbench for Vending Machine Controller
// Author: IgniteRTL Contributor

`timescale 1ns / 1ps

module vending_machine_controller_tb;

    reg  tb_clk;
    reg  tb_rst_n;
    reg  [1:0] tb_coin;
    wire tb_dispense;
    wire tb_change_out;

    vending_machine_controller uut (
        .clk(tb_clk),
        .rst_n(tb_rst_n),
        .coin(tb_coin),
        .dispense(tb_dispense),
        .change_out(tb_change_out)
    );

    always #10 tb_clk = ~tb_clk;

    task insert_coin(input [1:0] c);
        begin
            @(posedge tb_clk);
            #2;
            tb_coin = c;
            @(posedge tb_clk);
            #2;
            tb_coin = 2'b00;
        end
    endtask

    initial begin
        $monitor("Time=%0dns | clk=%b rst_n=%b | coin=%b | state=%b | dispense=%b change_out=%b", 
                 $time, tb_clk, tb_rst_n, tb_coin, uut.state, tb_dispense, tb_change_out);

        tb_clk = 1'b0; tb_rst_n = 1'b0; tb_coin = 2'b00; #25;
        tb_rst_n = 1'b1; #10;

        // Test 1: Three 50c coins (dispense = 1, change_out = 0)
        insert_coin(2'b01);
        insert_coin(2'b01);
        insert_coin(2'b01);
        #40;

        // Test 2: One 100c and one 50c coin (dispense = 1, change_out = 0)
        insert_coin(2'b10);
        insert_coin(2'b01);
        #40;

        // Test 3: Two 100c coins (dispense = 1, change_out = 1)
        insert_coin(2'b10);
        insert_coin(2'b10);
        #40;

        $finish;
    end

endmodule
