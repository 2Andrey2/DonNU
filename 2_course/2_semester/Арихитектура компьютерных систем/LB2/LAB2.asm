MINIMUM macro mas,num
	xor cx, cx ;������ ������� cx
j2:
	mov cl, num  ; ������� num � cl
	dec   cl ; �������� 1 �� cl
c0:    
	mov bx, cx ; ������� cx � bx
	mov al, mas[bx] ; ������� mas[bx] (������� ������� �������) � al
	cmp al, mas[bx-1] ; ���������� ������� ������� ������� � ����������
	jg j1 ; ���� al (� ������ mas[bx]) ������, �� ��������� �� ����� j1
	loop c0 ; ���� ��� ��: if(cx>0) (cx=cx-1, goto c0);
	jmp j0 ; ����������� �������� ; ����� j1 ������ ������� � ���������� ������� �������
j1:    
	mov ah, mas[bx-1]; 
	mov mas[bx], ah
	mov mas[bx-01h], al
	jmp j2
	jmp c0
j0:    
endm

Chinik segment para 'code'
assume cs:Chinik,ds:Chinik,ss:Chinik,es:Chinik
org 100h ; ���������� ������ 256 ���� (.com)
begin: jmp main
;-------������ -------------------
SPISOK 	db 10,15,45,67,89,44,7,34,37,12
 	db 17,19,23,27,46,83,18,11,3,16
 	db 4,55,2,98,93,91,81,61,62,57
 	db 42,33,1,27,22
sk db 30
pr db 10,13,'�������� ��������� �����������?', 10,13,'$'
buf db 4,4 dup(?)
ps db 10,13,'$'
des db ?
ed db ?
otv db 10,13,'��������������� = $'
min db ?
;---------------------------------
main proc near
;-------������� ��������� --------
 call pechat
;************* ���������� ********************************
 MINIMUM SPISOK, sk
;****************************************************
 call otvet
 ret
main endp
;************* ������� �������� ������ �� ����� ****************************
pechat proc near
 mov cl,sk
 mov bp,0
@w3:
 mov al,SPISOK+bp ; ���� ������� ������
 cbw ; al --> ax
 mov bl,10
 idiv bl
 mov des,al
 mov ed,ah
 ; ������� �������
 mov ah,02
 mov dl,des
 add dl,30h
 int 21h
 ; ������� �������
 mov ah,02
 mov dl,ed
 add dl,30h
 int 21h
 ; ������� ������
 mov ah,02
 mov dl,' '
 int 21h
 add bp,1 ; ������� � ���������� ��������
 loop @w3
 mov ah,09
 lea dx,ps
 int 21h
 ret
pechat endp
;***********************************************************
otvet proc near
 mov ah,09
 lea dx,otv
 int 21h
 ; ����� ����� �� ����� �����
 mov al,min
 cbw ; al --> ax
 mov bl,10
 idiv bl
 mov des,al
 mov ed,ah
 ; ������� �������
 mov ah,02
 mov dl,des
 add dl,30h
 int 21h
 ; ������� �������
 mov ah,02
 mov dl,ed
 add dl,30h
 int 21h
 ; ������� ������
 mov ah,09
 lea dx,ps
 int 21h
 ; �������� ������� �� �������
 mov ah,08
 int 21h

 ret
otvet endp
Chinik ends
 end begin 