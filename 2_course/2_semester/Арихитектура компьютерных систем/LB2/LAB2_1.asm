MINIMUM macro p
;///////////////////////////////
	xor cx, cx ;��⨬ ॣ���� cx
j2:
	mov cl, p  ; ����ᨬ num � cl
	dec cl ; �⭨���� 1 �� cl
c0:    
	mov bx, cx ; ����ᨬ cx � bx
	mov al, massAndrey[bx] ; ����ᨬ mas[bx] (⥪�騩 ����� ���ᨢ�) � al
	cmp al, massAndrey[bx-1] ; �ࠢ������ ⥪�騩 ����� ���ᨢ� � �।��騬
	jg j1 ; �᫨ al (� ����� mas[bx]) �����, � ���娤�� �� ���� j1
	loop c0 ; �᫨ ��� �: if(cx>0) (cx=cx-1, goto c0);
	jmp j0 ; �����稢��� ������ ; ��⪠ j1 ����� ⥪�騩 � �।��騩 ����� ���ᨢ�
j1:
	mov ah, massAndrey[bx-1]; 
	mov massAndrey[bx], ah
	mov massAndrey[bx-01h], al
	jmp j2
	jmp c0
j0:   
endm
print macro text
	mov ah,09
	lea dx,text
	int 21h
endm
input macro
	mov ah,08
	int 21h
endm
;////////////////////////////////
Chinik segment para 'code'
	assume cs:Chinik,ds:Chinik,ss:Chinik,es:Chinik
	org 100h ; �ய�᪠�� ���� 256 ���� (.com)
begin: jmp main
;-------����� -------------------
massAndrey db 10,15,45,67,89,44,7,34,37,12
	 db 17,19,23,27,46,83,18,11,3,16
	 db 4,55,2,98,93,91,81,61,62,57
	 db 42,33,1,27,22
sk 	db ?
pr 	db 10,13,'�।� ᪮�쪨� ����⮢ �᪠�� ������ ?', 10,13,'$'
pr1 db 10,13,'�����஢���� ���ᨢ:', 10,13,'$'
buf db 4,4 dup(?)
ps 	db 10,13,'$'
des db ?
ed 	db ?
min db ?
;---------------------------------
main proc near
;-------������� �ணࠬ�� --------
	 call skolko
	 call pechat
;************* ���஢맮� ********************************
	MINIMUM sk
	PRINT pr1
	call pechat
;****************************************************
	; �������� ������ �� �������
	input
	ret
main endp
; ************** ��⠥� � �࠭�, ᪮�쪮 ����⮢ ����� �� ᯨ᪠ **********
skolko proc near
	 ; ���᪠���
	 PRINT pr
	 ; ���뢠�� � �࠭� �᫮ ��� ��ப�
	 mov ah,0ah
	 lea dx,buf
	 int 21h
	 ; �८�ࠧ㥬 ��ப� � �᫮
	 cmp buf+1,1 ; ᪮�쪮 ᨬ����� ����� ?
	 jne @w1
	 ;���� ᨬ��� �����
	 mov al,buf+2
	 sub al,30h
	 jmp @w2
	@w1: ; ��� ����
	 mov al,buf+2
	 sub al,30h
	 mov bl,10
	 imul bl
	 mov bl,buf+3
	 sub bl,30h
	 add al,bl
	@w2: mov sk,al
	 ; ��ॢ�� ��ப�
	 print ps
	 ret
skolko endp
;************* �뢮��� ������ ᯨ᪠ �� �࠭ ****************************
pechat proc near
	 mov cl,sk
	 mov bp,0
	@w3:
	 mov al,massAndrey+bp ; ���� ����� ᯨ᪠
	 cbw ; al --> ax
	 mov bl,10
	 idiv bl
	 mov des,al
	 mov ed,ah
	 ; �뢮��� ����⪨
	 mov ah,02
	 mov dl,des
	 add dl,30h
	 int 21h
	 ; �뢮��� �������
	 mov ah,02
	 mov dl,ed
	 add dl,30h
	 int 21h
	 ; �뢮��� �஡��
	 mov ah,02
	 mov dl,' '
	 int 21h
	 add bp,1 ; ���室 � ᫥���饬� ������
	 loop @w3
	 mov ah,09
	 lea dx,ps
	 int 21h
	 ret
pechat endp
;***********************************************************
Chinik ends
 end begin 