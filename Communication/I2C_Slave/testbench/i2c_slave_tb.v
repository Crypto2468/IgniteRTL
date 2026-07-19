// Module: i2c_slave_tb
// Description: Testbench for I2C Slave
// Author: IgniteRTL Contributor

`timescale 1ns / 1ps

module i2c_slave_tb;

    reg  tb_rst_n;
    reg  tb_scl;
    reg  [7:0] tb_rx_data;
    wire [7:0] tb_rx_data_out;
    wire tb_rx_done;

    // Bidirectional sda simulation wire
    wire sda_wire;
    reg  master_sda;
    assign sda_wire = (master_sda) ? 1'b0 : 1'bz;

    pullup(sda_wire);

    i2c_slave #(
        .SLAVE_ADDR(7'h50)
    ) uut (
        .rst_n(tb_rst_n),
        .rx_data(tb_rx_data_out),
        .rx_done(tb_rx_done),
        .scl(tb_scl),
        .sda(sda_wire)
    );

    task send_start;
        begin
            master_sda = 1'b0; // Sda falls while scl high
            #10;
        end
    endtask

    task send_bit(input bit_val);
        begin
            tb_scl = 1'b0;
            master_sda = !bit_val; // active-low open drain representation
            #10;
            tb_scl = 1'b1;
            #10;
        end
    endtask

    initial begin
        $monitor("Time=%0dns | scl=%b sda=%b | state=%b rx_data=%h rx_done=%b", 
                 $time, tb_scl, sda_wire, uut.state, tb_rx_data_out, tb_rx_done);

        tb_rst_n = 1'b0; tb_scl = 1'b1; master_sda = 1'b0; #25;
        tb_rst_n = 1'b1; master_sda = 1'b0; #10; // Start release

        // Send START condition
        send_start();

        // Send address 7'h50 (binary 1010000) + write mode (0)
        send_bit(1);
        send_bit(0);
        send_bit(1);
        send_bit(0);
        send_bit(0);
        send_bit(0);
        send_bit(0);
        send_bit(0);

        // 9th Clock cycle: Read ACK pulled down by slave
        tb_scl = 1'b0; master_sda = 1'b0; #10;
        tb_scl = 1'b1; #10;

        // Send data byte 8'hA5 (binary 10100101)
        send_bit(1);
        send_bit(0);
        send_bit(1);
        send_bit(0);
        send_bit(0);
        send_bit(1);
        send_bit(0);
        send_bit(1);

        // Read ACK
        tb_scl = 1'b0; master_sda = 1'b0; #10;
        tb_scl = 1'b1; #10;

        #40;
        $finish;
    end

endmodule
