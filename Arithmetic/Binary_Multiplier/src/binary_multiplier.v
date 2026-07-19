// =============================================================================
// Project Name: IgniteRTL
// File Name:    binary_multiplier.v
// Description:  Parameterized sequential shift-and-add binary multiplier. 
//               Computes the 2N-bit product of two N-bit inputs (a, b) 
//               sequentially using a finite state machine.
//
// Author:       IgniteRTL Contributor
// Date:         2026-07-19
// Version:      1.0
// =============================================================================

module binary_multiplier #(
    parameter WIDTH = 8 // Default operand bit width
)(
    input  wire                 clk,     // System Clock
    input  wire                 rst_n,   // Active-low asynchronous reset
    input  wire                 start,   // Start multiplication control
    input  wire [WIDTH-1:0]     a,       // Multiplicand input operand A
    input  wire [WIDTH-1:0]     b,       // Multiplier input operand B
    output reg  [2*WIDTH-1:0]   product, // 2N-bit multiplication product
    output reg                  ready,   // Device is ready for new input
    output reg                  done     // Output valid completion flag
);

    // FSM States
    localparam STATE_IDLE  = 2'b00;
    localparam STATE_MULT  = 2'b01;
    localparam STATE_DONE  = 2'b10;

    reg [1:0]             state;
    reg [2*WIDTH-1:0]     multiplicand_reg;
    reg [WIDTH-1:0]       multiplier_reg;
    reg [2*WIDTH-1:0]     accum_reg;
    reg [15:0]            count_reg; // Counter supporting up to large widths

    // Sequential state and datapath logic
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state            <= STATE_IDLE;
            multiplicand_reg <= 0;
            multiplier_reg   <= 0;
            accum_reg        <= 0;
            count_reg        <= 0;
            product          <= 0;
            ready            <= 1'b1;
            done             <= 1'b0;
        end else begin
            case (state)
                STATE_IDLE: begin
                    done  <= 1'b0;
                    ready <= 1'b1;
                    if (start) begin
                        multiplicand_reg <= {{WIDTH{1'b0}}, a};
                        multiplier_reg   <= b;
                        accum_reg        <= 0;
                        count_reg        <= 0;
                        ready            <= 1'b0;
                        state            <= STATE_MULT;
                    end
                end
                
                STATE_MULT: begin
                    // Evaluate conditional addition and shift
                    if (count_reg == WIDTH - 1) begin
                        // Final step: Register product and transition to done
                        if (multiplier_reg[0]) begin
                            product <= accum_reg + multiplicand_reg;
                        end else begin
                            product <= accum_reg;
                        end
                        done  <= 1'b1;
                        state <= STATE_DONE;
                    end else begin
                        if (multiplier_reg[0]) begin
                            accum_reg <= accum_reg + multiplicand_reg;
                        end
                        multiplicand_reg <= multiplicand_reg << 1;
                        multiplier_reg   <= multiplier_reg >> 1;
                        count_reg        <= count_reg + 1;
                    end
                end
                
                STATE_DONE: begin
                    done  <= 1'b0;
                    ready <= 1'b1;
                    state <= STATE_IDLE;
                end
                
                default: state <= STATE_IDLE;
            endcase
        end
    end

endmodule
