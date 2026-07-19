// Module: bcd_adder
// Description: 1-digit BCD Adder using behavioral modeling
// Author: IgniteRTL Contributor

module bcd_adder (
    input  wire [3:0] a,    // 4-bit BCD input operand A
    input  wire [3:0] b,    // 4-bit BCD input operand B
    input  wire       cin,  // Carry-in
    output reg  [3:0] sum,  // 4-bit BCD sum output
    output reg        cout  // Carry-out output
);

    reg [4:0] sum_temp;

    always @(*) begin
        sum_temp = a + b + cin;
        // BCD sums > 9 require addition of 6 to adjust back to active BCD range
        if (sum_temp > 5'd9) begin
            sum = sum_temp[3:0] + 4'd6;
            cout = 1'b1;
        end else begin
            sum = sum_temp[3:0];
            cout = 1'b0;
        end
    end

endmodule
