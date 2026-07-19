// Module: automatic_gate_controller_tb
// Description: Testbench for Automatic Gate Controller
// Author: IgniteRTL Contributor

`timescale 1ns / 1ps

module automatic_gate_controller_tb;

    reg  tb_clk;
    reg  tb_rst_n;
    reg  tb_sensor_open;
    reg  tb_limit_open;
    reg  tb_limit_close;
    reg  tb_obstacle;
    wire tb_motor_open;
    wire tb_motor_close;
    wire tb_warning_led;

    automatic_gate_controller uut (
        .clk(tb_clk),
        .rst_n(tb_rst_n),
        .sensor_open(tb_sensor_open),
        .limit_open(tb_limit_open),
        .limit_close(tb_limit_close),
        .obstacle(tb_obstacle),
        .motor_open(tb_motor_open),
        .motor_close(tb_motor_close),
        .warning_led(tb_warning_led)
    );

    always #10 tb_clk = ~tb_clk;

    initial begin
        $monitor("Time=%0dns | state=%b motor_open=%b motor_close=%b | sensor_open=%b limit_open=%b limit_close=%b obstacle=%b warning=%b", 
                 $time, uut.state, tb_motor_open, tb_motor_close, tb_sensor_open, tb_limit_open, tb_limit_close, tb_obstacle, tb_warning_led);

        tb_clk = 1'b0; tb_rst_n = 1'b0;
        tb_sensor_open = 1'b0; tb_limit_open = 1'b0; tb_limit_close = 1'b1; tb_obstacle = 1'b0;
        #25;
        tb_rst_n = 1'b1; #10;

        // Car approaches
        tb_sensor_open = 1'b1; tb_limit_close = 1'b0; #20;
        tb_sensor_open = 1'b0; #20;

        // Gate opens fully
        tb_limit_open = 1'b1; #20;
        tb_limit_open = 1'b0; #140; // Stay open timer cycles through

        // Gate starts closing
        // Obstacle detected! (should retract to opening)
        tb_obstacle = 1'b1; #20;
        tb_obstacle = 1'b0; #20;
        tb_limit_open = 1'b1; #20; // open limit switch hit again
        tb_limit_open = 1'b0; #140;
        
        // Gate closes fully
        tb_limit_close = 1'b1; #20;

        $finish;
    end

endmodule
