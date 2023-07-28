`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/26/2017 02:28:05 PM
// Design Name: 
// Module Name: Counter
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


module Counter (
    input clk1, clk2,
    input Roll,
    output reg [3:0] Cnt1, 
    output reg [3:0] Cnt2
    );
    
    initial
    begin
        Cnt1 <= 1;
        Cnt2 <= 1;
    end
    
    always @(posedge clk1)
    begin
        if (Roll == 1'b1) begin
            if (Cnt1 == 6) begin
                Cnt1 <= 1;
            end
            else begin
                Cnt1 <= Cnt1 + 1 ;
            end
        end
    end
    
    always @(posedge clk2)
    begin
        if (Roll == 1'b1) begin
            if (Cnt2 == 6) begin
                Cnt2 <= 1;
            end
            else begin
                Cnt2 <= Cnt2 + 1;
            end
        end
    end
endmodule
