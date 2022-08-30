			AREA	Prog1,	CODE,	READONLY
			ENTRY
			MOV r0,	#0x11 				;	load	initial	value
			MOV r1,	r0,	LSL	#1 			;	shift	1	bit	left	
			MOV r2,	r1,	LSL	#1 			;	shift	1	bit	left
stop 		B stop 						;	stop	program
			END