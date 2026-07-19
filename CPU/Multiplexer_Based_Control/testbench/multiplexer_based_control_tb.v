// Module: multiplexer_based_control_tb
// Description: Testbench for Multiplexer Based Control
// Author: IgniteRTL Contributor

`timescale 1ns / 1ps

module multiplexer_based_control_tb;

    reg  [1:0] tb_sel;
    reg  [7:0] tb_reg_data;
    reg  [7:0] tb_acc_data;
    reg  [7:0] tb_imm_data;
    wire [7:0] tb_mux_out;

    // Instantiate the DUT
    multiplexer_based_control uut (
        .sel(tb_sel),
        .reg_data(tb_reg_data),
        .acc_data(tb_acc_data),
        .imm_data(tb_imm_data),
        .mux_out(tb_mux_out)
    );

    initial begin
        $monitor("Time=%0dns | sel=%b | reg=%h acc=%h imm=%h | mux_out=%h", 
                 $time, tb_sel, tb_reg_data, tb_acc_data, tb_imm_data, tb_mux_out);

        // Prepare input lines
        tb_reg_data = 8'h11;
        tb_acc_data = 8'h22;
        tb_imm_data = 8'h33;

        // Select reg_data
        tb_sel = 2'b00; #10;

        // Select acc_data
        tb_sel = 2'b01; #10;

        // Select imm_data
        tb_sel = 2'b10; #10;

        $finish;
    end

endmodule
