// Module: parity_checker_tb
// Description: Testbench for Parity Checker
// Author: IgniteRTL Contributor

`timescale 1ns / 1ps

module parity_checker_tb;

    reg  [3:0] tb_data_in;
    reg        tb_parity;
    wire tb_error;

    // Instantiate the Design Under Test (DUT)
    parity_checker uut (
        .data_in(tb_data_in),
        .parity(tb_parity),
        .error(tb_error)
    );

    initial begin
        // Set up console monitor
        $monitor("Time=%0dns | Received Data=%b Parity=%b | Error Detected=%b", 
                 $time, tb_data_in, tb_parity, tb_error);

        // Apply stimuli (Even Parity cases)
        
        // Case 1: 0000 with parity 0 -> No Error
        tb_data_in = 4'b0000; tb_parity = 1'b0; #10;
        
        // Case 2: 0000 with parity 1 -> Error (odd number of 1s)
        tb_data_in = 4'b0000; tb_parity = 1'b1; #10;
        
        // Case 3: 0011 with parity 0 -> No Error
        tb_data_in = 4'b0011; tb_parity = 1'b0; #10;

        // Case 4: 0011 with parity 1 -> Error
        tb_data_in = 4'b0011; tb_parity = 1'b1; #10;

        // Case 5: 0111 with parity 1 -> No Error (four 1s)
        tb_data_in = 4'b0111; tb_parity = 1'b1; #10;

        // Case 6: 0111 with parity 0 -> Error (three 1s)
        tb_data_in = 4'b0111; tb_parity = 1'b0; #10;

        $finish;
    end

endmodule
