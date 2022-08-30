			GLOBAL delay
			IMPORT LED_Setup
			AREA lab8_4, CODE, READONLY
delay	

time		equ		0x2EFFFF
				
			ldr		r3,=time
			mov		r4, #1
					
loop		add		r4, r4, #1
			cmp		r4, r3
			bne		loop

			bx		lr
			END
				
; this is the subroutine for the LEDs delay 