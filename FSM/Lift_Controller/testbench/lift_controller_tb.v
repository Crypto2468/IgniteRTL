// Module: lift_controller_tb
// Description: Testbench for Lift Queue Controller
// Author: IgniteRTL Contributor

`timescale 1ns / 1ps

module lift_controller_tb;

    reg  tb_clk;
    reg  tb_rst_n;
    reg  [2:0] tb_req_floors;
    wire [1:0] tb_current_floor;
    wire tb_motor_up;
    wire tb_motor_down;
    wire tb_door_open;

    lift_controller uut (
        .clk(tb_clk),
        .rst_n(tb_rst_n),
        .req_floors(tb_req_floors),
        .current_floor(tb_current_floor),
        .motor_up(tb_motor_up),
        .motor_down(tb_motor_down),
        .door_open(tb_door_open)
    );

    always #10 tb_clk = ~tb_clk;

    initial begin
        $monitor("Time=%0dns | state=%b current_floor=%d req_floors=%b | motor_up=%b motor_down=%b door_open=%b", 
                 $time, uut.state, tb_current_floor, tb_req_floors, tb_motor_up, tb_motor_down, tb_door_open);

        tb_clk = 1'b0; tb_rst_n = 1'b0; tb_req_floors = 3'b000; #25;
        tb_rst_n = 1'b1; #10;

        // Request Floor 1 and Floor 2
        tb_req_floors = 3'b110; #120;

        // Clear Floor 1 request and see cabin move to Floor 2
        tb_req_floors = 3'b100; #100;

        // Clear all requests
        tb_req_floors = 3'b000; #40;

        $finish;
    end

endmodule
