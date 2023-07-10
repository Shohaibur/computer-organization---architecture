// 1.A program checks whether the value of DL register is 1,2,3 or 4. If the value is 1 or 3 then it prints ‘o’ and if the value is 2 or 4 then it prints ‘e’.

.MODEL SMALL
.STACK 100H

.DATA
    msg1 DB "Enter value for DL: $"
    msg2 DB "o"
    msg3 DB "e"
    msg4 DB "Wrong input$"
.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX
        
        
        MOV AH,9
        LEA DX, msg1
        INT 21H
        
       
        MOV AH,1
        INT 21H 
        
        SUB AL,30H  
        MOV DL, AL
        
      
        
        CMP DL,1
        JE ENDIF1   
        
        CMP DL,3 
        JE ENDIF1
         
        CMP DL,2
        JE ENDIF2  
         
        CMP DL,4
        JE ENDIF2  
        
        JNE ENDIF3
       
   
        
    ENDIF1: 
    
        mov ah,2
        mov dl,0ah
        int 21h
        mov ah,2
        mov dl,0dh
        int 21h
        
        mov ah,2 
        mov dl, "o"
        int 21h  
        
        jmp exit
    
    ENDIF2: 
    
        mov ah,2
        mov dl,0ah
        int 21h
        mov ah,2
        mov dl,0dh
        int 21h
        
        mov ah,2 
        mov dl, "e"
        int 21h  
        
        jmp exit
        
    ENDIF3:
    
        mov ah,2
        mov dl,0ah
        int 21h
        mov ah,2
        mov dl,0dh
        int 21h
        mov ah,9
        lea dx,msg4
        int 21h
    exit:    
        MOV AH, 4CH  
        INT 21H
    MAIN ENDP
END MAIN

_________________________________________
//2.A program checks the value of DL and CL register. If the value of DL and CL is below 3 then it prints ‘b’.
.MODEL SMALL
.STACK 100H

.DATA
    msg1 DB "Enter value for DL: $"
    msg2 DB "Enter value for CL: $"
    msg3 DB "b$"  
    msg4 DB "Out of range$"

.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX
        
        
        MOV AH,9
        LEA DX, msg1
        INT 21H
        
       
        MOV AH,1
        INT 21H 
        
        SUB AL,30H  
        MOV DL, AL
        
      
        MOV AH,9
        LEA DX, msg2
        INT 21H
        
       
        MOV AH,1
        INT 21H 
        
        SUB AL, 30H   
        MOV CL, AL
        
        
        CMP DL, 3
        JB ENDIF1 
          
        CMP CL, 3
        JB ENDIF1 
          
        CMP DL, 3
        JAE ENDIF2 
        
        CMP CL, 3  
        JAE ENDIF2
       
       
    ENDIF1: 
    
        mov ah,2
        mov dl,0ah
        int 21h
        mov ah,2
        mov dl,0dh
        int 21h
        
        MOV AH,9
        LEA DX, msg3
        INT 21H 
        
       jmp exit
     
    ENDIF2: 
    
        mov ah,2
        mov dl,0ah
        int 21h
        mov ah,2
        mov dl,0dh
        int 21h
        
        MOV AH,9
        LEA DX, msg4
        INT 21H   
        
     exit:
        
        MOV AH, 4CH  
        INT 21H
        
    MAIN ENDP
END MAIN

______________________________________
//3.Write a program that takes input from the user. If the input is ‘1’ then the program will show sum of 2 and 3. If the input is ‘2’ then the program will show the subtraction of 4 and 3. If the input is ‘3’ then the program will print the input. For other cases the program will show a character.
.MODEL SMALL
.STACK 100H

.DATA
    msg1 DB "Enter something: $"
    msg2 DB "sum=5$"
    msg3 DB "sub=1$"
    msg4 DB "You entered:$"

.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX
        
        
        MOV AH,9
        LEA DX, msg1
        INT 21H
        
       
        MOV AH,1
        INT 21H 
        
        SUB AL,30H  
        MOV DL, AL
        
      
        
        CMP DL,1
        JE ENDIF1   
        
        CMP DL,2 
        JE ENDIF2
         
        CMP DL,3
        JE ENDIF3 
        
        JNE ENDIF4  
          
        
  
        
    ENDIF1: 
    
        mov ah,2
        mov dl,0ah
        int 21h
        mov ah,2
        mov dl,0dh
        int 21h
        
        mov ah,9 
        lea dx,msg2
        int 21h  
        
        jmp exit
    
    ENDIF2: 
    
        mov ah,2
        mov dl,0ah
        int 21h
        mov ah,2
        mov dl,0dh
        int 21h
        
        mov ah,9 
        lea dx,msg3
        int 21h 
          
        jmp exit 
         
    ENDIF3: 
    
        mov ah,2
        mov dl,0ah
        int 21h
        mov ah,2
        mov dl,0dh
        int 21h
        
        mov ah,9 
        lea dx,msg4
        int 21h   
        
        mov ah,2
        mov dl,33h
        int 21h
                 
      jmp exit  
        
      ENDIF4: 
    
        mov ah,2
        mov dl,0ah
        int 21h
        mov ah,2
        mov dl,0dh
        int 21h
          
        mov ah,2
        mov dl,2
        int 21h
         
        
    exit:    
        MOV AH, 4CH  
        INT 21H
    MAIN ENDP
