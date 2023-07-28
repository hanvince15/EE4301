`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/22/2020 06:52:08 PM
// Design Name: 
// Module Name: full_adder
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


module full_adder(
    output cout,
    output sum,
    input ain,
    input bin,
    input cin
    //input nin //nin added in this rev, this is the og carry
    );
    
    assign sum = ((bin)^ain)^cin; //nin^
    assign cout= (ain&bin)|(ain&cin)|(bin&cin);
    //(!ain&!bin&cout)|(ain&!bin&cout)|(!ain&bin&!cout)|(ain&bin&cout);
    
endmodule
