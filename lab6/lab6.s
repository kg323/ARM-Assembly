	AREA lab6, CODE, READONLY

Reset_Handler
PINSEL0	EQU	0xE002C000
IO0PIN	EQU	0xE0028000
IO0SET	EQU	0xE0028004
IO0DIR	EQU	0xE0028008
IO0CLR	EQU 0xE002800C
	
		LDR R0, =PINSEL0
		LDR R1, [R0]
		LDR R2, =0xFFFFB0FF
		AND R2, R2, R1
		STR R2, [R0]
		
		LDR R0, =IO0DIR ;sets directions of pins P0.8 to P0.11 when P0.14 is pressed
		LDR R1, [R0]
		LDR R2, =0xFF00
		ORR R2, R2, R1
		STR R2, [R0]
		
		LDR R0, =IO0SET ;turns off pins P0.8 to P0.11 when P0.14 is pressed
		LDR R2, =0x4F00
		STR R2, [R0]
		
		LDR R0, =IO0CLR ;turns on pins P0.8 to P0.11 when P0.14 is pressed
		LDR R2, =0x0F00
		STR R2, [R0]
		
		END