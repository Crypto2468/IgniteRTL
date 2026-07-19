// Module: traffic_light_controller_tb
// Description: Testbench for Traffic Light Controller
// Author: IgniteRTL Contributor

`timescale 1ns / 1ps

module traffic_light_controller_tb;

    reg  tb_clk;
    reg  tb_rst_n;
    wire [2:0] tb_ns_light;
    wire [2:0] tb_ew_light;

    traffic_light_controller uut (
        .clk(tb_clk),
        .rst_n(tb_rst_n),
        .ns_light(tb_ns_light),
        .ew_light(tb_ew_light)
    );

    always #10 tb_clk = ~tb_clk;

    initial begin
        $monitor("Time=%0dns | clk=%b rst_n=%b | state=%b timer=%d | NS_light(R/Y/G)=%b EW_light(R/Y/G)=%b", 
                 $time, tb_clk, tb_rst_n, uut.state, uut.timer, tb_ns_light, tb_ew_light);

        tb_clk = 1'b0; tb_rst_n = 1'b0; #25;
        tb_rst_n = 1'b1; #300; // Let it run for 15 clock cycles

        $finish;
    end

endmodule
