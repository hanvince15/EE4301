# EE4301 Textbook Notes, Chapter 6
## Chapter 6.1 - Implementing Functions in Fpgas


Page 342

Let us assume that we want to design a 4-to-1 multiplexer using an FPGA whose logic block is represented by Figure 6-1(a).

![Figure 6-1](https://github.com/oconnellamethyst/EE4301_Labs/blob/main/Notes/Chapter_06/FIGURE%206-1.png)

The latched outputs are QX and QY; the combinational outputs are X and Y.


Page 342

Output equation for the multiplexer:
M = S1'So'Io + S1'SoI1 + S1SoI2 + S1SoI3

A 4-to-1 multiplexer can be decomposed into three 2-to-1 multiplexers as illustrated in Figure 6-1(b):
M1 = So'I0 + SoI1
M2 = So'I2 + SoI3

A third 2-to-1 multiplexer must now be used to create the output of the 4-to-1 multiplexer:
M = S1'M1 + S1 M2


Page 343

Many modern FPGAs use a 4-input look-up table (LUT) as a basic building block. 
Many designers refer to this building block as LUT4.

![Figure 6-2](https://github.com/oconnellamethyst/EE4301_Labs/blob/main/Notes/Chapter_06/FIGURE%206-2.png)


Page 344

Some FPGAs provide two 4-variable function generators and a method to
combine the output of the two function generators.

f1(X1, X2, X3, X4) and f2(Y1, Y2, Y3, Y4)

![Figure 6-3](https://github.com/oconnellamethyst/EE4301_Labs/blob/main/Notes/Chapter_06/FIGURE%206-3.png)

It can also generate a function Z, which depends on f1, f2, and C


Page 344

Now, consider the implementation of a 4-to-1 multiplexer using this FPGA
building block. A 4-to-1 multiplexer can be implemented using a single logic block
of this FPGA.

![Figure 6-4](https://github.com/oconnellamethyst/EE4301_Labs/blob/main/Notes/Chapter_06/FIGURE%206-4.png)


Page 345

In this case, the X function generator (LUT4) generates the function:

F1 = S1'S0 I0 + S1'S0'I1

The Y function generator (LUT4) generates the function:

F2 = S1S0'I2 + S1S0I3

The Z function generator (LUT3) performs an OR function of the F1and F2 functions:

Z = F1 + F2

In this case, the C input is not required. 


Page 345

In a circular shift register, the output of the rightmost flip-flop is fed back to the input of the leftmost flip-flop. This is also called a ring counter. 

![Figure 6-5](https://github.com/oconnellamethyst/EE4301_Labs/blob/main/Notes/Chapter_06/FIGURE%206-5.png)

Next-state equations depend only on the current state of the preceding flip-flop.

Four programmable logic blocks similar to Figure 6-1(a) will be required to create a 3-to-8 decoder. It has three inputs and eight outputs. Each output will need a 3-variable function generator. Since what is available in the logic block in Figure 6-1(a) is a 4-variable function generator, one will have to use one such function generator to create one output.



## Chapter 6.2 - Implementing Functions Using Shannon’s Decomposition


Page 347

Shannon’s expansion theorem can be used to decompose functions of large numbers of variables into functions of fewer variables.

Z(a,b,c,d,e,f) = a' * Z(0,b,c,d,e,f) + a * Z(1,b,c,d,e,f) = a' * Z0 + a * Z1 (6-3)

Verify that Equation 6-3 is correct by setting a to 0 on both sides and then setting a to 1 on both sides. Since the equation is true for both a = 0 anda = 1, it is always true.

This equation is represented below

![Figure 6-6](https://github.com/oconnellamethyst/EE4301_Labs/blob/main/Notes/Chapter_06/FIGURE%206-6.png)


Page 348

If only 4-input LUTs are available, the 5-variable functions should be further decomposed into 4-variable functions. This can be done by applying Shannon’s expansion theorem twice, first expanding about a and then expanding about b. Or, it can be done in one step by decomposing into four component functions as follows:

Z(a,b,c,d,e,f) = a'b' Z(0,0,c,d,e,f) + a'b Z(0,1,c,d,e,f) + ab' Z(1,0,c,d,e,f) + ab Z(1,1,c,d,e,f)
               = a'b' Y0  +  a'b Y1  +  ab' Y2  +  ab Y3


