; --------------------------------------------------------
yulya segment para 'code'
assume cs:yulya, ds:yulya,es:yulya,ss:yulya
org 100h
begin: jmp main
;----------------------------------------------------------
; �뤥����� � ���樠������ �祥� ����⨢��� �����
s db '������⢮ ������ ��� = $'
nr db ?
s0 db 13,10,'��⠭����� ᫥���騩 ⨯ ���:',13,10,'$'
s1 db '1 - Bus Mouse',13,10,'$'
s2 db '2 - Serial Mouse',13,10,'$'
s3 db '3 - Inport Mouse',13,10,'$'
s4 db '4 - PS/2 Mouse',13,10,'$'
s5 db '5 - HP Mouse',13,10,'$'
X1 dw ?
Y1 dw ?
X dw ?
Y dw ?
saves dw ?
MN db 8
s_k db 5 DUP(?)
;------------��� �뢮�� ---------------------
date dw ?
my_s db '+'
T_Th db ?
Th db ?
Hu db ?
Tens db ?
Ones db ?
;---------------------------------
; ---------------------------------------------------------
main proc near
; ******** ��� ������୮� ࠡ��� **********************
; ����祭�� ⥪�饣� �����०���
mov ah,0fh
int 10h
mov nr,al ; nr - ����� ०���
; ���樠������ ���
mov ax,0000h
int 33h
; �뢮� ������⢠ ������ ���
mov ah,09
lea dx,s
int 21h
mov ah,02
mov dl,bl
add dl,48
int 21h
; ����祭�� ���ଠ樨 � ⨯� ��� ***************
mov ah,09
lea dx,s0
int 21h
mov ax,0024h
int 33h
; �뢮� ���ଠ樨 � ⨯� ��� ***************
cmp ch,1

jne @z2
; 1 ⨯
mov ah,09
lea dx,s1
int 21h
jmp @z100
@z2: cmp ch,2
jne @z3
; 2 ⨯
mov ah,09
lea dx,s2
int 21h
jmp @z100
@z3: cmp ch,3
jne @z4
; 3 ⨯
mov ah,09
lea dx,s3
int 21h
jmp @z100
@z4: cmp ch,4
jne @z5
; 4 ⨯
mov ah,09
lea dx,s4
int 21h
jmp @z100
@z5: cmp ch,5
jne @z100
; 5 ⨯
mov ah,09
lea dx,s5
int 21h
@z100:
; �������� ������ �� ������
mov ah,0 ; ����砥� ����� ������
int 16h
; �몫���� �����
mov ah,01
mov ch,20h
int 10h
; ������� ����� ���
mov ax,0001
int 33h
@save:
mov ax,X1
idiv mn
mov X,ax
mov ax,X
mov saves,ax
looping:
; ������� ���न���� ����� ���


mov ax,0003
int 33h
test bx,00000001b
jne @save
test bx,00000010b
jne @go_out
;cmp bx,1
;jnz looping
mov X1,cx
mov Y1,dx
; ����� �� 8
mov ax,X1
idiv mn
mov X,ax
mov ax,Y1
idiv mn
mov Y,ax
call form_str
call viv_coord
jmp looping
;*******************************************************
@go_out:
mov X1,cx
mov ax,X1
idiv mn
mov X,ax
mov cx,X
;mov cx,saves
sub cx,saves
mov X,5
mov Y,cx
call form_str
call viv_coord
; �������� ������ �� ������
mov ah,0 ; ����砥� ����� ������
int 16h
; ����⠭������� ⥪�⮢��� ०���
mov ah,0
mov al,nr
int 10h
; ******************************************************
ret ; ������ � ����樮���� ��⥬�
main endp
;********************************************
viv_coord proc near
push cs
pop es
mov ah,13h
lea bp,s_k
mov cx,5
mov dh,0
mov dl,0
mov al,0
mov bl,1Eh
int 10h
ret
viv_coord endp
; ��ନ஢���� ��ப� ��� �뢮��
form_str proc near
mov ax,X
cbw
mov bl,10
idiv bl
add al,30h ; ����⪨ � ���� ᨬ����
add ah,30h ; ������� � ���� ᨬ����

mov bp,0
mov [s_k+bp],al
add bp,1
mov [s_k+bp],ah
; �஡��
add bp,1
mov [s_k+bp],' '
; ��� Y
mov ax,Y
cbw
mov bl,10
idiv bl
add al,30h ; ����⪨ � ���� ᨬ����
add ah,30h ; ������� � ���� ᨬ����
add bp,1
mov [s_k+bp],al
add bp,1
mov [s_k+bp],ah
ret
form_str endp
;???????????????????????????
vivod proc near
;--- ��᫮ ����⥫쭮� ?----------
mov ax,date
and ax,1000000000000000b
mov cl,15
shr ax,cl
cmp ax,1
jne @m1
mov ax,date
neg ax
mov my_s,'-'
jmp @m2
;--- ����砥� ����⪨ ����� ---------------
@m1: mov ax,date
@m2: cwd
mov bx,10000
idiv bx
mov T_Th,al
;------- ����砥� ����� --------------------
mov ax,dx
cwd
mov bx,1000
idiv bx
mov Th,al
;------ ����砥� �⭨ -----------------------
mov ax,dx
mov bl,100
idiv bl
mov Hu,al
;---- ����砥� ����⪨ � ������� ---------
mov al,ah
cbw

mov bl,10
idiv bl
mov Tens,al
mov Ones,ah
;--- �뢮��� ���� -----------------------
cmp my_s,'+'
je @m500
mov ah,02h
mov dl,my_s
int 21h
;---------- �뢮��� ���� -----------------
@m500: cmp T_TH,0 ; �஢�ઠ �� ����
je @m200
mov ah,02h ; �뢮��� �� �࠭, �᫨ �� ����
mov dl,T_Th
add dl,48
int 21h
@m200: cmp T_Th,0
jne @m300
cmp Th,0
je @m400
@m300: mov ah,02h
mov dl,Th
add dl,48
int 21h
@m400: cmp T_TH,0
jne @m600
cmp Th,0
jne @m600
cmp hu,0
je @m700
@m600: mov ah,02h
mov dl,Hu
add dl,48
int 21h
@m700: cmp T_TH,0
jne @m900
cmp Th,0
jne @m900
cmp Hu,0
jne @m900
cmp Tens,0
je @m950
@m900: mov ah,02h
mov dl,Tens
add dl,48
int 21h

@m950: mov ah,02h
mov dl,Ones
add dl,48
int 21h
mov ah,02h
mov dl,' '
int 21h
ret
vivod endp
yulya ends
end begin