print macro text
	mov ah,09
	lea dx,text
	int 21h
endm
nata segment 'code'
assume cs:nata, ds:nata, ss:nata, es:nata
org 100h
begin: jmp main
;------------��� ����� ---------------------
Buf db 7,7 DUP(?)
datev dw 0
mnoj dw ?
ps dw 10,13,'$'
;------------��� �뢮�� ---------------------
date dw ?
my_s db '+'
T_Th db ?
Th db ?
Hu db ?
Tens db ?
Ones db ?
;---------------------------------
temp1 dw ?
temp2 dw ?
temp3 dw ?
rez dw ?
Q dw ?
T dw ?
N dw 8
K dw ?
P dw ?
vvodA db 10,13,'����� ����� ���ᨢ� A!',10,13,'$'
vvodB db 10,13,'����� ����� ���ᨢ� B!',10,13,'$'
vivA db 10,13,'���ᨢ A:',10,13,'$'
vivB db 10,13,'���ᨢ B:',10,13,'$'
A dw 10 DUP(?)
B dw 10 DUP(?)
;---------------------------------
main proc near
; *************** ���������� ���ᨢ� X ***************
mov cx,10 ; 11 ����⮢ ���ᨢ� X
lea si,A ; ����㦠�� � si ���� ��ࢮ�� ����� ���ᨢ� X
@XVVOD:
push cx ; ��࠭塞 � �⥪� ���稪 横��
; �뢮��� ���᪠���
mov ah,09
lea dx,vvodA
int 21h
; ������ ���� ����� ���ᨢ�
call vvod
mov ax,datev ; datev - ��।��� �����
mov [si],ax ; ��࠭塞 ����� �� �����
add si,2 ; ���騢��� ���� �� 2
pop cx
loop @XVVOD
; *************** ����� ���������� ���ᨢ� X ***************
; *************** ���������� ���ᨢ� X ***************
mov cx,10 ; 11 ����⮢ ���ᨢ� X
lea si,B ; ����㦠�� � si ���� ��ࢮ�� ����� ���ᨢ� X
@XVVOD1:
push cx ; ��࠭塞 � �⥪� ���稪 横��
; �뢮��� ���᪠���
mov ah,09
lea dx,vvodB
int 21h
; ������ ���� ����� ���ᨢ�
call vvod
mov ax,datev ; datev - ��।��� �����
mov [si],ax ; ��࠭塞 ����� �� �����
add si,2 ; ���騢��� ���� �� 2
pop cx
loop @XVVOD1
; *************** ����� ���������� ���ᨢ� X ***************

;*************** �뢮� ���ᨢ� X **********************
mov ah,09

lea dx,vivA
int 21h
mov cx,10
lea si,A ; ���� ��ࢮ�� �����
@XVIVOD:
push cx
mov ax,[si] ; ��६ ��।��� �����
mov date,ax
; �뢮��� ����� �� �࠭
call vivod
add si,2 ; ���騢��� ���� �� 2
pop cx
loop @XVIVOD
; ��ॢ�� ��ப�
mov ah,09
lea dx,ps
int 21h
; *************** ����� �뢮�� ���ᨢ� X ***************
;*************** �뢮� ���ᨢ� X **********************
mov ah,09

lea dx,vivB
int 21h
mov cx,10
lea si,B ; ���� ��ࢮ�� �����
@XVIVOD1:
push cx
mov ax,[si] ; ��६ ��।��� �����
mov date,ax
; �뢮��� ����� �� �࠭
call vivod
add si,2 ; ���騢��� ���� �� 2
pop cx
loop @XVIVOD1
; ��ॢ�� ��ப�
mov ah,09
lea dx,ps
int 21h
; *************** ����� �뢮�� ���ᨢ� X ***************
; ********** ������ ����⮢ ���ᨢ� Y
mov cx,3 ; ��⠥� 3 ����⮢ ���ᨢ� Y
mov k, 0; ���� ���祭�� K
mov P,0

mov bp,1 ; ������ ����� � ���ᨢ� Y
@MY:
push cx
add k,2
add P,1