END MAIN


_____________________________
//4.Write a program to print any ASCII character for 30 times.
.model small
.stack 100h
.data
.code
main proc
    
  mov cx,30
  mov bx,0
    
    
  print:
    
    cmp bx,cx    
    JE exit 
    inc bx  
    
    mov ah,2
    mov dl,4
    int 21h
     
    
    JNE print
    
         
    exit:
    mov ah,4ch
    int 21h
    
    main endp
end main

_____________________________________
//5.Write a program to print any ASCII character for 30 times in 3 separate lines each containing 10 characters.
.model small
.stack 100h
.data 

    CHAR DB 'A'  
    COUNT DB 0
       
.code 
main proc
MOV CX, 30   
MOV DX, 0    

PRINT_LOOP:
    MOV AH,2     
    MOV DL,4    
    INT 21H         

    INC COUNT       

    
    CMP COUNT, 10
    JE NEW_LINE     

    
    CMP COUNT, 30
    JNE PRINT_LOOP  

NEW_LINE:
    MOV AH,2    
    MOV DL,0DH     
    INT 21H         

    MOV DL,0AH     
    INT 21H         

    
    MOV COUNT,0
    INC DX          

    
    CMP DX, 3
    JNE PRINT_LOOP
    je exit  

exit:
MOV AH, 4CH     
INT 21H         
               
main endp
end main

__________________________________________
//6.Write a code that takes input from a user and stops taking it when ‘enter’ pressed.
.MODEL SMALL
.STACK 100H

.DATA
    BUFFER DB 100 DUP('$')   
    NEW_LINE DB 0DH, 0AH, '$' 
    MESSAGE DB 'Enter your input: $'

.CODE
MAIN PROC
    
    MOV AX, @DATA      
    MOV DS, AX

    
    MOV AH, 09H
    LEA DX, MESSAGE
    INT 21H

    
    MOV AH, 0AH
    MOV DX, OFFSET BUFFER
    INT 21H

   
    MOV AH, 09H
    LEA DX, NEW_LINE
    INT 21H

    MOV AH, 09H
    LEA DX, BUFFER
    INT 21H

    
    MOV AH, 4CH
    INT 21H

MAIN ENDP

END MAIN

____________________________________
//7.Write a code that takes input from a user and stops when the length of the input is more than 5.
.MODEL SMALL
.STACK 100H

.DATA
    inputBuffer DB 6, ?, 5 DUP ('$')

.CODE
MAIN PROC
    
    MOV AX, @DATA
    MOV DS, AX
    
    MOV AH, 0AH
    MOV DX, OFFSET inputBuffer
    INT 21H
    
    CMP BYTE PTR[inputBuffer+1], 5
    JA TERMINATE
    
    MOV AH, 9
    MOV DX, OFFSET inputBuffer
    INT 21H
    
    JMP EXIT
    
TERMINATE:
    MOV AH, 4CH
    INT 21H

EXIT:
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN

__________________________________
//8.Convert the following high-level pseudocode into assembly code
If(AL >= 2||AL <= 9)
	{
		ask user to input a character and print
}
	Else
		{
			
			If(AL == character)
				{
					print ‘c’
				}
			Else
				{ 	print ‘n’
				}
}


.model small
.stack 100h
.data
.code 
    MOV AH, 0BH
    MOV CX, 1
    INT 21H

    CMP AL, '2'
    JB ELSE_BLOCK
    CMP AL, '9'
    JA ELSE_BLOCK

    MOV AH, 02H
    MOV DL,AL
    INT 21H

    MOV AH, 0BH
    MOV CX, 1
    INT 21H

    MOV AH, 02H
    MOV DL, AL
    INT 21H

    JMP END_PROGRAM

ELSE_BLOCK:
    CMP AL,DL
    JNE ELSE_BLOCK2

    MOV AH, 02H
    MOV DL, 'c'
    INT 21H

    JMP END_PROGRAM

ELSE_BLOCK2:
    MOV AH, 02H
    MOV DL, 'n'
    INT 21H

END_PROGRAM:
    MOV AH, 4CH
    INT 21H

