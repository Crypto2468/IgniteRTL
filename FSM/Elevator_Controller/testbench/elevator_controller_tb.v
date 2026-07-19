// Module: elevator_controller_tb
// Description: Testbench for Elevator Controller
// Author: IgniteRTL Contributor

`timescale 1ns / 1ps

module elevator_controller_tb;

    reg  tb_clk;
    reg  tb_rst_n;
    reg  [1:0] tb_req_floor;
    wire [1:0] tb_current_floor;
    wire tb_motor_up;
    wire tb_motor_down;
    wire tb_door_open;

    elevator_controller uut (
        .clk(tb_clk),
        .rst_n(tb_rst_n),
        .req_floor(tb_req_floor),
        .current_floor(tb_current_floor),
        .motor_up(tb_motor_up),
        .motor_down(tb_motor_down),
        .door_open(tb_door_open)
    );

    always #10 tb_clk = ~tb_clk;

    initial begin
        $monitor("Time=%0dns | clk=%b rst_n=%b | state=%b current_floor=%d req_floor=%d | motor_up=%b motor_down=%b door_open=%b", 
                 $time, tb_clk, tb_rst_n, uut.state, tb_current_floor, tb_req_floor, tb_motor_up, tb_motor_down, tb_door_open);

        tb_clk = 1'b0; tb_rst_n = 1'b0; tb_req_floor = 2'b00; #25;
        tb_rst_n = 1'b1; #10;

        // Request Floor 2 (Elevator should go up, step by step)
        tb_req_floor = 2'b10; #100;

        // Request Floor 1 (Elevator should descend)
        tb_req_floor = 2'b01; #100;

        $finish;
    end

endmodule
