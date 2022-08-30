		AREA project, CODE, READONLY
		ENTRY
	
value	EQU 255 			;pixel value used to compare with current value
N		EQU 64 				;counter of total pixels in picture
	
		MOV R0, #0 ;i=0
		MOV R1, #value ;R1=255
		
		
loop	;for loop (i=0,, i<N, i++)
		LDR R4, =LINE1 		;address of array
		LDRB R5, [R4] 		;R4=[N]
		MOV R6, #N 			;N=64 (counter for loop)
		MOV R3, #0 			;j=0
		CMP R0, R1 			;check if i<value
		MOV R2, #0 			;value counter
		BLT done 			;continue loop until condition satisfied and loops out
		ADD R0, R0, #1 		;i++
		BGE stop 			;branch to second for loop if true (i>=N)
		
		
done ;for loop (j=0, j<value, j++)
		CMP R3, R1			; checks if j<value
		CMP R6, #0 		 	;checks if counter is equal to 0
		ADDEQ R0,R0,#1 	 	;i++ if j>value
		BEQ loop 		 	;branch to first loop if greater than
		B statement 	 	;continues loop until condition satisfied and loops out
			
			
statement ;if statement
		SUB R6, R6, #1		;counter--
		CMP R5, R0 		 	;if statement (array[j] == i)
		BEQ true 		 	;branch to counter++
		LDRB R5, [R4, #1]!  ;shifts by 1 byte and stores into r1
		ADD R3, R3, #1 		;j++
		B done 				;loops back to second for loop if false
		
		
true ;loop to have counter++
		LDRB R5, [R4, #1]!  ;shifts by 1 byte and stores into r1
		ADD R2, R2, #1 		;counter++
		ADD R3, R3, #1 		;j++
		B done 				;loop back to second for loop

stop	B	stop     		;ends algortithm

LINE1	DCB	145,145,145,145,145,145,145,145,145,145,208,208,208,208,145,145,145,208,208,208,208,208,208,145,145,177,208,0,208,0,208
		DCB	145,177,208,208,43,208,43,208,145,73,177,177,208,208,73,145,135,73,82,82,135,73,82,135,177,177,177,146,208,208,208,146,177
		
		END