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
Q dw ?
T dw ?
N dw 6
K dw ?
vvodX db 10,13,'����� ����� ���ᨢ� X!',10,13,'$'
vivX db 10,13,'���ᨢ X:',10,13,'$'
vivY db 10,13,'���ᨢ Y:',10,13,'$'
X dw 11 DUP(?)
Y dw 6 DUP(?)
;---------------------------------
main proc near
; *************** ���������� ���ᨢ� X ***************
mov cx,11 ; 11 ����⮢ ���ᨢ� X
lea si,X ; ����㦠�� � si ���� ��ࢮ�� ����� ���ᨢ� X
@XVVOD:
push cx ; ��࠭塞 � �⥪� ���稪 横��
; �뢮��� ���᪠���
mov ah,09
lea dx,vvodX
int 21h
; ������ ���� ����� ���ᨢ�
call vvod
mov ax,datev ; datev - ��।��� �����
mov [si],ax ; ��࠭塞 ����� �� �����
add si,2 ; ���騢��� ���� �� 2
pop cx
loop @XVVOD
; *************** ����� ���������� ���ᨢ� X ***************
;*************** �뢮� ���ᨢ� X **********************
mov ah,09

lea dx,vivX
int 21h
mov cx,11
lea si,X ; ���� ��ࢮ�� �����
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
; ********** ������ ����⮢ ���ᨢ� Y
mov cx,6 ; ��⠥� 6 ����⮢ ���ᨢ� Y
mov k,1 ; ���� ���祭�� K
mov bp,0 ; ������ ����� � ���ᨢ� Y
@MY:
push cx
; ***** ��⠥� ��ࢮ� ᫠������ ************
; ��⠥� ���� ����� K
mov ax,k
sub ax,1 ; ax=k-1
mov bx,2
imul bx ; ax=(k-1)*2
mov si,ax ; si=ax=(k-1)*2
mov ax,word ptr [X+si] ; ��६ ����� X(K)
mov bx,4
imul bx ; ax=4*X(K)
mov T,ax ; T=4*X(K)
; ��⠥� ���� ����� 2N-K
mov ax,N
mov bx,2
imul bx ; ax=2*N
sub ax,k ; ax=2*N-K
sub ax,1 ; ax=(2*N-K)-1
mov bx,2
imul bx ; ax=((2*N-K)-1)*2
mov si,ax ; si=ax=((2*N-K)-1)*2
mov ax,word ptr [X+si] ; ��६ ����� X(2N-K)
; ����� 4*X(K) �� X(2N-K)

mov bx,ax
mov ax,T
cwd ; ax->dx:ax
idiv bx ; ax=4*X(K) / X(2N-K)
mov T,ax ; T=4*X(K) / X(2N-K)

; **** ��⠥� ��஥ ᫠������
; �����뢠�� ���� ����� � ����஬ N+1-k
mov ax,N
add ax,1
sub ax,k ; ax=N+1-k
; �����뢠�� ᬥ饭�� �⭮�⥫쭮 ��砫� ���ᨢ� X
sub ax,1
mov bx,2
imul bx ; ax=ᬥ饭��
mov si,ax
mov ax,word ptr [X+si] ; ��६ ����� X(N+1-K)
imul ax ; ax=X(N+1-K)^2
imul k ; ax=X(N+1-K)^2 * k
imul k ; ax=X(N+1-K)^2 * k * k
mov Q,ax ; Q=X(N+1-K)^2 * k * k
; �����뢠�� ���� ����� X(K+1)
mov ax,k
add ax,1 ; ax=k+1
sub ax,1
mov bx,2
imul bx ; ax=ᬥ饭��
mov si,ax
mov ax,word ptr [X+si] ; ax = X(K+1)
; �����뢠�� k+1
mov bx,k
add bx,1 ; bx = K+1
; 㬭�����
imul bx ; ax=(K+1)*X(K+1)
; ����� X(N+1-K)^2 * k * k �� (K+1)*X(K+1)
mov bx,ax
mov ax,Q
cwd ; ax->dx:ax
idiv bx ; ax=X(N+1-K)^2 * k * k / (K+1)*X(K+1)
; ᪫��뢠�� ᫠�����
add ax,T
; ����ᨬ ����⠭��� � ����� ���ᨢ� Y
mov Y+bp,ax
; ���騢��� k �� 1
add k,1
; ���室�� � ᫥�.������ ���ᨢ� Y

add bp,2
pop cx
sub cx,1
cmp cx,0
je @FIN
jmp @MY
; *************** �뢮� ���ᨢ� Y ***************
@FIN: mov ah,09
lea dx,vivY
int 21h
mov cx,6
lea si,Y ; ���� ��ࢮ�� �����
@YVIVOD:
push cx
mov ax,[si] ; ��६ ��।��� �����
mov date,ax
; �뢮��� ����� �� �࠭
call vivod
add si,2 ; ���騢��� ���� �� 2
pop cx
loop @YVIVOD
; ��ॢ�� ��ப�
mov ah,09
lea dx,ps
int 21h
; *************** ����� �뢮�� ���ᨢ� Y ***************
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