// =============================================================================
// Project Name: IgniteRTL
// File Name:    booth_multiplier.v
// Description:  Parameterized sequential Radix-2 signed Booth Multiplier. 
//               Computes the signed 2N-bit product of two N-bit inputs (a, b) 
//               in two's complement representation.
//
// Author:       IgniteRTL Contributor
// Date:         2026-07-19
// Version:      1.0
// =============================================================================

module booth_multiplier #(
    parameter WIDTH = 8 // Default operand bit width
)(
    input  wire                 clk,     // System Clock
    input  wire                 rst_n,   // Active-low asynchronous reset
    input  wire                 start,   // Start multiplication control
    input  wire [WIDTH-1:0]     a,       // Multiplicand input (signed)
    input  wire [WIDTH-1:0]     b,       // Multiplier input (signed)
    output reg  [2*WIDTH-1:0]   product, // 2N-bit signed product output
    output reg                  ready,   // Ready for next inputs
    output reg                  done     // Output valid completion flag
);

    // FSM States
    localparam STATE_IDLE  = 2'b00;
    localparam STATE_MULT  = 2'b01;
    localparam STATE_DONE  = 2'b10;

    reg [1:0]             state;
    reg [WIDTH-1:0]       a_reg;          // Multiplicand register
    reg [WIDTH-1:0]       q_reg;          // Multiplier register
    reg                   q_minus_one;    // Q_-1 bit register
    reg [WIDTH-1:0]       accum;          // Accumulator A register
    reg [15:0]            count;          // Cycle counter

    // Combinational next value of accumulator
    reg [WIDTH-1:0]       next_accum;

    always @(*) begin
        case ({q_reg[0], q_minus_one})
            2'b10:   next_accum = accum - a_reg;
            2'b01:   next_accum = accum + a_reg;
            default: next_accum = accum;
        endcase
    end

    // Sequential logic
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state            <= STATE_IDLE;
            a_reg            <= 0;
            q_reg            <= 0;
            q_minus_one      <= 1'b0;
            accum            <= 0;
            count            <= 0;
            product          <= 0;
            ready            <= 1'b1;
            done             <= 1'b0;
        end else begin
            case (state)
                STATE_IDLE: begin
                    done  <= 1'b0;
                    ready <= 1'b1;
                    if (start) begin
                        a_reg       <= a;
                        q_reg       <= b;
                        q_minus_one <= 1'b0;
                        accum       <= 0;
                        count       <= 0;
                        ready       <= 1'b0;
                        state       <= STATE_MULT;
                    end
                end

                STATE_MULT: begin
                    // Perform 1-bit arithmetic right shift of {accum, q_reg, q_minus_one}
                    accum       <= {next_accum[WIDTH-1], next_accum[WIDTH-1:1]};
                    q_reg       <= {next_accum[0], q_reg[WIDTH-1:1]};
                    q_minus_one <= q_reg[0];
                    count       <= count + 1;

                    if (count == WIDTH - 1) begin
                        state <= STATE_DONE;
                    end
                end

                STATE_DONE: begin
                    // Register the final shifted result
                    product <= {accum, q_reg};
                    done    <= 1'b1;
                    ready   <= 1'b0;
                    state   <= STATE_IDLE;
                end

                default: state <= STATE_IDLE;
            endcase
        end
    end

endmodule
