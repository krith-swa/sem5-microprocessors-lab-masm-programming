assume cs:code, ds:data

data segment
	org 00h
	message db "This is the given string! Look here.$"
data ends

code segment
start:
	mov ax, data
	mov ds, ax
	
	mov ah, 09h
	mov dx, offset message
	int 21h
	
	mov ah, 4ch
	int 21h
code ends
end start