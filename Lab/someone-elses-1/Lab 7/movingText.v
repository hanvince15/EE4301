`timescale 1ns / 1ps

module movingText(
    input clk,
    input [2:0] btn,
    input [7:0] sw,
    output [7:0] disp,
    output [3:0] anode
    );
    
    integer charCount = 0;
    integer i;
    integer count = 0;
    reg [7:0] message[0:20];
    reg [7:0] dig1;
    reg [7:0] dig2;
    reg [7:0] dig3;
    reg [7:0] dig4;
    reg [7:0] dig_temp1;
    reg [7:0] dig_temp2;
    reg [7:0] dig_temp3;
    reg [7:0] dig_temp4;
    reg stored = 0;
    wire cout;
    
    clock_divider C(cout, clk);
    disp D(clk, dig1, dig2, dig3, dig4, disp, anode);
    
    initial begin
        dig1 <= 8'b11111111;
        dig2 <= 8'b11111111;
        dig3 <= 8'b11111111;
        dig4 <= 8'b11111111;
        dig_temp1 <= 8'b11111111;
        dig_temp2 <= 8'b11111111;
        dig_temp3 <= 8'b11111111;
        dig_temp4 <= 8'b11111111;
        for(i = 0; i <= 20; i=i+1) begin
            message[i] <= 8'b11111111;
        end
    end
    
    always @ (posedge clk) begin
        case(btn)
            3'b110: begin
                stored <= 0;
                dig1 <= 8'b10001111;                   // L
                dig2 <= 8'b11111111;
                dig3 <= 8'b11111111;
                dig4 <= ~sw;
            end
            
            3'b111: begin
                dig1 <= 8'b01000111;                   // o
                dig2 <= 8'b11111111;
                dig3 <= 8'b11111111;
                dig4 <= ~sw;
                if(charCount < 20 && stored == 0) begin
                    message[charCount] <= ~sw;
                    charCount <= charCount + 1;
                    stored <= 1;
                end
            end
            
            3'b010: begin
                stored <= 0;
                charCount <= 0;
                dig4 <= 8'b11111111;
                dig3 <= 8'b11111111;
                dig2 <= 8'b11111111;
                dig1 <= 8'b11111111;
                for(i = 0; i <= 19; i=i+1) begin
                    message[i] <= 8'b11111111;
                end
            end
            
            default: begin
                stored <= 0;
                dig1 <= dig_temp1;
                dig2 <= dig_temp2;
                dig3 <= dig_temp3;
                dig4 <= dig_temp4;
            end
        endcase
    end
    
    always @ (posedge cout) begin
        if (btn == 3'b010) begin
            count <= 0;
            dig_temp4 <= 8'b11111111;
            dig_temp3 <= 8'b11111111;
            dig_temp2 <= 8'b11111111;
            dig_temp1 <= 8'b11111111;
        end
        
        if (charCount == 0) begin
            dig_temp4 <= 8'b11111111;
            dig_temp3 <= 8'b11111111;
            dig_temp2 <= 8'b11111111;
            dig_temp1 <= 8'b11111111;
        end
        else if (charCount == 1) begin
            dig_temp1 <= 8'b11111111;
            dig_temp2 <= 8'b11111111;
            dig_temp3 <= 8'b11111111;
            dig_temp4 <= message[0];
        end
        else if (charCount == 2) begin
            dig_temp1 <= 8'b11111111;
            dig_temp2 <= 8'b11111111;
            dig_temp4 <= message[1];
            dig_temp3 <= message[0];
        end
        else if (charCount == 3) begin
            dig_temp1 <= 8'b11111111;
            dig_temp4 <= message[2];
            dig_temp3 <= message[1];
            dig_temp2 <= message[0];
        end
        else if (charCount == 4) begin
            dig_temp4 <= message[3];
            dig_temp3 <= message[2];
            dig_temp2 <= message[1];
            dig_temp1 <= message[0];
        end
        else if (charCount > 4 && count == 0) begin
            dig_temp4 <= message[3];
            dig_temp3 <= message[2];
            dig_temp2 <= message[1];
            dig_temp1 <= message[0];
            count <= 1;
        end
        else begin
            if (count <= (charCount - 3)) begin
                dig_temp4 <= message[count+3];
                dig_temp3 <= dig_temp4;
                dig_temp2 <= dig_temp3;
                dig_temp1 <= dig_temp2;
                count <= count + 1;
            end
            else begin
                dig_temp4 <= message[0];
                dig_temp3 <= dig_temp4;
                dig_temp2 <= dig_temp3;
                dig_temp1 <= dig_temp2;
                count <= -2;
            end
        end
    end
endmodule
