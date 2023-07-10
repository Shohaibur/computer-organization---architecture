//1.Write an assembly code to take an input and test whether it is odd or oven. If odd print ‘o’ and if even print ‘e’.
.MODEL SMALL
.STACK 100H
.DATA
.CODE

MAIN PROC
  
    MOV AH,1      
    INT 21H            
    SUB AL, '0'        

    
    MOV BL, AL         
    AND BL, 1         
    CMP BL, 0         
    JE EVEN           
    
    
    MOV AH,2       
    MOV DL, 'o'        
    INT 21H           
    JMP EXIT           
    
EVEN:
    
    MOV AH,2     
    MOV DL, 'e'        
    INT 21H            

EXIT:
    MOV AH, 4CH       
    INT 21H            

MAIN ENDP
END MAIN

__________________________
//2.Write a case-based code to show how we can set, clear and compliment bits.
.MODEL SMALL
.STACK 100H
.DATA
    num DB 10010110b 
.CODE
MAIN PROC
    
    MOV AX,@DATA   
    MOV DS,AX
    
    
    OR num,00001000b
    
    
    AND num,01111111b
    
   
    XOR num,00000100b
    
   
    MOV AH,2        
    MOV DL, 'o'     
    AND num,00000001b 
    JZ EVEN         
    
    MOV DL,'o'      
    JMP EXIT
    
EVEN:
    MOV DL,'e'      
    
EXIT:
    INT 21H        
    
    MOV AH, 4CH     
    INT 21H        

MAIN ENDP
END MAIN

__________________________
//3.Write an assembly code to set the 3rd and 5th of a register containing the number 4h.
.model small
.stack 100h

.data

.code
    mov ax, 4h
    or ax, 10b
    or ax, 10000b
    mov ax, 4414h

    mov ah, 4ch
    int 21h
end

__________________________
//4.Write an assembly code to convert ‘f’ to ‘F’.
.MODEL SMALL
.STACK 100H

.DATA
  N db ?

.CODE
MAIN PROC
   
    
    mov ah,1
    int 21h
    
    mov N,al   
    sub N,32      
    mov dl,N
  
    MOV AH, 2       
    INT 21H         
    
    
    MOV AH, 4CH     
    INT 21H         

MAIN ENDP
END MAIN

______________________________
//5.Write an assembly code to convert ‘F’ to ‘f’.
.MODEL SMALL
.STACK 100H

.DATA
  N db ?

.CODE
MAIN PROC
   
    
    mov ah,1
    int 21h
    
    mov N,al   
    add N,32      
    mov dl,N
  
    MOV AH, 2       
    INT 21H         
    
    
    MOV AH, 4CH     
    INT 21H         

MAIN ENDP
END MAIN

_______________________
//6.Write an assembly code to left shift the contents a register by the total number of time input by the user.
.MODEL SMALL
.STACK 100h

.DATA
    shift DB ?
    num DB 20h   

.CODE
MAIN PROC
    MOV AX, @DATA  
    MOV DS, AX
    
    
    MOV AH, 01h     
    INT 21h         
    SUB AL, 30h     
    MOV shift,AL   
    

    MOV CL,shift  
    SHL num,CL     
    
 
    MOV AH,2    
    MOV DL,num     
    ADD DL,30    
    INT 21h         
    
    MOV AH, 4Ch     
    INT 21h        
MAIN ENDP

END MAIN

___________________________
//7.Write an assembly code to right shift the contents a register by 1.
.model small
.stack 100h

.data

.code
    mov al, 10101000b
    shr ax, 1

    mov ah, 4ch
    int 21h
end

________________________
//8.Write an assembly code to right shift the contents a register by the total number of time input by the user.
.MODEL SMALL
.STACK 100H

.DATA
    inputMsg DB 'Enter a number: $'
    shift DB ?
    value DW 1234H 

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    
    LEA DX, inputMsg
    MOV AH, 09H
    INT 21H

   
    MOV AH, 01H
    INT 21H
    SUB AL, 30H 
    MOV bx, AL


    MOV CX, cx
    MOV BX, value
shift:
    SHR BX, 1 
    LOOP shift

    
    MOV AX, BX
    MOV DL, AH 
    MOV AH, 02H
    INT 21H
    MOV DL, AL 
    INT 21H

    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN



