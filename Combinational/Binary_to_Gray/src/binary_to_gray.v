// Module: binary_to_gray
// Description: 4-bit Binary to Gray Code Converter using dataflow modeling
// Author: IgniteRTL Contributor

module binary_to_gray (
    input  wire [3:0] bin,  // 4-bit Binary input
    output wire [3:0] gray // 4-bit Gray code output
);

    // Gray code conversion equations:
    // MSB remains the same. Subsequent bits are XORed with their left neighbor.
    assign gray[3] = bin[3];
    assign gray[2] = bin[3] ^ bin[2];
    assign gray[1] = bin[2] ^ bin[1];
    assign gray[0] = bin[1] ^ bin[0];

endmodule
