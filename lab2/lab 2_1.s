				AREA lab2_1, CODE, READONLY
				ENTRY
			
	
				LDR R1, array    			; R1 = array address
				LDR R2, =0x4000004C;        ; R2 = array index position to store R0 into
				STR R0, [R1, R2] 			; store R0 into array R1	
				ADD R4, R1, 10				;add 10 to array then store in R1
				
				LDR R3, =0x400000AC; 		;load value into R3
				STR R3, [R4] 				;store r4 into r3
				
				ALIGN
array			DCD 12,-4094,-1000,2012,8,0,150,200004,-1245,2222
				
stop			B stop
				END