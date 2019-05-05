		;		ARM Programming Assignment #3: IEEE 754 to TNS bit-level marshaller
		;
		;		Write a program to convert a 32-bit single-precision IEEE 754 floating-point
		;       number to the Tandem Non-stop Series (TNS) format. Refer to the README for a
		;       description of the format. Convert the numbers in `floats` and write the TNS
		;       equivalents into the `tns` area, one after the other.
		;
		;       Bonus:
		;       1. (30 extra points) Implement the reverse conversion, from TNS to IEEE.
		;       2. (50 extra points) Organize the code into two subroutines, with stack
		;          support.
		;       3. (10 extra points) In the main program, implement a round-trip conversion
		;          and prove the results match the initial values in 'floats'.  Define a
		;          `FILL` region to hold the IEEE 754 results.
		;

		;		Your code here
		ADR		r2, floats			;address of floats
		ADR		r10, tns				;address of tns
		ADR		r11, ieee			;address of ieee
		LDR		r0, [r2]				;load address of float into r0
		LDR		r1, [r2, #4]			;load address of second float into r1
		MOV		r9, r0			
		BL			converttns
		STR		r12, [r10]			;store tns in r12
		MOV		r9,  r1				;mov next float into r9
converttns
		ADR		r3, signmask		;address of signmask
		ADR		r4, ieeeexpmask	;address of ieeeexpmask
		ADR		r5, ieeesigmask	;address of ieeesigmask
		LDR		r6, [r3]				;load r3 into r6
		LDR		r7, [r4]				;load r4 into r7
		LDR		r8, [r5] 				;load r5 into r8
		AND		r3, r9, r6			;and signmask and float
		AND		r4, r9, r7			;and ieeeexpmask and float
		MOV		r4, r4, LSR #23	;shift exp right 23
		ADD		r4, r4, #129		;add 129 to exp
		AND		r5, r9, r8			;and ieee signmask with float
		ADD		r5, r12, r5, LSL #8 ;Shift the significant left 8 bits
		ORR		r12, r3, r4			;or sign and exponent
		ORR		r12, r12, r5			;significand with sign and exponent
		MOV		PC, LR				;back to main






signmask		DCD		0x80000000 		; Mask for sign bit
ieeeexpmask	DCD		0x7F800000  		; Mask for IEEE exponent
ieeesigmask	DCD		0xFFFF007F  		; Mask for IEEE significand
tnsexpmask	DCD		0x000001FF  		; Mask for TNS exponent	
tnssignmask	DCD		0x7FFFFE00 		; Mask for TNS significand
	

floats		DCD		0xa0bcff0d, 0x13c0adea
tns	     FILL	16
ieee		FILl    16