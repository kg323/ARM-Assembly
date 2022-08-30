
			GLOBAL LED_Setup
			AREA lab8_1, CODE, READONLY
LED_Setup	

PINSEL0		equ		0xE002C000
IO0PIN		equ		0xE0028000
IO0SET		equ		0xE0028004
IO0DIR		equ		0xE0028008
IO0CLR		equ		0xE002800C
	
			
			ldr		R0,=PINSEL0	
			ldr		R1, [R0]			;set GPIO
			ldr 	R2,=0xFF00			
			and		R2, R2,	R1
			str		R2, [R0]
			
			ldr		R0,=IO0DIR			;setting direction as outward
			ldr		R1,	[R0]
			ldr		R2,=0xFF00
			orr		R2, R2, R1
			str		R2,	[R0]
			
			ldr		R0,=IO0SET			;output
			ldr		R2,=0xFF00			
			str		R2, [R0]
			
			ldmia	sp!, {R0,R1}
			bx		lr
			END

; this is the subroutine for LED setup