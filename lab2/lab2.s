		AREA lab2, CODE, READONLY
		ENTRY

		MOV R0, #12   		;load 12 into r0    
		MOV R3, #0    		;load first (prev) number into r3   
		MOV R4, #1    		;load second (next) number into r4  
		ADDS R2,R3,R4       ;adds r3 and r4 and places sum into r2 (Sum)
		SUBS R0, R0,1 		;counter that subtracts from r0 since 1 iteration was done
loop
		MOV R3,R4          ;updates r3 with the (next) in order to add previous to next 
		MOV R4,R2      	   ;updates r4 with the (sum) in order to have as the next number (x + previous)
		SUBS R0, R0,1      ;counter that subtracts from the 12 in r0 in order to update flag when  r0 is 0
		BEQ finish         ;condition that branches when r0 is equal to 0 
		ADDS R2, R3,R2	   ;adds (sum) with (prev) and stores in r2
		BAL loop   		   ;condition that states if flag is not 0 then branch to loop until true
	
finish		
		MOV R1,R2    	   ;updates r1 with the last value in r2    
stop    B stop           
		END