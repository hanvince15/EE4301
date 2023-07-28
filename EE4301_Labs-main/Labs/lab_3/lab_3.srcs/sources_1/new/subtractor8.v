`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/22/2020 07:03:11 PM
// Design Name: 
// Module Name: adder8
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


module subtractor8(
    input bout,
    input [7:0] s,
    input [7:0] a,
    input [7:0] b,
    input cin
    );
    
    wire [7:1] carry;
    
    full_subtractor FA0(carry[1],s[0],a[0],b[0],cin);
    full_subtractor FA1(carry[2],s[1],a[1],b[1],carry[1]);
    full_subtractor FA2(carry[3],s[2],a[2],b[2],carry[2]);
    full_subtractor FA3(carry[4],s[3],a[3],b[3],carry[3]);
    full_subtractor FA4(carry[5],s[4],a[4],b[4],carry[4]);
    full_subtractor FA5(carry[6],s[5],a[5],b[5],carry[5]);
    full_subtractor FA6(carry[7],s[6],a[6],b[6],carry[6]);
    full_subtractor FA7(bout,s[7],a[7],b[7],carry[7]);
    
endmodule