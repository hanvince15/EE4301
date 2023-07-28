`timescale 1ns / 1ps

module lab4_top(output [7:0] q,
input clk,
input rst
);
    reg [7:0] seed = 8'b00000001;
    wire cout;
    clock_divider CDIV (clk,cout);
    lfsr LFSR (q,seed,cout,rst);
endmodule