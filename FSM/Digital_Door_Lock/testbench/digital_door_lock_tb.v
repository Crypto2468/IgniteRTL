// Module: digital_door_lock_tb
// Description: Testbench for Digital Door Lock
// Author: IgniteRTL Contributor

`timescale 1ns / 1ps

module digital_door_lock_tb;

    reg  tb_clk;
    reg  tb_rst_n;
    reg  [1:0] tb_digit;
    reg  tb_valid;
    wire tb_unlocked;
    wire tb_alarm;

    digital_door_lock uut (
        .clk(tb_clk),
        .rst_n(tb_rst_n),
        .digit(tb_digit),
        .valid(tb_valid),
        .unlocked(tb_unlocked),
        .alarm(tb_alarm)
    );

    always #10 tb_clk = ~tb_clk;

    task enter_digit(input [1:0] d);
        begin
            @(posedge tb_clk);
            #2;
            tb_digit = d;
            tb_valid = 1'b1;
            @(posedge tb_clk);
            #2;
            tb_valid = 1'b0;
        end
    endtask

    initial begin
        $monitor("Time=%0dns | clk=%b rst_n=%b | digit=%d valid=%b | state=%b | unlocked=%b alarm=%b", 
                 $time, tb_clk, tb_rst_n, tb_digit, tb_valid, uut.state, tb_unlocked, tb_alarm);

        // Test 1: Successful unlock
        tb_clk = 1'b0; tb_rst_n = 1'b0; tb_digit = 2'b00; tb_valid = 1'b0; #25;
        tb_rst_n = 1'b1; #10;

        enter_digit(2'b11); // Correct digit 3
        enter_digit(2'b01); // Correct digit 1
        enter_digit(2'b10); // Correct digit 2
        #40;

        // Test 2: Invalid attempt causing alarm
        tb_rst_n = 1'b0; #20; // reset
        tb_rst_n = 1'b1; #10;

        enter_digit(2'b11); // Correct 3
        enter_digit(2'b00); // WRONG 0 (should trigger alarm)
        #40;

        $finish;
    end

endmodule
