`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/22/2020 06:52:08 PM
// Design Name: 
// Module Name: full_subtractor
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
// based on https://www.elprocus.com/full-subtractor-circuit-using-logic-gates/
// this was used as a reference http://www.asic-world.com/verilog/operators1.html
//////////////////////////////////////////////////////////////////////////////////


module full_subtractor(
    output bout,
    output sub,
    input ain,
    input bin,
    input cin
    );
    
    assign sub = (!ain&!bin&bout)|(ain&!bin&bout)|(!ain&bin&!bout)|(ain&bin&bout);
    assign cout= (!ain&bin)|(!ain&cin)|(bin&cin);
    
endmodule
