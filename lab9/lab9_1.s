		GLOBAL user_code
		AREA lab9_1, CODE, READONLY
		ENTRY
user_code
N		EQU 10
		LDR R0, =data
		MOV R1, #N
		MOV R8, #4
		
		MOV R2,#0
		MOV R3,#1
		SUB R3,R1,R3
loop 	MUL R4,R3,R8
		SUB R5,R1,#1
		SUB R5,R5,R3
		LDR R6,[R0,R4]
		MUL R5,R6,R5
		MUL R7,R6,R3
		SUB R5,R7,R5
		ADD R2,R2,R5
		SUB R3,R3,#1
		CMP R3,#0
		BGE loop
	
		BX 	LR
data 	DCD -100, -43, 5, 20, 5, -15, -60, -148, -268, -340		
		
		END