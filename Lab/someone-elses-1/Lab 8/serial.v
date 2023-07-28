`timescale 1ns / 1ps

module serial(sum, a, b, clk, done);
	input [15:0] a;
	input [15:0] b;
	input clk;
	reg [15:0] x;
	reg [15:0] z;
	output reg [15:0] sum; 
	output reg done;
	reg cout;
	reg s;
	reg cin;
	reg [15:0] sum_temp;
    
    initial begin
        sum_temp <= 0;
        cin <= 0;
        done <= 0;
    end
        
    integer i;
    always @(posedge clk) begin
        for(i = 0; i < 16; i=i+1) begin
            x = a >>> i;
            z = b >>> i;
            
            {cout, s} = x[0] + z[0] + cin;
                
            sum_temp = {s, sum_temp[15:1]};
            cin = cout;
            
            if(i == 15) begin
                sum = sum_temp;
                done = 1;
            end
        end
    end
endmodule