module GameFSM_TB;

  reg clk;
  reg reset;
  reg start;
  reg roll;

  wire [3:0] seg;

  GameFSM dut (
    .clk(clk),
    .reset(reset),
    .start(start),
    .roll(roll),
    .seg(seg)
  );

  always begin
    clk = 1'b0;
    #5;
    clk = 1'b1;
    #5;
  end

  initial begin
    reset = 1'b1;
    start = 1'b0;
    roll = 1'b0;

    #10;
    reset = 1'b0;
    #10;

    start = 1'b1;
    #10;
    roll = 1'b1;
    #10;
    roll = 1'b0;
    #10;

    start = 1'b1;
    #10;
    roll = 1'b1;
    #10;
    roll = 1'b0;
    #10;

    start = 1'b1;
    #10;
    roll = 1'b1;
    #10;
    roll = 1'b0;
    #10;
    roll = 1'b1;
    #10;
    roll = 1'b0;
    #10;

    start = 1'b1;
    #10;
    roll = 1'b1;
    #10;
    roll = 1'b0;
    #10;
    roll = 1'b1;
    #10;
    roll = 1'b0;
    #10;
  end

endmodule

