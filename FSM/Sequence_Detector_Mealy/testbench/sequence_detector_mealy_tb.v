// Module: sequence_detector_mealy_tb
// Description: Testbench for Mealy 1011 Sequence Detector
// Author: IgniteRTL Contributor

`timescale 1ns / 1ps

module sequence_detector_mealy_tb;

    reg  tb_clk;
    reg  tb_rst_n;
    reg  tb_din;
    wire tb_dout;

    // Instantiate the DUT
    sequence_detector_mealy uut (
        .clk(tb_clk),
        .rst_n(tb_rst_n),
        .din(tb_din),
        .dout(tb_dout)
    );

    // Clock generator (50MHz / 20ns period)
    always #10 tb_clk = ~tb_clk;

    // Task to apply serial bit
    task send_bit(input bit_val);
        begin
            @(posedge tb_clk);
            #2; // Small delay after edge
            tb_din = bit_val;
        end
    endtask

    initial begin
        // Setup console monitoring
        $monitor("Time=%0dns | clk=%b rst_n=%b | din=%b | state=%b next_state=%b | dout=%b", 
                 $time, tb_clk, tb_rst_n, tb_din, uut.state, uut.next_state, tb_dout);

        // Initialize signals
        tb_clk = 1'b0;
        tb_rst_n = 1'b0; // Assert reset
        tb_din = 1'b0;
        #25;

        tb_rst_n = 1'b1; // Release reset
        #10;

        // Apply test vector to check single sequence: 1011
        send_bit(1); // S_RESET -> S_1
        send_bit(0); // S_1     -> S_10
        send_bit(1); // S_10    -> S_101
        send_bit(1); // S_101   -> S_1 (dout = 1)
        
        // Wait and clear
        send_bit(0); // S_1     -> S_10
        send_bit(0); // S_10    -> S_RESET
        #40;

        // Apply test vector to check overlapping: 1011011
        send_bit(1); // S_RESET -> S_1
        send_bit(0); // S_1     -> S_10
        send_bit(1); // S_10    -> S_101
        send_bit(1); // S_101   -> S_1 (dout = 1)
        send_bit(0); // S_1     -> S_10
        send_bit(1); // S_10    -> S_101
        send_bit(1); // S_101   -> S_1 (dout = 1)

        #40;
        $finish;
    end

endmodule
