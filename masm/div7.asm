assume cs:code, ds:data

data segment
	org 0000h
	count equ 07h
	arr db 1, 2, 3, 7, 14, 8, 0	

	org 0010h
	newarr db 10 dup(?)
data ends

code segment
start:
	mov ax, data
	mov ds, ax

	mov si, offset arr
	mov di, offset newarr
	mov cx, count
	mov bx, 00h

l1: 	
	mov al, [si]
	mov ah, 00
	mov bl, 07h
	div bl
	cmp ah, 00h
	jnz l2
	inc bx
	mov al, [si]
	mov [di], al
	inc di

l2: 
	inc si
	loop l1


	mov cx, bx
	mov dx, cx
	dec dl

outer: 
	mov di, offset newarr
	mov cx, dx

inner:
	mov al, [di]
	cmp al, [di+1]
	jnc l3
	xchg [di+1], al
	xchg [di], al

l3:
	inc di
	loop inner
	dec dx
	jnz outer
	
	
	mov ah, 4ch
	int 21h
code ends
end start