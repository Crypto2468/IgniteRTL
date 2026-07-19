// Module: rom_tb
// Description: Testbench for 16x8 Synchronous ROM
// Author: IgniteRTL Contributor

`timescale 1ns / 1ps

module rom_tb;

    reg  tb_clk;
    reg  tb_en;
    reg  [3:0] tb_addr;
    wire [7:0] tb_data;

    // Instantiate the DUT
    rom uut (
        .clk(tb_clk),
        .en(tb_en),
        .addr(tb_addr),
        .data(tb_data)
    );

    // Clock generator (50MHz / 20ns period)
    always #10 tb_clk = ~tb_clk;

    initial begin
        $monitor("Time=%0dns | clk=%b en=%b | addr=%h | data=%h", 
                 $time, tb_clk, tb_en, tb_addr, tb_data);

        // Initialize inputs
        tb_clk = 1'b0;
        tb_en = 1'b0;
        tb_addr = 4'h0;
        #15; // Wait past first clock edge

        // Enable ROM and read address 0x0
        tb_en = 1'b1; tb_addr = 4'h0; #20;

        // Read multiple addresses
        tb_addr = 4'h1; #20;
        tb_addr = 4'h2; #20;
        tb_addr = 4'h5; #20;
        tb_addr = 4'hF; #20;

        // Disable ROM (data output should hold previous read value 8'h0F)
        tb_en = 1'b0; tb_addr = 4'h3; #20;

        // Re-enable ROM and read address 0x3
        tb_en = 1'b1; #20;
        tb_addr = 4'hA; #20;

        $finish;
    end

endmodule
