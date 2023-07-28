# EE4301 Textbook Notes, Chapter 2
## Chapter 2.3

An And gat going into an Or gate.

Page 65
```Verilog
assign #5 C = A && B;
assign #5 E = C || D;
```


The order is not important, this isn't sequential so this code is the same as
Page 65
```Verilog
assign #5 E = C || D;
assign #5 C = A && B;
```

Assignment statements have the form
Page 65
```Verilog
assign [#delay] signal_name = expression;
```

Verilog repeats and repeats as if it's a loop

This code is an inverter named CLK, it repeats over and over again (creating a clock signal perhaps?)
Page 66
```Verilog
assign #10 CLK = ~CLK;
```

Verilog is case sensitive, so this creates a different clock than the above
Page 66
```Verilog
assign #10 Clk = ~Clk;
```

Signal names in verilog cannot start with $ (reserved for system tasks) or a number. So Clk could be replaced with an infinite amount of identifiers. Here are some common ones
Page 66
```Verilog
adder
Mux_input
_error_code
Index_bit
vector_sz
_$five
Count
XOR
```

And here are some that would not work as identifiers and crash and horrifically burn your code
Page 67
```Verilog
4bitadder
$error_code
```

```Verilog
//this is an end of line comment
/* This is 
a multiline comment */
```
Statements are ended with a semicolon (;), and, or, and always are special words in verilog

Page 67

