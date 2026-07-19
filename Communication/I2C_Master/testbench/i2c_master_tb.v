// Module: i2c_master_tb
// Description: Testbench for I2C Master
// Author: IgniteRTL Contributor

`timescale 1ns / 1ps

module i2c_master_tb;

    reg  tb_clk;
    reg  tb_rst_n;
    reg  tb_start;
    reg  [6:0] tb_addr;
    reg  [7:0] tb_din;
    wire tb_done;
    wire tb_ack_error;

    // Bidirectional bus wires
    wire scl_wire;
    wire sda_wire;

    // Pull-up logic
    assign scl_wire = 1'bz;
    assign sda_wire = 1'bz;

    // Pull-up behavior simulated in testbench
    pullup(scl_wire);
    pullup(sda_wire);

    i2c_master uut (
        .clk(tb_clk),
        .rst_n(tb_rst_n),
        .start(tb_start),
        .addr(tb_addr),
        .din(tb_din),
        .done(tb_done),
        .ack_error(tb_ack_error),
        .scl(scl_wire),
        .sda(sda_wire)
    );

    // Emulate Slave ACK by pulling down sda_wire during ACK phase
    reg slave_ack;
    assign sda_wire = (slave_ack) ? 1'b0 : 1'bz;

    always #10 tb_clk = ~tb_clk;

    initial begin
        $monitor("Time=%0dns | clk=%b rst_n=%b | state=%b scl=%b sda=%b | done=%b ack_err=%b", 
                 $time, tb_clk, tb_rst_n, uut.state, scl_wire, sda_wire, tb_done, tb_ack_error);

        tb_clk = 1'b0; tb_rst_n = 1'b0; tb_start = 1'b0; tb_addr = 7'h50; tb_din = 8'hC3; slave_ack = 1'b0; #25;
        tb_rst_n = 1'b1; #10;

        // Trigger master
        @(posedge tb_clk);
        #2;
        tb_start = 1'b1;
        @(posedge tb_clk);
        #2;
        tb_start = 1'b0;

        // Enable slave_ack during the ACK phase (clock cycles when state is S_ACK)
        @(posedge (uut.state == uut.S_ACK));
        slave_ack = 1'b1;
        
        @(negedge (uut.state == uut.S_ACK));
        slave_ack = 1'b0;

        @(posedge tb_done);
        #40;

        $finish;
    end

endmodule
