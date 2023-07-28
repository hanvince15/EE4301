`timescale 1ns / 1ps
module lfsr_tb;
  reg [7:0] seed;
  reg clock, rst;
  wire [7:0] q;

  lfsr dut (
    .q(q),
    .seed(seed),
    .clock(clock),
    .rst(rst)
  );

  always #5 clock = ~clock;

  initial begin
    rst = 1;
    #10 rst = 0;
  end

  initial begin
    seed = 8'hFF;
    #20;

    repeat (256) begin
      #10;
      $display("q = %h", q);
    end;

    // End simulation
    $finish;
  end
endmodule