![Figure 2-5](https://github.com/oconnellamethyst/EE4301_Labs/blob/main/Notes/Chapter_02/FIGURE%202-5.png)
```Verilog
// when A changes, these concurrent
// statements all execute at the
// same time

	assign #2 D = A && B;
	assign #1 E = ~A;
	assign #3 F = A || C;
```

Each signal is a wire, and each wire is a boolean (a value of one or zero). We often work with cables tho, so to define multiple wires...

Page 67
```Verilog
wire B[3:0]; //creates B[3], ..., B[0]. Note there are 4 of them
```

Page 67
```Verilog
//net values are represented as
<number of bits>'<base><value>
//such as
1'b0
```

Page 67
```Verilog
B = 4'b1100 // Assigns 1 to B[3], 1 to B[2], 0 to B[1] and 0 to B[0]
```

Page 68

When applied to vectors, the & operator performs the bitwise AND operation on corresponding pairs of elements.

![Figure 2-6](https://github.com/oconnellamethyst/EE4301_Labs/blob/main/Notes/Chapter_02/FIGURE%202-6.png)
```Verilog
// the hard way
	assign C[3] = A[3] && B[3];
	assign C[2] = A[2] && B[2];
	assign C[1] = A[1] && B[1];
	assign C[0] = A[0] && B[0];

// the easy way assuming C, A and
// B are 4-bit vectors
	assign C = A & B;
```

## Chapter 2.4 - Verilog Modules


Page 68

The general structure of a Verilog code is a module description. A module is a basic
building block that declares the input and output signals and specifies the internal
operation of the module.

![Figure 2-7](https://github.com/oconnellamethyst/EE4301_Labs/blob/main/Notes/Chapter_02/FIGURE%202-7.png)
```Verilog
module two_gates (A, B, D, E);
output E;
input A, B, D;
wire C;
	assign C 5 A && B; // concurrent
	assign E 5 C || D; // statements
endmodule
```

Page 69

The module I/O declaration part can be considered as the black box picture of
the module being designed and its external interface; that is, it represents the interconnections from this module to the external world as in Figure 2-8

![Figure 2-8](https://github.com/oconnellamethyst/EE4301_Labs/blob/main/Notes/Chapter_02/FIGURE%202-8.png)
```Verilog
module module-name (module interface list);
//[list-of-interface-ports]
//...
//[port-declarations]
//...
//[functional-specification-of-module]
//...
endmodule
```

The items enclosed in square brackets are optional. The list-of-interfaceports normally has the following form:
```Verilog
type-of-port list-of-interface-signals
{; type-of-port list-of-interface-signals};
```

![Figure 2-9](https://github.com/oconnellamethyst/EE4301_Labs/blob/main/Notes/Chapter_02/FIGURE%202-9.png)


Page 70

![Figure 2-10](https://github.com/oconnellamethyst/EE4301_Labs/blob/main/Notes/Chapter_02/FIGURE%202-10.png)
```Verilog
module FullAdder(X, Y, Cin, Cout, Sum);
output Cout, Sum;
input X, Y, Cin;
	assign #10 Sum 5 X ^ Y ^ Cin;
	assign #10 Cout 5 (X && Y) || (X && Cin) || (X && Cin);
endmodule
```

The Verilog assignment statements for Sum and Co.
```Verilog
Sum = X ⊕ Y ⊕ Cin
Cout = XY ⊕ YCin + XCin
```

Page 70

4-Bit Full Adder
Next, we will show how to use the FullAdder module defined previously as a
module in a system, which consists of four full adders connected to form a 4-bit
binary adder (see Figure 2-11).

![Figure 2-11](https://github.com/oconnellamethyst/EE4301_Labs/blob/main/Notes/Chapter_02/FIGURE%202-11.png)


Page 71

The port map corresponds one-to-one with the
signals in the component port. Thus, A[0], B[0], and Ci correspond to the inputs
X, Y, and Cin, respectively. C[1] and S[0] correspond to the Cout and Sum outputs of
the adder for least significant bit. U

Structural Description of a 4-Bit Adder
```Verilog
module Adder4 (S, Co, A, B, Ci);
output [3:0] S;
output Co;
input [3:0] A, B;
input Ci;
wire [3:1] C; // C is an internal signal
// instantiate four copies of the FullAdder
FullAdder FA0 (A[0], B[0], Ci, C[1], S[0]);
FullAdder FA1 (A[1], B[1], C[1], C[2], S[1]);
FullAdder FA2 (A[2], B[2], C[2], C[3], S[2]);
FullAdder FA3 (A[3], B[3], C[3], Co, S[3]);
endmodule
```


Page 71

All of the simulation examples in this text use the ModelSim Verilog
simulator from Mentor Graphics. We will use the following simulator commands
to test Adder4:

```Verilog
add list A B Co C Ci S // put these signals on the output list
force A 1111 // set the A inputs to 1111
force B 0001 // set the B inputs to 0001
force Ci 1 // set Ci to 1
run 50ns // run the simulation for 50ns
force Ci 0
force A 0101
force B 1110
run 50ns
```


Page 72

We have chosen to run the simulation for 50ns for each input set, since this is
more than enough time for the carry to propagate through all of the full adders. The
simulation results for the above command list are:

![Simulate](https://github.com/oconnellamethyst/EE4301_Labs/blob/main/Notes/Chapter_02/Simulate.png)


Page 73

Use of “Inout” Mode
Assume that all variables are 0 @ 0ns, but A changes to 1 @ 10ns.

Verilog Code Illustrating Use of Output as an Input Signal
```Verilog
module gates (A, B, C, D, E);
input A, B, C;
output D, E;
	assign #5 D = A || B; // statement 1
	assign #5 E = C || D; // statement 2 uses D as an input
endmodule
```


Page 73
Verilog Code Illustrating Use of Mode Inout
```Verilog
module gates (A, B, C, D, E);
input A, B, C;
output E;
inout D;
	assign #5 D = A || B; // statement 1
	assign #5 E = C || D; // statement 2
endmodule
```


## Chapter 2.5 - Verilog Assignments

Page 73

There are two types of assignment in the Verilog: continuous assignments and procedural assignments. Continuous assignments are used to assign values for combinational logic circuits. The assign keyword can be used after the net is separately declared, which is referred to as explicit continuous assignments. Implicit continuous assignments assign the value in declaration without using the assign keyword.

```Verilog
wire C;
assign C = A || B; // explicit continuous assignment
wire D = E && F; // implicit continuous assignment
```

Procedural assignments are used to model registers and finite state machines using
the always keyword.


## Chapter 2.6 - Verilog Assignments

Page 73


