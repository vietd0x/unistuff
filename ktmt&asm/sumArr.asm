print macro str
    mov ah, 9
    lea dx, str
    int 21h
endm
read macro buf
    mov ah, 0ah
    lea dx, buf
    int 21h
endm    
data segment
    newline db 10, 13, '$'
    arr db 1, 2, 3, 4, 5, 6, 7, '$'
    sum dw 0
ends

stack segment
    dw 128 dup(0)
ends             

code segment
    start:
    mov ax, data
    mov ds, ax
    mov es, ax
    
    
    lea si, arr
    call length
    
    lea si, arr
    xor dx, dx
    
    calcLoop:
    mov dl, [si]
    add sum, dx
    inc si
    loop calcLoop 
    
    mov ah, 4ch
    int 21h
    
ends

length proc
; si buf
; cx len
    push dx
    xor dx, dx
    xor cx, cx
    
    count:
    mov dl, [si]
    cmp dl, '$'
    je thoat
    inc cx
    inc si
    jmp count
    
    thoat:
    pop dx
    ret       
endp
end start