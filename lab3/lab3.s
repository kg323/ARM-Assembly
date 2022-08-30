		GLOBAL	user_code
			
SRAM_BASE	EQU	0x40000010
				
		AREA lab3, CODE, READONLY
		ENTRY
user_code

			LDR r0, = 0x40000000;
			LDR r1, = 0x40000004;
			MOV r2, #0xEF
			MOV r3, #0xAB
			STR r2, [r0]
			STR r3, [r1]
			
			LDR r4, = 0x40000008;
			LDR r5, = 0x4000000C;
			LDR r6, =0x33221100
			LDR r7, =0xFFEEDDCC
			STR r6, [r4]
			STR r7, [r5]
		
			MOV r8, #SRAM_BASE
			LDR r9, table
			STR r9, [r8]
			MOV r10, #SRAM_BASE+4
			LDR r11, table2
			STR r11, [r10]
			
stop 		B stop 

table		DCD	0x12345678
table2		DCD 0xFEDCBA98


			END
		