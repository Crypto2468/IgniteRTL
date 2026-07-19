// =============================================================================
// Project Name: IgniteRTL
// File Name:    array_multiplier.v
// Description:  Parameterized purely combinational Array Multiplier. 
//               Computes the 2N-bit product of two N-bit inputs (a, b) in a 
//               single cycle using a 2D array of partial product AND gates 
//               and adder cells.
//
// Author:       IgniteRTL Contributor
// Date:         2026-07-19
// Version:      1.0
// =============================================================================

module array_multiplier #(
    parameter WIDTH = 8 // Default operand bit width
)(
    input  wire [WIDTH-1:0]     a,       // Multiplicand input operand A
    input  wire [WIDTH-1:0]     b,       // Multiplier input operand B
    output wire [2*WIDTH-1:0]   product  // 2N-bit multiplication product
);

    // 2D wire grids for partial products, sum, and carry lines
    wire [WIDTH-1:0] pp [0:WIDTH-1];
    wire [WIDTH-1:0] sum_grid [0:WIDTH-1];
    wire [WIDTH-1:0] carry_grid [0:WIDTH-1];

    // 1. Generate Partial Products: pp[r][c] = a[c] & b[r]
    generate
        genvar r, c;
        for (r = 0; r < WIDTH; r = r + 1) begin : gen_pp_row
            for (c = 0; c < WIDTH; c = c + 1) begin : gen_pp_col
                assign pp[r][c] = a[c] & b[r];
            end
        end
    endgenerate

    // 2. Initialize Row 0
    assign sum_grid[0]   = pp[0];
    assign carry_grid[0] = {WIDTH{1'b0}};

    // 3. Generate Adder Grid for Row 1 to WIDTH-1
    generate
        genvar i, j;
        for (i = 1; i < WIDTH; i = i + 1) begin : gen_adder_rows
            for (j = 0; j < WIDTH; j = j + 1) begin : gen_adder_cols
                // Operand connections based on structural shifting
                wire op1 = pp[i][j];
                wire op2 = (j < WIDTH - 1) ? sum_grid[i-1][j+1] : carry_grid[i-1][WIDTH-1];
                wire op3 = (j > 0) ? carry_grid[i][j-1] : 1'b0;

                // Full Adder boolean logic for grid cells
                assign sum_grid[i][j]   = op1 ^ op2 ^ op3;
                assign carry_grid[i][j] = (op1 & op2) | (op3 & (op1 ^ op2));
            end
        end
    endgenerate

    // 4. Map sum and carry grids to final 2N-bit Product outputs
    assign product[0] = sum_grid[0][0];
    
    generate
        genvar k;
        for (k = 1; k < WIDTH; k = k + 1) begin : gen_product_low
            assign product[k] = sum_grid[k][0];
        end
        for (k = 1; k < WIDTH; k = k + 1) begin : gen_product_high
            assign product[WIDTH - 1 + k] = sum_grid[WIDTH-1][k];
        end
    endgenerate

    assign product[2*WIDTH-1] = carry_grid[WIDTH-1][WIDTH-1];

endmodule
