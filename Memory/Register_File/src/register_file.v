// Module: register_file
// Description: 8x8 Register File (1 write port, 2 read ports)
// Author: IgniteRTL Contributor

module register_file (
    input  wire clk,           // Clock input
    input  wire rst_n,         // Asynchronous active-low reset
    input  wire we,            // Write Enable (active-high)
    input  wire [2:0] wr_addr, // 3-bit Write Address
    input  wire [7:0] wr_data, // 8-bit Write Data
    input  wire [2:0] rd_addr_a, // 3-bit Read Address A
    input  wire [2:0] rd_addr_b, // 3-bit Read Address B
    output wire [7:0] rd_data_a, // 8-bit Read Data A
    output wire [7:0] rd_data_b  // 8-bit Read Data B
);

    reg [7:0] mem [7:0]; // 8 registers, each 8-bits wide
    integer i;

    // Synchronous Write Logic
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            for (i = 0; i < 8; i = i + 1) begin
                mem[i] <= 8'h00;
            end
        end else if (we) begin
            mem[wr_addr] <= wr_data;
        end
    end

    // Asynchronous (Combinational) Read Logic
    assign rd_data_a = mem[rd_addr_a];
    assign rd_data_b = mem[rd_addr_b];

endmodule
