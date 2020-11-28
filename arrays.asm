CODE_SEG    SEGMENT
              
            ASSUME  CS:CODE_SEG  

            ORG     100H

;---------------------------------------------
;
; MAIN procedure to demonstare array functions
;
;---------------------------------------------
                                               
MAIN                PROC
            
                    JMP         START
                    
ARRAY_1             DW          10 DUP (1)
ARRAY_2             DW          10 DUP (2)
ARRAY_3             DW          10 DUP (0)
ARRAY_4             DW          1,2,3,4,5,6,7,8,9,10
ARRAY_5             DW          10 DUP (0) 

START:              NOP
        
;Add values of ARRAY_1 and ARRAY_2 into ARRAY_3 corespondingly **************************

                    MOV         SI,OFFSET ARRAY_1
                    MOV         BX,OFFSET ARRAY_2
                    MOV         DI,OFFSET ARRAY_3
                    
                    MOV         CX,000AH
                    
ADD_LOOP:           LODSW                           
                    ADD         AX,WORD PTR [BX]
                    STOSW
                    
                    INC         BX
                    INC         BX
                    
                    LOOP        ADD_LOOP  
                    
;Values of ARRAY_4 will be squared into ARRAY_5 corespondingly **************************

                    MOV         SI,OFFSET ARRAY_4
                    MOV         DI,OFFSET ARRAY_5
                    
                    MOV         CX,000AH
                    
MUL_LOOP:           LODSW                           
                    MUL         AX
                    STOSW
  
                    LOOP        MUL_LOOP  
                    
;---------------------------------------------        
                              
CODE_SEG            ENDS

                    END MAIN