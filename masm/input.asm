assume cs:code, ds:data

data segment
	org 0000h
	count equ 05h
	arr db 5 dup(?)
data ends

code segment
start:
	mov ax, data
	mov ds, ax

	mov cl, count
	mov si, offset arr

scan: 
	mov ah, 01h
	int 21h
	
	mov [si], al
	
	inc si
	loop scan


	mov cl, count
	mov si, offset arr

print:
	mov ah, 02h
	mov dl, [si]
	int 21h

	inc si
	loop print

	mov ah, 4ch
	int 21h
code ends
end start