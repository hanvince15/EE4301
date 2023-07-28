`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/26/2017 01:53:30 PM
// Design Name: 
// Module Name: DiceGame
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


module DiceGame (
    input Rb, Reset, clk,
    input [3:0] cnt1,
    input [3:0] cnt2,
    output reg Win, 
    output reg Lose,
    output reg Sp,
    output reg [3:0] Sum
    );
    
    reg[2:0] State = 0;
    reg[2:0] Nextstate = 0;
    reg[3:0] Point = 0;
        
    always @(posedge clk)
    begin
        if(Reset == 1) begin
            Point <= 0; Sum <= 0;
            Win <= 0; Lose <= 0; Sp <= 0;
            Nextstate <= 3'd0;
        end
        
        case (State)
        0: begin
            if (Rb == 1'b1) begin
                Point <= 0; Sum <= 0;
                Win <= 0; Lose <= 0; Sp <= 0;
                Nextstate <= 3'd1;
            end
            else begin
                Nextstate <= 3'd0;
            end
        end
        1: begin
            if (Rb == 1'b1) begin
                Nextstate <= 3'd1;
            end
            else begin
                Nextstate <= 3'd2;
            end
        end
        2: begin
            Sum <= cnt1 + cnt2;
            if(Sp == 1) begin
                Nextstate <= 3'd7;
            end
            else begin
                Nextstate <= 3'd3;
            end
        end
        3: begin
            if (Sum == 4'd7 || Sum == 4'd11) begin
                Nextstate <= 3'd4;
            end
            else if (Sum == 4'd2 || Sum == 4'd3 || Sum == 4'd12) begin
                Nextstate <= 3'd5;
            end
            else begin
                Point <= Sum;
                Sp <= 1;
                Nextstate <= 3'd6;
            end
        end
        4: begin
            Point <= 0;
            Win <= 1; Lose <= 0; Sp <= 0;
            Nextstate <= 3'd0;
        end
        5: begin
            Point <= 0;
            Win <= 0; Lose <= 1; Sp <= 0;
            Nextstate <= 3'd0;
        end
        6: begin
            if(Rb == 0) begin
                Nextstate <= 3'd6;
            end
            else begin
                Nextstate <= 3'd1;
            end
        end
        7: begin
            if (Sum == Point) begin
                Win <= 0; Lose <= 0; Sp <= 0;
                Nextstate <= 3'd4;
            end
            else if (Sum == 4'd7) begin
                Win <= 0; Lose <= 0; Sp <= 0;
                Nextstate <= 3'd5;
            end
            else begin
                Nextstate <= 3'd6;
            end
        end
        default: begin
            Win <= 0; Lose <= 0; Sp <= 0;
            Nextstate <= 3'd0;
        end
        endcase
    end
        
    always @(*)
    begin
        if (Reset == 1'b1)
            State = 0;
        else 
            State = Nextstate;
    end
endmodule
