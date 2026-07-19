// Module: register_file
// Description: GPR register file for CPU data path (4 registers of 8-bit width)
// Author: IgniteRTL Contributor

module register_file (
    input  wire clk,            // Clock input
    input  wire rst_n,          // Asynchronous active-low reset
    input  wire we,             // Write Enable
    input  wire [1:0] wr_addr,  // 2-bit Write Address
    input  wire [7:0] wr_data,  // 8-bit Write Data
    input  wire [1:0] rd_addr_a, // 2-bit Read Address A
    input  wire [1:0] rd_addr_b, // 2-bit Read Address B
    output wire [7:0] rd_data_a, // 8-bit Read Data A
    output wire [7:0] rd_data_b  // 8-bit Read Data B
);

    reg [7:0] regs [3:0]; // 4 registers of 8-bit width
    integer i;

    // Synchronous write logic
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            for (i = 0; i < 4; i = i + 1) begin
                regs[i] <= 8'h00;
            end
        end else if (we) begin
            regs[wr_addr] <= wr_data;
        end
    end

    // Asynchronous read logic
    assign rd_data_a = regs[rd_addr_a];
    assign rd_data_b = regs[rd_addr_b];

endmodule
