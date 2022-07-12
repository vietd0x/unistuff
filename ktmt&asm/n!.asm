print macro str
    push ax
    push dx
    
    lea dx, str
    mov ah, 9
    int 21h
    
    pop dx
    pop ax
endm
read macro buf
    push ax
    push dx
    
    lea dx, buf
    mov ah, 0ah
    int 21h
    
    push ax
    push dx
endm

data segment
    newline db 10, 13, '$'
    tb1     db 'Nhap so N: $'
    n       db 10, ?, 10 dup ('$')
    muoi    dw 10
    count   dw 0
ends

stack segment
    dw 128 dup(0)
ends

code segment
    start:
    mov ax, data
    mov ds, ax
    mov es, ax
    
    print tb1
    print newline
    
    read n
    
    ; cx = len n
    lea di, n
    add di, 1
    xor cx, cx
    mov cl, [di]
        
    lea di, n
    add di, 2 
    call atoi
    
    mov cx, ax
    call giaithua
    
    print newline
    call decout
    
    mov ah, 4ch
    int 21h 
ends

atoi proc
; dx - str
; ax - atoi(str)
    push dx
    xor dx, dx
    mov ax, 0
    
    multiloop:
    mul muoi
    mov dl, [di]
    sub dl, 30h
    add ax, dx
    inc di
    loop multiloop
    
    done:
    pop dx
    ret    
endp

giaithua proc
; cx - 1
; result = ax
   
    mov ax, 1
    multiNTime:
    mul cx
    loop multiNTime
    
    ret 
endp

decout proc
; ax = n
    chia:
    xor dx, dx
    div muoi
    
    add dx, 30h
    push dx
    inc count
    cmp ax, 0
    jne chia
    
    mov cx, count
    
    inra:
    pop dx
    mov ah, 2
    int 21h
    loop inra 
    ret
endp
end start