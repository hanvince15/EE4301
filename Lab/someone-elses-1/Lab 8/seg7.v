`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/26/2017 07:45:32 AM
// Design Name: 
// Module Name: seg7
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


module seg7(output reg [6:0]disp, input [3:0] x);
    
    always @(*)
    begin
        case (x)
            4'b0000:  	                //Hexadecimal 0
                disp = 7'b1000000;
            4'b0001:	                //Hexadecimal 1
                disp = 7'b1111001;
            4'b0010:                   //Hexadecimal 2
                disp = 7'b0100100;
            4'b0011:                   //Hexadecimal 3
                disp = 7'b0110000;
            4'b0100:                   //Hexadecimal 4
                disp = 7'b0011001;
            4'b0101:                   //Hexadecimal 5
                disp = 7'b0010010; 
            4'b0110:                   //Hexadecimal 6
                disp = 7'b0000010;
            4'b0111:                   //Hexadecimal 7
                disp = 7'b1111000;
            4'b1000: 	               //Hexadecimal 8
                disp = 7'b0000000;
            4'b1001:	               //Hexadecimal 9
                disp = 7'b0011000;
            4'b1010:                   //Hexadecimal A
                disp = 7'b0001000;
            4'b1011:                   //Hexadecimal B
                disp = 7'b0000011;
            4'b1100:                   //Hexadecimal C
                disp = 7'b1000110;
            4'b1101:                   //Hexadecimal D
                disp = 7'b0100001;
            4'b1110:                   //Hexadecimal E
                disp = 7'b0000110;
            4'b1111:                   //Hexadecimal F
                disp = 7'b0001110;
            default:
                disp = 7'b1111111;
        endcase
    end
endmodule
