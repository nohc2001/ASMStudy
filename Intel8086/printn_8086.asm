; Program to show use of interrupts
; Also, Hello World program !
hello: DB "numem" ; store string

; BX is the parameter.
def printn{
MOV DI, 0 ; char* di = 0;
MOV CX, BX ; c = b;

;sum : 
;*di = '0' + c / 10000; 
;++di; 
;c = b - c/10000*10000 aka c % 10000]
MOV AX, CX
MOV DX, 10000
DIV DX
MOV CL, AL ; c /= 10000;
ADD CL, 48 ; c += '0';
MOV byte[DI], CL ; *di = c; ('0' ~ '9' charactor)
ADD DI, 1 ; ++di;   
SUB CL, 48 ; c -= '0';
MUL DX
MOV CX, AX ; c *= 10000;
MOV DX, BX ; d = b;
SUB DX, CX ; d -= c;
MOV CX, DX ; c = d;
MOV BX, DX ; b = d;

;sum : 
;*di = '0' + c / 1000; 
;++di; 
;c = b - c/1000*1000 aka c % 1000]
MOV AX, CX
MOV DX, 1000
DIV DX
MOV CX, AX ; c /= 1000;
ADD CL, 48 ; c += '0';
MOV byte[DI], CL ; *di = c; ('0' ~ '9' charactor)
ADD DI, 1 ; ++di;   
SUB CL, 48 ; c -= '0';
MUL DX
MOV CX, AX ; c *= 1000;
MOV DX, BX ; d = b;
SUB DX, CX ; d -= c;
MOV CX, DX ; c = d;
MOV BX, DX ; b = d;

;sum : 
;*di = '0' + c / 100; 
;++di; 
;c = b - c/100*100 aka c % 100]
MOV AX, CX
MOV DX, 100
DIV DX
MOV CX, AX ; c /= 100;
ADD CL, 48 ; c += '0';
MOV byte[DI], CL ; *di = c; ('0' ~ '9' charactor)
ADD DI, 1 ; ++di;   
SUB CL, 48 ; c -= '0';
MUL DX
MOV CX, AX ; c *= 100;
MOV DX, BX ; d = b;
SUB DX, CX ; d -= c;
MOV CX, DX ; c = d;
MOV BX, DX ; b = d;

;sum : 
;*di = '0' + c / 10; 
;++di; 
;c = b - c/10*10 aka c % 10]
MOV AX, CX
MOV DX, 10
DIV DX
MOV CX, AX ; c /= 10;
ADD CL, 48 ; c += '0';
MOV byte[DI], CL ; *di = c; ('0' ~ '9' charactor)
ADD DI, 1 ; ++di;   
SUB CL, 48 ; c -= '0';
MUL DX
MOV CX, AX ; c *= 10;
MOV DX, BX ; d = b;
SUB DX, CX ; d -= c;
MOV CX, DX ; c = d;
MOV BX, DX ; b = d;

;sum : 
;*di = '0' + c / 1; 
;++di; 
;c = b - c/10*10 aka c % 1]
MOV AX, CX
MOV DX, 1
DIV DX
MOV CX, AX ; c /= 1;
ADD CL, 48 ; c += '0';
MOV byte[DI], CL ; *di = c; ('0' ~ '9' charactor)
ADD DI, 1 ; ++di;   
SUB CL, 48 ; c -= '0';
MUL DX
MOV CX, AX ; c *= 1;
MOV DX, BX ; d = b;
SUB DX, CX ; d -= c;
MOV CX, DX ; c = d;

MOV AH, 0x13            ; move BIOS interrupt number in AH
MOV CX, 5              ; move length of string in cx
MOV BX, 0               ; mov 0 to bx, so we can move it to es
MOV ES, BX              ; move segment start of string to es, 0
MOV BP, OFFSET hello    ; move start offset of string in bp
MOV DL, 0               ; start writing from col 0
int 0x10                ; BIOS interrupt
ret
}

; actual entry point of the program, must be present
start:
MOV BX, 12345
call printn
