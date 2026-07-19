// Module: sequence_detector_moore_tb
// Description: Testbench for Moore 1011 Sequence Detector
// Author: IgniteRTL Contributor

`timescale 1ns / 1ps

module sequence_detector_moore_tb;

    reg  tb_clk;
    reg  tb_rst_n;
    reg  tb_din;
    wire tb_dout;

    sequence_detector_moore uut (
        .clk(tb_clk),
        .rst_n(tb_rst_n),
        .din(tb_din),
        .dout(tb_dout)
    );

    always #10 tb_clk = ~tb_clk;

    task send_bit(input bit_val);
        begin
            @(posedge tb_clk);
            #2;
            tb_din = bit_val;
        end
    endtask

    initial begin
        $monitor("Time=%0dns | clk=%b rst_n=%b | din=%b | state=%b | dout=%b", 
                 $time, tb_clk, tb_rst_n, tb_din, uut.state, tb_dout);

        tb_clk = 1'b0; tb_rst_n = 1'b0; tb_din = 1'b0; #25;
        tb_rst_n = 1'b1; #10;

        // Apply stream: 1011
        send_bit(1);
        send_bit(0);
        send_bit(1);
        send_bit(1); // sequence completes here, output high on next clock edge

        // Overlapping check stream: 1011011
        send_bit(0);
        send_bit(1);
        send_bit(1);
        send_bit(0);
        send_bit(1);
        send_bit(1);
        
        #40;
        $finish;
    end

endmodule
