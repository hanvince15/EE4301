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
    input roll,
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
    reg [6:0] temp1 = 7'b1111111; 
    reg [6:0] temp2 = 7'b1111111;
    always @ (posedge clk)
    begin
        count <= count + 1;
    end
    
    always @ (posedge clk)
    begin
        if(roll == 1)
        begin
            if(q[7:4] == q[3:0])
            begin
                temp1 <= 7'b1001111;
                temp2 <= 7'b1000001;
            end
            else
            begin
                temp1 <= 7'b1000000;
                temp2 <= 7'b1000111;
            end
        end
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
                disp <= temp1;
                anode <= 4'b1011;
            end
            2'b11: begin
                disp <= temp2;
                anode <= 4'b0111;
            end
        endcase
    end
    
endmodule
