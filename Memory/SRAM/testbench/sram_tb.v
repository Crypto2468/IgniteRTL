// Module: sram_tb
// Description: Testbench for SRAM with Bidirectional Data Bus
// Author: IgniteRTL Contributor

`timescale 1ns / 1ps

module sram_tb;

    reg  tb_clk;
    reg  tb_cs_n;
    reg  tb_we_n;
    reg  tb_oe_n;
    reg  [3:0] tb_addr;
    
    // Bidirectional bus handling
    reg  [7:0] tb_data_out;
    wire [7:0] tb_data;

    // Drive bus when writing, high-z when reading
    assign tb_data = (!tb_cs_n && !tb_we_n) ? tb_data_out : 8'hzz;

    sram uut (
        .clk(tb_clk),
        .cs_n(tb_cs_n),
        .we_n(tb_we_n),
        .oe_n(tb_oe_n),
        .addr(tb_addr),
        .data(tb_data)
    );

    always #10 tb_clk = ~tb_clk;

    initial begin
        $monitor("Time=%0dns | clk=%b | cs_n=%b we_n=%b oe_n=%b | addr=%h | data=%h", 
                 $time, tb_clk, tb_cs_n, tb_we_n, tb_oe_n, tb_addr, tb_data);

        // Initialize signals
        tb_clk = 1'b0;
        tb_cs_n = 1'b1; // Disabled
        tb_we_n = 1'b1;
        tb_oe_n = 1'b1;
        tb_addr = 4'h0;
        tb_data_out = 8'h00;
        #25;

        // Write 8'h3C to address 0x5
        tb_cs_n = 1'b0; tb_we_n = 1'b0; tb_addr = 4'h5; tb_data_out = 8'h3C; #20;

        // Write 8'hC3 to address 0xA
        tb_addr = 4'hA; tb_data_out = 8'hC3; #20;

        // Disable write, enable read from address 0x5
        tb_we_n = 1'b1; tb_oe_n = 1'b0; tb_addr = 4'h5; #20;

        // Read from address 0xA
        tb_addr = 4'hA; #20;

        // Disable chip (bus should go high impedance 'zz')
        tb_cs_n = 1'b1; #20;

        $finish;
    end

endmodule
