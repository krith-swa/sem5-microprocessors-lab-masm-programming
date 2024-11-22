assume cs:code, ds:data

data segment
	org 00h
	x dd 15.82
	org 10h
	y dd 10.00
	org 20h
	sum dd ?
data ends

code segment
start:
	mov ax, data
	mov ds, ax
	
	finit
	fld x
	fld y
	fadd st(0), st(1)
	fst sum

	mov ah, 4ch
	int 21h
code ends
end start