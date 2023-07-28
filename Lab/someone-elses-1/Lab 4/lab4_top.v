`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/28/2017 01:59:46 PM
// Design Name: 
// Module Name: lab4_top
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


module lab4_top(
    output [7:0] q,
    output reg [6:0] disp,
    output reg [3:0] anode,
    input clk,
    input rst,
    input [7:0] seed
    );
    
    wire cout;
    wire [6:0] disp1;
    wire [6:0] disp2;
    
    initial
    begin
        disp <= 7'b1111111;
        anode <= 4'b1111;
    end
        
    clock_divider CDIV (cout, clk);
    lfsr LSFR (q, seed, rst, cout);
    seg7 digit1(disp1, q[3:0]);
    seg7 digit2(disp2, q[7:4]);
        
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
                disp <= disp1;
                anode <= 4'b1110;
            end
            2'b01: begin
                disp <= disp2;
                anode <= 4'b1101;
            end
            2'b10: begin
                disp <= 7'b1111111;
                anode <= 4'b1011;
            end
            2'b11: begin
                disp <= 7'b1111111;
                anode <= 4'b0111;
            end
        endcase
    end
    
endmodule
