`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/26/2017 06:33:00 PM
// Design Name: 
// Module Name: disp
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


module disp(
    input clk, win, lose, sp,
    input [3:0] x1, 
    input [3:0] x2,
    input [3:0] x3,
    output reg [6:0] disp,
    output reg [3:0] anode
    );
    
    wire [6:0] disp1;
    wire [6:0] disp2;
    wire [6:0] disp3;
    
    seg7 d1(disp1, x1);
    seg7 d2(disp2, x2);
    seg7 d3(disp3, x3);
    
    localparam N = 19;
    reg [N-1:0] count = 0;
    //reg [6:0] temp1 = 7'b1111111; 
    reg [6:0] temp2 = 7'b1111111;
    
    always @ (posedge clk)
    begin
        count <= count + 1;
    end
    
    always @ (*)
    begin
        if(sp == 1)
            temp2 = 7'b0001000;
        else if(lose == 1)
            temp2 = 7'b1000111;
        else if(win == 1)
            temp2 = 7'b1000001;
        else
            temp2 = 7'b0111111;
    end
    
    always @ (*)
    begin
        case(count[N-1:N-2])
            2'b00: begin
                disp = disp1;
                anode = 4'b1110;
            end
            2'b01: begin
                disp = disp2;
                anode = 4'b1101;
            end
            2'b10: begin
                disp = disp3;
                anode = 4'b1011;
            end
            2'b11: begin
                disp = temp2;
                anode = 4'b0111;
            end
        endcase
    end
endmodule
