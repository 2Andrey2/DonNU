nata segment 'code'
assume cs:nata, ds:nata, ss:nata, es:nata
org 100h
begin: jmp main
;------------��� ����� ---------------------
Buf db 7,7 DUP(?)
datev dw 0
mnoj dw ?
ps dw 10,13,'$'
N dw 5 ; ������⢮ ��ப
M dw 4 ; ������⢮ �⮫�殢
bait_v_stoke dw ? ; ������⢮ ���� � ����� ��ப�
N_M dw ? ; ������⢮ ����⮢ � ���ᨢ�
;------------��� �뢮�� ---------------------
date dw ?
my_s db '+'
T_Th db ?
Th db ?
Hu db ?
Tens db ?
Ones db ?
;---------------------------------
X dw 12 DUP(?) ; ����ࢨ�㥬 ������ ��� ���ᨢ
svX db 10,13,'����� ����� ���ᨢ� X!',10,13,'$'
svXXX db 10,13,'���ᨢ X:',10,13,'$'
ssum db '�㬬� ���� ����⮢ c ��묨 ����ࠬ� ��ப = $'
Sum dw 0 ; �㬬� ����⮢
K db ? ; ����� �⮫��
K1 db ? ; ����� ��ப�
;---------------------------------
main proc near
; ******* 1 - ��⠥� ������⢮ ����⮢ � ���ᨢ� ? N_M *****
mov ax, N
mov bx, M
imul bx
mov N_M,ax ; ��諨 ������⢮ ����⮢ � ���ᨢ�
; ��⠥� ᪮�쪮 ���� ����� �������� ���� ��ப� ?bait_v_stoke
mov ax,M
mov bx,2
imul bx
mov bait_v_stoke,ax ; ������⢮ ���� � ����� ��ப�
; ******** 2 - ������塞 ���ᨢ X ****************
mov cx, N_M ; ������⢮ ����⮢ � ���ᨢ�
lea si,X ; ���� ��ࢮ�� �����
@z1:
push cx

; �뢮��� ��ப�-���᪠���
mov ah, 09
lea dx, svX
int 21h
; ����砥� ���� �����
call vvod
; �����뢠�� ��� � ���ᨢ
mov ax, datev
mov [si], ax
; ���室�� � ᫥���饬� ������, 㢥��稢�� ������ �� 2
add si, 2
pop cx
loop @z1
; ******* 3 - �뢮� ���ᨢ� X *****************
; �뢮��� ��ப� ������ X
mov ah,09
lea dx,svXXX
int 21h
; �뢮��� ���ᨢ X �����筮
mov cx,N ; ���譨� 横� - �� �������� ��ப
mov bx,0 ; ᪮�쪮 ���� �� ��砫� ��ப� �ய�����
; ------ ���譨� 横� �� ��ப�� ------------------------------------
@next_row:
push cx
mov cx, M ; M - ������⢮ ����⮢ ��ப�
mov si,0
; ---- ����७��� 横� �� ����⠬ ��ப� --------------
@next_elem:
mov ax, X[bx][si]
; �뢮� ������ ����� ��ப�
mov date,ax
push cx bx ; ��࠭塞 � �⥪� �㦭� ॣ�����
call vivod
pop bx cx
add si,2 ; ���室 � ᫥�. ������ ��ப�
loop @next_elem
; ---- ����� ����७���� 横�� �� ����⠬ ��ப� -----
add bx, bait_v_stoke ; ���室 � ᫥�. ��ப�
mov ah,09 ; ��ॢ�� ��ப�
lea dx,ps
int 21h
pop cx
loop @next_row
; ------ ����� ���譥�� 横�� �� ��ப�� --------------
; ******** ����� �뢮�� ���ᨢ� X *********************

;***** 4 - �맮� ��楤��� ������ �㬬� ***************
call raschet
; ***** 5 - �뢮� ���祭�� �㬬� ************************
mov ah,09
lea dx,ssum
int 21h
mov ax,sum
mov date,ax
call vivod
; �������� ������ �� �������
mov ah,08
int 21h
ret
main endp
; ****** 6 - �뢮� ������ �᫠ �� �࠭ *******************
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
; ***** 7 - ��楤�� ���� ������ ����� ���ᨢ� *******
vvod proc near
mov datev,0
; ���� �᫠ � ���� ��ப� ᨬ�����
mov ah,10
lea dx,buf
int 21h
mov mnoj,1
; ����砥� ������⢮ ��������� ᨬ�����
mov cl,byte ptr buf+1 ; ᪮�쪮 ᨬ�����(���)
mov ch,0
mov bp,cx
add bp,1 ; ���� ��᫥���� ����
@m1000:
; ��६ ���� ����
mov al,byte ptr buf+bp
sub al,30h
cbw
imul mnoj ; ax=���*10 � ᮮ⢥����饩 �⥯���
add datev,ax
; 㬭����� �����⥫� �� 10
mov ax,10
imul mnoj
mov mnoj,ax
sub bp,1
loop @m1000
; ��ॢ�� ��ப�
mov ah,09
lea dx,ps
int 21h
ret
vvod endp
;***** 8 - ��楤�� ������ �㬬� ***************************
raschet proc near
mov cx, N ; ���譨� 横� - �� �������� ��ப
mov bx, 0 ; ᪮�쪮 ���� �� ��砫� ��ப� �ய�����
mov k1, 1 ; k1 - ����� ��ப�

@next_row1:
push cx
mov cx, M ; M - ������⢮ ����⮢ ��ப�
mov si,0
mov k,1 ; k - ����� ����� � ��ப�
; ---- ����७��� 横� �� ����⠬ ��ப� --------------
@next_elem1:
mov ax,X[bx][si] ; ��६ ��।��� �����
; �㬬� ����⮢ c ��묨 ����ࠬ� �⮫�殢 � ������ ��ப��= 
test k1,00000001b ; �஢��塞 ��ப� �� �⭮���
jnz @dalhe
; ���⭠� ��ப�
test ax,000000001b ; �஢��塞 ����� �� �⭮���
jnz @dalhe
; ���⭠� ��ப� � ��� �⮫��� - ���騢��� �㬬�
add sum,ax
; ���室 � ᫥���饬� ������ ��ப�
@dalhe: add si,2 ; ���� ᫥�. �����
add k,1 ; ���騢��� ����� ����� � ��ப�
loop @next_elem1
add k1,1 ; ���騢��� ����� ��ப�
; ---- ����� ����७���� 横�� �� ����⠬ ��ப� -----
add bx,bait_v_stoke ; ���室 � ᫥�. ��ப�
pop cx
loop @next_row1
ret
raschet endp
;***************************************************************
nata ends
end begin