			GLOBAL  Reset_Handler
			AREA lab4, CODE, Readonly
Reset_Handler    

PINSEL0   	EQU 0xE002C000   	;pin function selection for port 0
			MOV  r0,#0   
			LDR  R1, =PINSEL0
			STR  R0,[r1]   
IO0DIR   	EQU 0xE0028008 
			MOV R5, #0xFF00
			LDR R1, =0xE0028008 
			STR R5, [R1, #0x8]; Set to output pin
IO0PIN    	EQU 0xE0028000  
			MOV  r0, #0x00000000 ;sets all LEDs on 
			LDR  r1, =IO0PIN   
			STR  r0, [r1]	
			MOV  r0, #0xFF00 	;sets all LEDS off   
			LDR  r1, =IO0PIN   
			STR  r0, [r1]	
			MOV  r0, #0xAA00 	;sets every other LED on (LED 5 on, LED 6 off, etc)
			LDR  r1, =IO0PIN   
			STR  r0, [r1]	
stop   		B   stop 
			END  