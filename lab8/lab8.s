		GLOBAL user_code
		IMPORT LED_Setup
		IMPORT LED_ON

;driver 
		AREA lab8, CODE, READONLY
user_code	
			bl LED_Setup
			bl LED_ON
stop		b stop
			END

			
						


