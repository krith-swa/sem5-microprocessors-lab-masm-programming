ASSUME CS:CODE,DS:data
data segment
	count equ 5h
	arr db 12h,23h,34h,45h,56h
data ends
code segment
start:
	mov ax,data
	mov ds,ax
	mov si,offset arr
	mov cl,4h
	mov dl,count
	
l1:	mov al,[si]
	shr al,cl
	mov bl,al
	mov al,[si]
	shl al,cl
	or al,bl
	mov [si],al
	inc si
	dec dl
	jnz l1	

	mov ah,4ch
	int 21h
code ends
end start