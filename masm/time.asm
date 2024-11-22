assume cs:code, ds:data

data segment
	org 0100h
	hour db ?
	min db ?
	sec db ?
data ends

code segment
start:
	mov ax, data
	mov ds, ax

	mov ah, 2ch
	int 21h

	mov si, offset hour
	mov [si], ch
	
	mov si, offset min
	mov [si], cl
	
	mov si, offset sec
	mov [si], dh

	mov ah, 4ch
	int 21h
code ends
end start