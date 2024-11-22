assume cs:code, ds:data

data segment
	org 0000h
	day db ?
	month db ?
	year db 2 dup(?)
	week db ?
data ends

code segment
start: mov ax, data
	mov ds, ax
	
	mov ah, 2ah
	int 21h

	mov si, offset day
	mov [si], dl

	mov si, offset month
	mov [si], dh

	mov si, offset year
	mov [si], cx

	mov si, offset week
	mov [si], al

	mov ah, 4ch
	int 21h
code ends
end start	