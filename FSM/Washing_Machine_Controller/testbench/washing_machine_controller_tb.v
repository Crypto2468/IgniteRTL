// Module: washing_machine_controller_tb
// Description: Testbench for Washing Machine Controller
// Author: IgniteRTL Contributor

`timescale 1ns / 1ps

module washing_machine_controller_tb;

    reg  tb_clk;
    reg  tb_rst_n;
    reg  tb_start;
    reg  tb_cycle_complete;
    wire tb_water_inlet;
    wire tb_agitator;
    wire tb_pump_out;
    wire tb_spin_dry;

    washing_machine_controller uut (
        .clk(tb_clk),
        .rst_n(tb_rst_n),
        .start(tb_start),
        .cycle_complete(tb_cycle_complete),
        .water_inlet(tb_water_inlet),
        .agitator(tb_agitator),
        .pump_out(tb_pump_out),
        .spin_dry(tb_spin_dry)
    );

    always #10 tb_clk = ~tb_clk;

    task complete_cycle;
        begin
            @(posedge tb_clk);
            #2;
            tb_cycle_complete = 1'b1;
            @(posedge tb_clk);
            #2;
            tb_cycle_complete = 1'b0;
        end
    endtask

    initial begin
        $monitor("Time=%0dns | clk=%b rst_n=%b | state=%b start=%b complete=%b | inlet=%b agitator=%b pump=%b spin=%b", 
                 $time, tb_clk, tb_rst_n, uut.state, tb_start, tb_cycle_complete, tb_water_inlet, tb_agitator, tb_pump_out, tb_spin_dry);

        tb_clk = 1'b0; tb_rst_n = 1'b0; tb_start = 1'b0; tb_cycle_complete = 1'b0; #25;
        tb_rst_n = 1'b1; #10;

        // Start cycle
        tb_start = 1'b1; #20;
        tb_start = 1'b0; #20;

        // Sequence through states
        complete_cycle(); // FILL -> WASH
        #40;
        complete_cycle(); // WASH -> RINSE
        #40;
        complete_cycle(); // RINSE -> SPIN
        #40;
        complete_cycle(); // SPIN -> IDLE
        #40;

        $finish;
    end

endmodule
