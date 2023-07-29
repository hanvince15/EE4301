`timescale 1ns / 1ps

module cordic(
    input clk,
    input [1:0] btn,
    input [15:0] sw,
    output [6:0] disp,
    output [3:0] anode,
    output reg [12:0] LED
    );
    
    parameter width = 16;
    
    wire signed [width-1:0] x_start,y_start; 
    reg signed [15:0] angle;
    
    wire signed [15:0] ROM [0:12];
    
    reg [3:0] dig1;
    reg [3:0] dig2;
    reg [3:0] dig3;
    reg [3:0] dig4;
    
    disp D(clk, dig1, dig2, dig3, dig4, disp, anode);
    
    assign x_start = 16'b0010011011011101;
    assign y_start = 0;
    
    always @(posedge clk) begin
        if(btn == 2'b10)
            angle <= sw;
    end
    
    assign ROM[0] = 16'b0011001001000100;
    assign ROM[1] = 16'b0001110110101100;
    assign ROM[2] = 16'b0000111110101110; 
    assign ROM[3] = 16'b0000011111110101; 
    assign ROM[4] = 16'b0000001111111111; 
    assign ROM[5] = 16'b0000001000000000; 
    assign ROM[6] = 16'b0000000100000000; 
    assign ROM[7] = 16'b0000000010000000; 
    assign ROM[8] = 16'b0000000001000000; 
    assign ROM[9] = 16'b0000000000100000; 
    assign ROM[10] = 16'b0000000000010000; 
    assign ROM[11] = 16'b0000000000001000; 
    assign ROM[12] = 16'b0000000000000100;
    
    reg signed [15:0] x [0:12];
    reg signed [15:0] y [0:12];
    reg signed [15:0] z [0:12];
    wire signed [15:0] x_sum [0:11];
    wire signed [15:0] y_sum [0:11];
    wire signed [15:0] z_sum [0:11];
    wire signed [15:0] x_a [0:11];
    wire signed [15:0] y_a [0:11];
    wire signed [15:0] z_a [0:11];
    wire signed [15:0] x_b [0:11];
    wire signed [15:0] y_b [0:11];
    wire signed [15:0] z_b [0:11];
    
    wire donex [0:11];
    wire doney [0:11];
    wire donez [0:11];
    
    always @(posedge clk)
    begin
        x[0] <= x_start;
        y[0] <= y_start;
        z[0] <= angle;
    end

    serial addX0(x_sum[0], x_a[0], x_b[0], clk, donex[0]);
    serial addY0(y_sum[0], y_a[0], y_b[0], clk, doney[0]);
    serial addZ0(z_sum[0], z_a[0], z_b[0], clk, donez[0]);
    
    serial addX1(x_sum[1], x_a[1], x_b[1], clk, donex[1]);
    serial addY1(y_sum[1], y_a[1], y_b[1], clk, doney[1]);
    serial addZ1(z_sum[1], z_a[1], z_b[1], clk, donez[1]);
    
    serial addX2(x_sum[2], x_a[2], x_b[2], clk, donex[2]);
    serial addY2(y_sum[2], y_a[2], y_b[2], clk, doney[2]);
    serial addZ2(z_sum[2], z_a[2], z_b[2], clk, donez[2]);
    
    serial addX3(x_sum[3], x_a[3], x_b[3], clk, donex[3]);
    serial addY3(y_sum[3], y_a[3], y_b[3], clk, doney[3]);
    serial addZ3(z_sum[3], z_a[3], z_b[3], clk, donez[3]);
    
    serial addX4(x_sum[4], x_a[4], x_b[4], clk, donex[4]);
    serial addY4(y_sum[4], y_a[4], y_b[4], clk, doney[4]);
    serial addZ4(z_sum[4], z_a[4], z_b[4], clk, donez[4]);
    
    serial addX5(x_sum[5], x_a[5], x_b[5], clk, donex[5]);
    serial addY5(y_sum[5], y_a[5], y_b[5], clk, doney[5]);
    serial addZ5(z_sum[5], z_a[5], z_b[5], clk, donez[5]);
    
    serial addX6(x_sum[6], x_a[6], x_b[6], clk, donex[6]);
    serial addY6(y_sum[6], y_a[6], y_b[6], clk, doney[6]);
    serial addZ6(z_sum[6], z_a[6], z_b[6], clk, donez[6]);
    
    serial addX7(x_sum[7], x_a[7], x_b[7], clk, donex[7]);
    serial addY7(y_sum[7], y_a[7], y_b[7], clk, doney[7]);
    serial addZ7(z_sum[7], z_a[7], z_b[7], clk, donez[7]);
    
    serial addX8(x_sum[8], x_a[8], x_b[8], clk, donex[8]);
    serial addY8(y_sum[8], y_a[8], y_b[8], clk, doney[8]);
    serial addZ8(z_sum[8], z_a[8], z_b[8], clk, donez[8]);
    
    serial addX9(x_sum[9], x_a[9], x_b[9], clk, donex[9]);
    serial addY9(y_sum[9], y_a[9], y_b[9], clk, doney[9]);
    serial addZ9(z_sum[9], z_a[9], z_b[9], clk, donez[9]);
    
    serial addX10(x_sum[10], x_a[10], x_b[10], clk, donex[10]);
    serial addY10(y_sum[10], y_a[10], y_b[10], clk, doney[10]);
    serial addZ10(z_sum[10], z_a[10], z_b[10], clk, donez[10]);
    
    serial addX11(x_sum[11], x_a[11], x_b[11], clk, donex[11]);
    serial addY11(y_sum[11], y_a[11], y_b[11], clk, doney[11]);
    serial addZ11(z_sum[11], z_a[11], z_b[11], clk, donez[11]);
        
    genvar i;
    
    generate
    for (i=0; i < 12; i = i+1)
    begin: xyz
        wire z_sign;
        wire signed [15:0] x_shr, y_shr;
        
        assign x_shr = x[i] >>> i;
        assign y_shr = y[i] >>> i;

        assign z_sign = z[i][15];
        
        assign x_a[i] = x[i];
        assign y_a[i] = y[i];
        assign z_a[i] = z[i];
        assign x_b[i] = z_sign ? y_shr : 0 - y_shr;
        assign y_b[i] = z_sign ? 0 - x_shr : x_shr;
        assign z_b[i] = z_sign ? ROM[i] : 0 - ROM[i];
               
        always @(posedge clk)
        begin
            if(donex[i] && doney[i] && donez[i]) begin
                x[i+1] <= x_sum[i];
                y[i+1] <= y_sum[i];
                z[i+1] <= z_sum[i];
            end
        end
    end
    endgenerate
    
    reg [3:0] count = 0;
    reg change = 0;
    
    always @ (posedge clk) begin
        if(btn == 2'b01) begin
            if(change == 0) begin
                count <= (count+1)%13;
                change <= 1;
            end
        end
        else 
            change <= 0;
        
        dig1 <= x[count][15:12];
        dig2 <= x[count][11:8];
        dig3 <= x[count][7:4];
        dig4 <= x[count][3:0];
        LED <= 13'b0000000000000;
        LED[count] <= 1;
    end
endmodule
