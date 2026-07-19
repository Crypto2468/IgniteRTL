// Module: uart_rx_tb
// Description: Testbench for UART Receiver
// Author: IgniteRTL Contributor

`timescale 1ns / 1ps

module uart_rx_tb;

    reg  tb_clk;
    reg  tb_rst_n;
    reg  tb_rx;
    wire [7:0] tb_dout;
    wire tb_rx_done;

    uart_rx #(
        .CLKS_PER_BIT(8)
    ) uut (
        .clk(tb_clk),
        .rst_n(tb_rst_n),
        .rx(tb_rx),
        .dout(tb_dout),
        .rx_done(tb_rx_done)
    );

    always #10 tb_clk = ~tb_clk;

    task send_serial_byte(input [7:0] data);
        integer i;
        begin
            // Start Bit (low)
            tb_rx = 1'b0;
            repeat(8) @(posedge tb_clk);
            
            // 8 Data Bits (LSB first)
            for (i = 0; i < 8; i = i + 1) begin
                tb_rx = data[i];
                repeat(8) @(posedge tb_clk);
            end
            
            // Stop Bit (high)
            tb_rx = 1'b1;
            repeat(8) @(posedge tb_clk);
        end
    endtask

    initial begin
        $monitor("Time=%0dns | clk=%b rst_n=%b | rx=%b | state=%b clk_cnt=%d bit_idx=%d | dout=%h rx_done=%b", 
                 $time, tb_clk, tb_rst_n, tb_rx, uut.state, uut.clk_cnt, uut.bit_idx, tb_dout, tb_rx_done);

        tb_clk = 1'b0; tb_rst_n = 1'b0; tb_rx = 1'b1; #25;
        tb_rst_n = 1'b1; #10;

        // Send 8'hA5 (binary 10100101)
        send_serial_byte(8'hA5);
        #40;

        // Send 8'h5A (binary 01011010)
        send_serial_byte(8'h5A);
        #40;

        $finish;
    end

endmodule
