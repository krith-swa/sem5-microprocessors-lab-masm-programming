assume cs:code, ds:data

data segment
	count equ 5
	arr db 5, 2, 3, 4, 1
data ends

code segment
start:
	mov ax, data
	mov ds, ax

	mov dl, count
	dec dl

l1: 
	mov si, offset arr
	mov cl, dl

l2: 
	mov al, [si]
	cmp al, [si+1]
	jnc l3
	xchg [si+1], al
	xchg [si], al

l3: 
	inc si
	loop l2
	dec dl
	jnz l1	

	mov ah, 4ch
	int 21h
code ends
end start