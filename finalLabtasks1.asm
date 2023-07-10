//1.Write assembly code for the following structure.
If(AL >= ‘A’) then put 5 in cl and print
else put 6 in cl and print.

.model small
.stack 100h
.data
msg DB "Please enter a letter or character: $"

.code  
main proc
mov ax,@data
mov ds,ax

mov ah,9
lea dx,msg
int 21h

mov ah,1
int 21h
mov dl,al   

cmp dl,"A"

JGE print_5
JMP Else

print_5:  
mov cl,53

mov ah,2
mov dl,cl
int 21h

jmp exit

Else:
 mov cl,54

mov ah,2
mov dl,cl
int 21h
   jmp exit
   
   exit:
   mov ah,4ch
   int 21h
   
   main endp
   end main

______________________________________________________
//2.	Write a code to implement the following-
If it's "A", then execute carriage return. 
If it's "Bn, then execute line feed. 
If it's any other character, then return to DOS.

.model small
.stack 100h
.data
msg DB "Please enter a letter or character: $" 
msg1 DB "This is carriage a return$"
msg2 DB "This is line a feed$"

.code  
main proc
mov ax,@data
mov ds,ax

mov ah,9
lea dx,msg
int 21h

mov ah,1
int 21h

mov bl,al ;need to mov to bl bcoz 2 cmp same time
   
mov ah,2
cmp bl,"A"
int 21h

JE cret 


mov ah,2
cmp bl,"B"
int 21h  


JE lfeed
JMP exit 

cret:  
mov ah,2
mov dl,0ah
int 21h
mov ah,2
mov dl,0dh
int 21h

mov ah,9
lea dx,msg1
int 21h

jmp exit

lfeed: 
mov ah,2
mov dl,0ah
int 21h

mov ah,9
lea dx,msg2
int 21h 

   jmp exit
   
   exit:
   mov ah,4ch
   int 21h
   
   main endp
   end main

___________________________________________
//3.Write assembly code for the following structure.
IF AY < BX 
 THEN 
  put 0 in AX 
 ELSE 
  IF BX < CX 
 THEN 
  put 0 in BX 
 ELSE 
  put 0 in CX 
END IF 
END IF

.MODEL SMALL
.STACK 100H

.DATA
    AX DW 5
    BX DW 10
    CX DW 8

.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX

        
        CMP AX, BX
        JB ELSE1    

        
        CMP BX, CX
        JB ELSE2    

        
        MOV CX, 0
        JMP ENDIF1   

    ELSE2:
        
        MOV BX, 0
        JMP ENDIF1  

    ELSE1:
        
        MOV AX, 0

    ENDIF1:
        
        MOV AH, 4CH
        INT 21H

    MAIN ENDP
END MAIN

_________________________________________________
//4.Write a program that will prompt the user to enter anything, display it on the next line in, and ask the user if he or she wants to do it again. If the user types "y" or "Y", the ·program repeats; If the user types anything else, the program terminates. If the user enters an illegal character, prompt the user to try again.

.MODEL SMALL
.STACK 100H

.DATA
in_msg  DB "Enter anything:$"
repeat_msg DB "Do you want to try again? (y/n):$"
error_msg  DB "Illegal character. Try again.$"

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

start:
    
    mov ah,2
    mov dl,0ah
    int 21h
    mov ah,2
    mov dl,0dh
    int 21h
    
    MOV AH,9
    LEA DX,in_msg
    INT 21H

    
    MOV AH,1   
    INT 21H
    
    mov bl,al
    
    mov ah,2
    mov dl,0ah
    int 21h
    mov ah,2
    mov dl,0dh
    int 21h
    
    
    mov ah,2
    mov dl,bl
    int 21h

    mov ah,2
    mov dl,0ah
    int 21h
    mov ah,2
    mov dl,0dh
    int 21h
    
    MOV AH, 09H
    LEA DX, repeat_msg
    INT 21H

    
    MOV AH,1
    INT 21H

   
    CMP AL, 'y'
    JE start
    CMP AL, 'Y'
    JE start
    CMP AL, 'n'
    JE exit_program


exit_program:
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN
 
 
