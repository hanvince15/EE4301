# EE4301 Textbook Notes, Chapter 7
## Chapter 7.1 - Representation of Floating-Point Numbers

Page ##
```Verilog
int* = ptr;
ptr = &i; // Pointer now holds the location of i as an integer storage location
```

Page 399

A simple representation of a floating-point (or real) number (N) uses a fraction
(F), base (B), and exponent (E), where N = F + B^E

Typically F is 16 to 64 bits and E is 8 to 15 bits. The following examples will use a 4-bit fraction and exponent.

A Simple Floating-Point Format Using 2’s Complement:

Representing the decimal 2.5 works as follows:
	2.5 = 0010.1000
	    = 1.010 x 2^1	(std. normal representation)
	    = 0.101 x 2^2	(4-bit 2's complement fraction)

The fraction is 5 (101), the base is 2 (b/c it's binary), and the exponent is 2

	F = 0.101 	E = 0010 	N = -5/8 * 2^2



3.1
	0.011 * 2^2