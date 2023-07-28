`timescale 1ns / 1ps

module lfsr (output reg [7:0]q, input [7:0]seed, input rst, input clock);
    
    wire din;
    
    assign din = q[1]^q[2]^q[3]^q[7];
    
    initial
    begin
        q <= 8'b00000001;
    end
    
    always @(posedge clock)
    begin
        if(rst == 1)
        begin
            q <= seed;
        end
        else if (rst == 0)
        begin
            q[7:1] <= q[6:0];
            q[0] <= din;
        end
    end
endmodule
