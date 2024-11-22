;get array elements - calc the sum of elements and display it
Assume cs:code,ds:data

data segment
    org 0000h
    count equ 5h
    org 0010h
    arr db 5 dup(?)
    org 0020h
    result db 00h
data ends

code segment
start:
    mov ax,data
    mov ds,ax

    ;input
    mov si,offset arr
    mov di,offset result
    mov cx,count
l1:
    mov ah,1h
    int 21h
    sub al,30h          ;get actual number
    mov [si],al
    cmp al,[di]
    jc skip2
    mov [di],al
skip2:
    inc si
    loop l1

    mov ah,4ch
    int 21h
code ends
end start