`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/31/2017 11:58:13 PM
// Design Name: 
// Module Name: lab6_top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module lab6_top(
    input Rb, Reset, clk,
    output [6:0] disp,
    output [3:0] anode
    );
    
    wire [3:0] sum;
    wire [3:0] cnt1;
    wire [3:0] cnt2;
    wire win, lose, again;
    wire cout1, cout2;
    
    clock_divider c1(cout1, clk, 15);
    clock_divider c2(cout2, clk, 10);
    Counter count(cout1, cout2, Rb, cnt1, cnt2);
    DiceGame dice(Rb, Reset, clk, cnt1, cnt2, win, lose, again, sum);
    disp d(clk, win, lose, again, cnt1, cnt2, sum, disp, anode);
endmodule
