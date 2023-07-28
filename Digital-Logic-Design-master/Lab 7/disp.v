`timescale 1ns / 1ps

module disp(
    input clk,
    input [7:0] dig1,
    input [7:0] dig2,
    input [7:0] dig3,
    input [7:0] dig4,
    output reg [7:0] disp,
    output reg [3:0] anode
    );
    
    localparam N = 19;
    reg [N-1:0] count = 0;
    //reg [6:0] temp1 = 7'b1111111; 
    //reg [6:0] temp2 = 7'b1111111;
    
    always @ (posedge clk)
    begin
        count <= count + 1;
    end
    
    always @ (*)
    begin
        case(count[N-1:N-2])
            2'b00: begin
                disp = dig4;
                anode = 4'b1110;
            end
            2'b01: begin
                disp = dig3;
                anode = 4'b1101;
            end
            2'b10: begin
                disp = dig2;
                anode = 4'b1011;
            end
            2'b11: begin
                disp = dig1;
                anode = 4'b0111;
            end
        endcase
    end
endmodule
