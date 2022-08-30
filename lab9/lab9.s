		IMPORT user_code
		;AREA lab9, CODE, READONLY
		;ENTRY

		
		;BL user_code
		

;num   EQU    10                      ; set number of words to be copied
									 ;; mark the first instruction called
;start
		;LDR    R0, =Set0             ; r0 = pointer to source block
		;LDR    R1, =data             ; r1 = pointer to destination block
		;MOV    R2, #num              ; r2 = number to copy
		;MOV    sp, #0x400            ;sp
;blockcopy
		;MOVS   R3,R2, LSR #3         ; Number of eight word multiples
		;BEQ    copywords             ; Fewer than eight words to move?
		;PUSH   {R4-R11}              ; Save some working registers
;copy
		;LDM    R0!, {R4-R9,R11}      ; Load 
		;STM    R1!, {R4-R9, R11}     ; store
		;SUBS   R3, R3, #1            ;Decrement the counter
		;BNE    copy               	 ;copy m
		;POP    {R4-R9, R11}          ;make space for these
                                    
;copywords 
		;ANDS   R2, R2, #7            ; Number of odd words to copy
		;BEQ    stop                  ;done
;wordcopy 
		;LDR    R3, [R0], #4          ; Load a word from the source and
		;STR    R3, [R1], #4          ; store it to the destination
		;SUBS   R2, R2, #1            ; Decrement the counter
		;BNE    wordcopy              ; ... copy more
;stop  	B stop

;data 	DCD -100, -43, 5, 20, 5, -15, -60, -148, -268, -340	

;Set0	DCD	-95,	-39,	1,	20,	7,	-15,	-55,	-148,	-266,	-340		
;Set1	DCD	-98,	-38,	2,	20,	9,	-13,	-57,	-152,	-264,	-330		
;Set2	DCD -105,	-40,	5,	21,	6,	-14,	-63,	-150,	-260,	-333		
;Set3	DCD -106,	-41,	5,	15,	6,	-12,	-66,	-141,	-261,	-331		
;Set4	DCD -101,	-42,	4,	27,	8,	-19,	-69,	-139,	-262,	-344		
;Set5	DCD -99,	-43,	5,	20,	4,	-17,	-61,	-144,	-269,	-341		
;Set6	DCD -102,	-49,	7,	24,	4,	-16,	-60,	-145,	-270,	-348		
;Set7	DCD -95,	-39,	5,	22,	3,	-15,	-62,	-148,	-272,	-330		
;Set8	DCD -96,	-35,	9,	19,	5,	-14,	-58,	-149,	-272,	-335		
;Set9	DCD -100,	-43,	6,	18,	5,	-14,	-55,	-140,	-274,	-340	
      ;END