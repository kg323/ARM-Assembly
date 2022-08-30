			GLOBAL	Reset_Handler
			AREA lab5, CODE, READONLY

Reset_Handler

CHAR		EQU	0X73
			LDR R0, =MYSTRING
			MOV R2, #CHAR
			MOV R3, #0x0
			LDRB R1, [R0]
			CMP R1, R2
			ADDEQ R3, #0x1
			
CHARCOUNT	LDRB R1, [#0x1]!

ADDRESS 
			CMP R1, R2
			ADDEQ R3, #0x1
			CMP R1, #0x0
			BNE CHARCOUNT
STOP		B STOP

MYSTRING DCB "If you are going to pass, you gotta love this class!", 0
			ALIGN
			END