// Module: sign_extender_tb
// Description: Testbench for Sign Extender
// Author: IgniteRTL Contributor

`timescale 1ns / 1ps

module sign_extender_tb;

    reg  [3:0] tb_din;
    wire [7:0] tb_dout;

    // Instantiate the DUT
    sign_extender uut (
        .din(tb_din),
        .dout(tb_dout)
    );

    initial begin
        $monitor("Time=%0dns | din=%b (hex=%h) | dout=%b (hex=%h)", 
                 $time, tb_din, tb_din, tb_dout, tb_dout);

        // Test positive value (MSB = 0)
        tb_din = 4'h5; #10;

        // Test negative value (MSB = 1)
        tb_din = 4'hB; #10;

        // Test max positive (7)
        tb_din = 4'h7; #10;

        // Test max negative (8)
        tb_din = 4'h8; #10;

        $finish;
    end

endmodule
