nata segment 'code'
assume cs:nata
org 100h
begin: jmp main
;--------------------------------- DATA
Gorod DB 15,'��૮��� - ��������     ',11,'�������� - �����       ' ; 24 ᨬ����� �� �������
DB 99,'������ - ���楢�    ',71,'��૮��� - ��������     '
DB 55,'��१ - ����          ',13,'����� - ���⮢         '
DB 10,'����� - ��᪢�         ',55,'�ᨭ����� - ������楢� '
DB 14,'������ - ��������     ',39,'��१ - ������楢�      '
Rezult DB 24 Dup(?),'$'
Buf DB 3,3 Dup(?)
Distance DB ?
Mes DB '������ � ⠪�� ����஬ �� ������� !$'
Eter DB 10,13,'$'
Podskaz DB '����� ����� ������:$'
;---------------------------------
main proc near
;------------------------------------- PROGRAM
; ------ ���᪠��� -------
mov ah,09
lea dx,podskaz
int 21h
; ���� ��ப�
mov ah,0ah
lea dx,Buf
int 21h
; �८�ࠧ������ ᨬ����� � �᫮
; ����砥� ����⪨ �� ����
mov bl,buf+2
sub bl,30h
mov al,10
imul bl ; � al - ����⪨
; ����砥� ������� �� ����
mov bl,buf+3
sub bl,30h
; �����뢠�� ------
add al,bl
mov distance,al ; ��࠭塞 � distance
; -------- ���室 �� ����� ��ப� ---
mov ah,09h
lea dx,eter
int 21h
; --- ᪠��஢���� ⠡���� ��த�� ----
cld ; �᪠�� ᫥�� ���ࠢ�

mov cx,240 ; ᪮�쪮 ���� ᪠��஢���
lea di,gorod ; ��ப�, ��� �᪠��
mov al,distance ; �� �᪠��
repne scasb ; ����
je @m2
; ------- ����饭�� �� ������⢨� ��த�
mov ah,09h
lea dx,Mes
int 21h
jmp @m3 ; ��室�� �� �ணࠬ��
; -------- ��९��뢠�� � १����
@m2:
cld
mov si,di
lea di,rezult
mov cl,24
rep movsb
; ----- �뢮� १���� ----
mov ah,09h
lea dx,rezult
int 21h
;-------------------------------------
@m3: mov ah,08
int 21h
ret
main endp
nata ends
end begin