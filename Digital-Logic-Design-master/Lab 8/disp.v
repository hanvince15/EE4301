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
    input clk,
    input [3:0] dig1,
    input [3:0] dig2,
    input [3:0] dig3,
    input [3:0] dig4,
    output reg [6:0] disp,
    output reg [3:0] anode
    );
    
    wire [6:0] disp1;
    wire [6:0] disp2;
    wire [6:0] disp3;
    wire [6:0] disp4;
    
    seg7 d1(disp1, dig1);
    seg7 d2(disp2, dig2);
    seg7 d3(disp3, dig3);
    seg7 d4(disp4, dig4);
    
    localparam N = 19;
    reg [N-1:0] count = 0;
    
    always @ (posedge clk)
    begin
        count <= count + 1;
    end
    
    always @ (*)
    begin
        case(count[N-1:N-2])
            2'b00: begin
                disp = disp4;
                anode = 4'b1110;
            end
            2'b01: begin
                disp = disp3;
                anode = 4'b1101;
            end
            2'b10: begin
                disp = disp2;
                anode = 4'b1011;
            end
            2'b11: begin
                disp = disp1;
                anode = 4'b0111;
            end
        endcase
    end
endmodule
