`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/21/2017 01:15:37 PM
// Design Name: 
// Module Name: add_sub8
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


module add_sub8(
    output cout,
    output [7:0] s,
    input [7:0] a,
    input [7:0] b,
    input cin
    );
    
    reg [7:0] b_temp;
    
    adder8 A0(cout, s, a, b_temp, cin);
        
    always @ (*)
    begin
        if (cin == 0)
            b_temp = b;
        else
            b_temp = ~b;
    end
    
endmodule
