		AREA lab7, CODE, READONLY
			
Reset_Handler

CHAR		EQU	0X6F ;ASCII number for "o"
			LDR R0, =string ;loads address of string into r0
			MOV R2, #CHAR ;moves number of char into r2 for the count
			MOV R3, #0 ;sets r3 to 0 for the counter
			LDRB R1, [R0] ;loads r0 into r1 (first byte)
			CMP R1, R2 ;compares r2 and r1 (to see if first byte equals char)
			ADDEQ R3, #1 ;adds 1 to counter if true
			
loop		LDRB R1, [R0, #1]! ;shifts by 1 byte and stores into r1

			CMP R1, R2 ;checks if true
			ADDEQ R3, #1 ;increments if true
			CMP R1, #0 ;checks if r1 is 0, which means no more bytes
			BNE loop ;if not equal then branches to loop
stop		B stop

string DCB "If you are going to pass, you gotta love this class!", 0
			ALIGN
			END