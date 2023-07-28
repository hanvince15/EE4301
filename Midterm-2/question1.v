module expl_beh(x, y, a, b, c);
  input a, b, c;
  output x, y;

  wire na, nb, nc;
  not #(1) n1(na, a);
  not #(1) n2(nb, b);
  not #(1) n3(nc, c);

  wire t3, t5, t6;
  and #(1) a1(t3, na, b, c);
  and #(1) a2(t5, a, nb, c);
  and #(1) a3(t6, a, b, nc);

  reg x_out, y_out;
  always @(t3, t6)
    x_out = t3 | t6;
  always @(a, t5)
    y_out = a | #(3) t5;

  assign x = x_out;
  assign y = y_out;
endmodule
