assume cs:code, ds:data

data segment
	org 0000h
	count equ 05h
	arr db 20 dup(?)
	
	org 0010h
	sum db 00h
data ends

code segment
start:
	mov ax, data
	mov ds, ax

	mov cl, count
	mov si, offset arr
	mov di, offset sum

scan:
	mov ah, 01h
	int 21h
	sub al, 30h 
	mov [si], al
	add al, [di]
	daa
	;aaa
	mov [di], al

	inc si
	loop scan
	

	mov ah, 4ch
	int 21h

code ends
end start