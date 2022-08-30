			GLOBAL LED_ON
			IMPORT delay
			AREA lab8_2, CODE, READONLY
LED_ON	
			

IO0PIN		equ		0xE0028000
IO0SET		equ		0xE0028004
IO0CLR		equ		0xE002800C
			
			
			ldr		r0,=IO0PIN			;load address of IO0PIN
			ldr		r1,=0xFFFFFF7F		;P0.8 set to 0
			ldr		r6,=0x4000			;P0.15 set to 1
			ldr 	r7,=0x10000				
				
loop		lsl		r1, #1				;shifts zero to left
			add		r1, r1 ,#1			;keeps the first bit of r1 1
			lsl		r6,	#1				;shift 1 to left
			cmp		r6,	r7				;if r6 has bit 16 set to 1, then set to bit 8 to 1 and all others 0. 
			ldreq	r6,=0x0100			;loads with address if equal					
			ldr		r2, [r0]			;loads current output
			and		r2, r2, r1			;sets the current pin to 0 (on)
			orr		r2,	r2, r6			;sets the previous pin to 1 (off)
			str		r2, [r0]			;stores value in R2
			add		r5,	r5, #1			;adds 1 to counter
			cmp		r5, #8				;if iterated 8 times
			ldreq	r1,=0xFFFFFF7F		;reset P0.8
			ldreq	r6,=0x4000			;reset P0.15
			moveq	r5, #0				;counter resets
				
			bl		delay			;provides a delay before going to the next LED
			
			b		loop
			END
; this is the subroutine for turning on LEDs