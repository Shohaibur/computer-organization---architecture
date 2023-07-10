//1.Write a program that prompts the user to enter a character, and on subsequent lines prints its ASCII code in binary and the total number of 1 bit in the next line.
.model small
.stack 100h

.data
    Msg DB 'Enter a character: $'
    Msg1 DB 'Binary form: $'
    Msg2 DB 'Number of 1s: $'
    binaryForm DB 8 DUP ('$') 

.code
    main PROC
        mov ax, @data   
        mov ds, ax

        
        mov ah, 09h
        mov dx, OFFSET Msg
        int 21h

    
        mov ah, 01h
        int 21h
        mov bl, al 

    
        mov cx, 8
        mov si, OFFSET binaryForm
        loop1:
            mov dl, '0'
            test bl, 10000000b 
            jz zero
            mov dl, '1'
            inc al 
        zero:
            mov [si], dl 
            shl bl, 1 
            inc si
            loop loop1

        mov ah, 09h
        mov dx, OFFSET Msg1
        int 21h
        mov cx, 8
        mov si, OFFSET binaryForm
        loop2:
            mov dl, [si]
            mov ah, 02h
            int 21h
            inc si
            loop loop2


        mov ah, 09h
        mov dx, OFFSET Msg2
        int 21h
        mov dl, al
        add dl, '0'
        mov ah, 02h
        int 21h

        mov ah, 4ch
        int 21h
    main ENDP

END main

__________________________________
//2.Write a program that prompts the user to enter a character and prints the ASCII code of the character in hex on the next line. Repeat this process until the user types a carriage return.
.MODEL SMALL
.STACK 100H

.DATA
PROMPT_1  DB  0DH,0AH,'Enter the character : $'
PROMPT_2  DB  0DH,0AH,'The Ascii code of the char in hexadecimal : $'

.CODE
MAIN PROC
MOV AX, @DATA
MOV DS, AX

@START:
LEA DX, PROMPT_1
MOV AH, 9
INT 21H

MOV AH, 1
INT 21H

MOV BL, AL

CMP BL, 0DH
JE @END

LEA DX, PROMPT_2
MOV AH, 9
INT 21H

XOR DX, DX
MOV CX, 4

@LOOP_1:
SHL BL, 1
RCL DL, 1
LOOP @LOOP_1

MOV CX, 4

@LOOP_2:
SHL BL, 1
RCL DH, 1
LOOP @LOOP_2

MOV BX, DX
MOV CX, 2

@LOOP_3:
CMP CX, 1
JE @SECOND_DIGIT
MOV DL, BL
JMP @NEXT

@SECOND_DIGIT:
MOV DL, BH

@NEXT:
MOV AH, 2

CMP DL, 9
JBE @NUMERIC_DIGIT
SUB DL, 9
OR DL, 40H
JMP @DISPLAY

@NUMERIC_DIGIT:
OR DL, 30H

@DISPLAY:
INT 21H
LOOP @LOOP_3

JMP @START

@END:
MOV AH, 4CH
INT 21H
MAIN ENDP
END MAIN

______________________________
//3.Write a program that prompts the user to type a binary number of 16 digits or less, and outputs It In hex on the next line. If the user enters an illegal character, he or she should be prompted to begin again.
.MODEL SMALL
.STACK 100H

.DATA
PROMPT DB 'Enter a binary number: $'
HEX DB 6 DUP ('$')
HEX_MSG DB 'Hexadecimal: $'
NEWLINE DB 0DH,0AH,'$'

.CODE
MAIN PROC
MOV AX, @DATA
MOV DS, AX

LEA DX, PROMPT
MOV AH, 9
INT 21H

MOV CX, 16
XOR AX, AX
READ_LOOP:
MOV AH, 1
INT 21H

CMP AL, 0DH
JE END_READ_LOOP

CMP AL, '0'
JL READ_LOOP
CMP AL, '1'
JG READ_LOOP

SUB AL, '0'
SHL AX, 1
ADD AH, AL

LOOP READ_LOOP

END_READ_LOOP:

MOV SI, OFFSET HEX + 5
MOV DX, 4
HEX_LOOP:
AND AH, 00001111B
ADD AH, '0'
CMP AH, '9'
JLE HEX_DIGIT
ADD AH, 7

HEX_DIGIT:
MOV BYTE PTR [SI], AH

SHR AX, 4

DEC SI

DEC DX
JNZ HEX_LOOP

LEA DX, HEX_MSG
MOV AH, 9
INT 21H

LEA DX, HEX
MOV AH, 9
INT 21H

LEA DX, NEWLINE
MOV AH, 9
INT 21H

MOV AH, 4CH
INT 21H
MAIN ENDP
END MAIN
