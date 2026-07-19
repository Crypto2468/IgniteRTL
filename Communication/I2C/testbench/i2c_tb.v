// Module: i2c_tb
// Description: Testbench verifying local loopback master-slave I2C system
// Author: IgniteRTL Contributor

`timescale 1ns / 1ps

module i2c_tb;

    reg  tb_clk;
    reg  tb_rst_n;
    reg  tb_master_start;
    reg  [6:0] tb_master_addr;
    reg  [7:0] tb_master_din;
    wire tb_master_done;
    wire tb_master_ack_err;
    wire [7:0] tb_slave_rx;
    wire tb_slave_done;

    i2c uut (
        .clk(tb_clk),
        .rst_n(tb_rst_n),
        .master_start(tb_master_start),
        .master_addr(tb_master_addr),
        .master_din(tb_master_din),
        .master_done(tb_master_done),
        .master_ack_err(tb_master_ack_err),
        .slave_rx(tb_slave_rx),
        .slave_done(tb_slave_done)
    );

    always #10 tb_clk = ~tb_clk;

    initial begin
        $monitor("Time=%0dns | clk=%b rst_n=%b | m_start=%b m_addr=%h m_din=%h m_done=%b ack_err=%b | s_rx=%h s_done=%b", 
                 $time, tb_clk, tb_rst_n, tb_master_start, tb_master_addr, tb_master_din, tb_master_done, tb_master_ack_err, tb_slave_rx, tb_slave_done);

        tb_clk = 1'b0; tb_rst_n = 1'b0; tb_master_start = 1'b0; tb_master_addr = 7'h50; tb_master_din = 8'hA5; #25;
        tb_rst_n = 1'b1; #10;

        // Perform I2C Write to Slave address 7'h50
        @(posedge tb_clk);
        #2;
        tb_master_start = 1'b1;
        @(posedge tb_clk);
        #2;
        tb_master_start = 1'b0;

        @(posedge tb_master_done);
        #40;

        $finish;
    end

endmodule
