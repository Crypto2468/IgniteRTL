// =============================================================================
// Project Name: IgniteRTL
// File Name:    restoring_divider.v
// Description:  Parameterized sequential Restoring Divider. Computes the 
//               N-bit quotient and N-bit remainder of unsigned division 
//               (dividend / divisor) using a restoring FSM. Includes division-
//               by-zero detection.
//
// Author:       IgniteRTL Contributor
// Date:         2026-07-19
// Version:      1.0
// =============================================================================

module restoring_divider #(
    parameter WIDTH = 8 // Default operand bit width
)(
    input  wire                 clk,       // System Clock
    input  wire                 rst_n,     // Active-low asynchronous reset
    input  wire                 start,     // Start division control
    input  wire [WIDTH-1:0]     dividend,  // Dividend input operand
    input  wire [WIDTH-1:0]     divisor,   // Divisor input operand
    output reg  [WIDTH-1:0]     quotient,  // N-bit Quotient output
    output reg  [WIDTH-1:0]     remainder, // N-bit Remainder output
    output reg                  ready,     // Ready for next inputs
    output reg                  done,      // Output valid completion flag
    output reg                  div_by_zero // Division-by-zero error flag
);

    // FSM States
    localparam STATE_IDLE  = 2'b00;
    localparam STATE_DIV   = 2'b01;
    localparam STATE_DONE  = 2'b10;

    reg [2:0]             state;
    reg [WIDTH-1:0]       a_reg;       // Accumulator register (holds partial remainder)
    reg [WIDTH-1:0]       q_reg;       // Quotient register (holds partial dividend/quotient)
    reg [WIDTH-1:0]       m_reg;       // Divisor register
    reg [15:0]            count;       // Counter

    // Internal wires for shift and subtract step
    wire [WIDTH-1:0]      next_a;
    wire [WIDTH-1:0]      sub_a;

    // Shift left combined {a_reg, q_reg} by 1
    assign next_a = {a_reg[WIDTH-2:0], q_reg[WIDTH-1]};
    assign sub_a  = next_a - m_reg;

    // Sequential logic
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state       <= STATE_IDLE;
            a_reg       <= 0;
            q_reg       <= 0;
            m_reg       <= 0;
            count       <= 0;
            quotient    <= 0;
            remainder   <= 0;
            ready       <= 1'b1;
            done        <= 1'b0;
            div_by_zero <= 1'b0;
        end else begin
            case (state)
                STATE_IDLE: begin
                    done <= 1'b0;
                    if (start) begin
                        ready <= 1'b0;
                        if (divisor == 0) begin
                            // Division by zero handler
                            quotient    <= {WIDTH{1'b1}}; // Return all 1s
                            remainder   <= 0;
                            div_by_zero <= 1'b1;
                            done        <= 1'b1;
                            state       <= STATE_DONE;
                        end else begin
                            a_reg       <= 0;
                            q_reg       <= dividend;
                            m_reg       <= divisor;
                            count       <= 0;
                            div_by_zero <= 1'b0;
                            state       <= STATE_DIV;
                        end
                    end else begin
                        ready <= 1'b1;
                    end
                end

                STATE_DIV: begin
                    // Shift and subtract logic
                    if (sub_a[WIDTH-1]) begin
                        // sub_a is negative (MSB is 1): restore, set quotient bit to 0
                        a_reg <= next_a;
                        q_reg <= {q_reg[WIDTH-2:0], 1'b0};
                    end else begin
                        // sub_a is positive or zero: no restore, set quotient bit to 1
                        a_reg <= sub_a;
                        q_reg <= {q_reg[WIDTH-2:0], 1'b1};
                    end

                    count <= count + 1;
                    if (count == WIDTH - 1) begin
                        state <= STATE_DONE;
                    end
                end

                STATE_DONE: begin
                    if (!div_by_zero) begin
                        // Final step outputs: Q register holds quotient, A register holds remainder
                        quotient  <= q_reg;
                        remainder <= a_reg;
                    end
                    done  <= 1'b1;
                    ready <= 1'b0;
                    state <= STATE_IDLE;
                end

                default: state <= STATE_IDLE;
            endcase
        end
    end

endmodule
