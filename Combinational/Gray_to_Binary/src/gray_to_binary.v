// Module: gray_to_binary
// Description: 4-bit Gray to Binary Code Converter using dataflow modeling
// Author: IgniteRTL Contributor

module gray_to_binary (
    input  wire [3:0] gray, // 4-bit Gray code input
    output wire [3:0] bin   // 4-bit Binary output
);

    // Gray to Binary conversion equations:
    // MSB remains the same. Subsequent binary bits are the XOR of the 
    // previous binary bit and the current Gray code bit.
    assign bin[3] = gray[3];
    assign bin[2] = bin[3] ^ gray[2];
    assign bin[1] = bin[2] ^ gray[1];
    assign bin[0] = bin[1] ^ gray[0];

endmodule
