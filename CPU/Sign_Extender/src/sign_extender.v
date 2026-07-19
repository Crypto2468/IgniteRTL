// Module: sign_extender
// Description: Combinational sign extender converting 4-bit signed to 8-bit signed
// Author: IgniteRTL Contributor

module sign_extender (
    input  wire [3:0] din,  // 4-bit signed input value
    output wire [7:0] dout  // 8-bit sign-extended output value
);

    // Sign extension replicates the sign bit (MSB) to higher bits
    assign dout = {{4{din[3]}}, din};

endmodule
