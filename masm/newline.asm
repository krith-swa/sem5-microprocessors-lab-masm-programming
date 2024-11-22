assume cs:code, ds:data

data segment
	count equ 05h
	org 0000h
	arr db 5 dup(?)
	message db "Enter array elements: $"
data ends

code segment
start:
	mov ax, data
	mov ds, ax

	;print prompt message
	mov ah, 09h
	mov dx, offset message
	int 21h

	;get array elements as input
	mov si, offset arr
	mov cx, count
scan: 
	mov ah, 01h
	int 21h
	mov [si], al
	inc si
	loop scan

	;print newline
	mov ah, 02h
	mov dl, 0ah
	int 21h
	
	;print array elements
	mov cx, count
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