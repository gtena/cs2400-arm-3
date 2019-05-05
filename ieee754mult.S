		;		ARM Programming Assignment #3: 32 bit IEEE 754 single-precision multiplier
		;
		;		Write a 32-bit floating point multiplier. The numbers will be represented
		;       in the single-precision IEEE 754 floating-point standard. The result should
		;       also be in IEEE 754 binary32. Assume you only have normalized numbers, i.e.
		;       the exponent is never 0b00000000.
		;		Write the result in the provided "fill" word.

		;		Your code here
		;		Algorithm
		;- Add biased exponents of the two numbers, subtracting the bias from the 
		;   sum to get the new biased exponent
		;-Multiply the significands
		;-Normailize the product if necessary, shifting it right and incrementing 
		;  the exponent
		;-Overflow? Yes- check if in range of exp, if not exception
		;-No? Round the significand to the appropiate number of bits
		;  Still normalized? No- branch to normalize routine
		;-Yes? Set the sign of the product to positive if the signs of original
		;  operands are the same, if they are different make the sign negative
		;-Done 
		;
		;
		;
		;
		;
		;
		

floats	DCD		0xa0bcff0d, 0x13c0adea
result	FILL	8