;��ࢮ� ᫠������
; ��⠥� ���� ����� k+B[k+1]
mov si,k
add si,2
mov ax, word ptr [B+si] ;B[k+1]
mov temp3,ax
																	;mov temp1,bx
																	;mov date,ax
																	;call vivod
																	;mov bx,temp1
mov bx,P
																	;mov temp1,bx
																	;mov date,bx
																	;call vivod
																	;mov bx,temp1
add bx,temp3 ;k+B[k+1]
																	;mov temp1,bx
																	;mov date,bx
																	;call vivod
																	;mov bx,temp1
mov temp1,bx
; ��⠥� ���� ����� k*A[k]
mov si,k
mov bx, word ptr [A+si] ;A[k]
																	;mov temp1,bx
																	;mov date,bx
																	;call vivod
																	;mov bx,temp1
mov ax,P
imul bx; k*A[k]
																	;mov temp1,bx
																	;mov date,ax
																	;call vivod
																	;mov bx,temp1
; ��⠥� ���� ����� k*A[k] / k+B[k+1]
idiv temp1
																	;mov date,ax
																	;call vivod
mov temp1, ax
;��஥ ᫠������
; ��⠥� ���� ����� B[N+1-k]
mov N,8
add N,2 ; N+1
																	;mov bx,N
																	;mov date,bx
																	;call vivod
mov bx,N
sub bx,k
																	;mov temp2,bx
																	;mov date,bx
																	;call vivod
																	;mov bx,temp2
mov si,bx
mov bx, word ptr [B+si] ; B[N+1-k]
																	;mov temp2,bx
																	;mov date,bx
																	;call vivod
																	;mov bx,temp2
mov temp2, bx
; ��⠥� ���� ����� A[2k-1]
mov ax,2
imul k
																	;mov temp3,ax
																	;mov date,ax
																	;call vivod
																	;mov ax,temp3

sub ax,2
mov si,ax
																	;mov temp3,dx
																	;mov date,si
																	;call vivod
																	;mov dx,temp3
mov ax, word ptr [A+si] ; A[2k-1]
																	;mov temp3,ax
																	;mov date,ax
																	;call vivod
																	;mov ax,temp3
; ��⠥� ���� ����� A[2k-1]/ B[N+1-k]																	
cwd
idiv temp2
																	;mov temp3,ax
																	;mov date,ax
																	;call vivod
																	;mov ax,temp3
mov temp2,ax
; ��⠥� ���� ����� k*A[k] / k+B[k+1] + A[2k-1]/ B[N+1-k]
mov bx,temp1
add bx,temp2
																	;mov temp3,bx
																	;mov date,bx
																	;call vivod
																	;mov bx,temp3
add rez,bx




pop cx
sub cx,1
cmp cx,0
je @FIN
jmp @MY
@FIN: mov bx,rez
mov date,bx
call vivod




mov ah,08
int 21h
ret
main endp
; *************** ���� ������ ����� ���ᨢ� X ***************
vvod proc near
mov datev,0
; ���� �᫠ � ���� ᨬ�����
mov ah,0ah
lea dx,buf
int 21h
; ����砥� ������⢮ ��������� ᨬ�����
mov mnoj,1
mov cl,byte ptr buf+1 ; ᪮�쪮 ᨬ�����(���)
mov ch,0
mov bp,cx
add bp,1 ; ���� ��᫥���� ����
@m1000:
; ��६ ���� ����
mov al,byte ptr buf+bp
sub al,30h
cbw
imul mnoj ; ax=���*10^
add datev,ax

; 㬭����� �����⥫� �� 10
mov ax,10
imul mnoj
mov mnoj,ax
sub bp,1
loop @m1000
mov ah,09
lea dx,ps
int 21h
ret
vvod endp
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
;------- ����砥� ����� ------------------------------
mov ax,dx
cwd
mov bx,1000
idiv bx
mov Th,al
;------ ����砥� �⭨ ---------------
mov ax,dx
mov bl,100
idiv bl
mov Hu,al
;---- ����砥� ����⪨ � ������� ----------------------
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
nata ends
end begin