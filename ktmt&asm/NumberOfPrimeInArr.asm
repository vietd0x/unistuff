; dem so luong so nguyen to trong mang

data segment
    newline db 10, 13, '$'
    arr dw 15, 3, 5, 7, 11, 13, 17, 19, 23, 29,31, 37, '$'
    count dw 0 
ends

stack segment
    dw   128  dup(0)
ends

code segment
start:
; set segment registers:
    mov ax, data
    mov ds, ax
    mov es, ax
    
    lea si, arr
    
    arrLoop:
    mov ax, [si]
    cmp ax, '$'
    je _done
    call nguyenTo
    cmp ax, 0
    je _next
    inc count
    
    _next:
    add si, 2
    jmp arrLoop
    
             
    _done:
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

nguyenTo proc
; ax number
; if prime ax = 1; else ax = 0
    push dx
    push cx
    push bx
    
    cmp ax, 2
    je _ret1
    
    ; init cx = num-1
    mov cx, ax
    mov bx, ax
    dec cx
    
    ; chia cho cx = n-1 -> 2
    _divLoop:
    xor dx, dx ; dx:ax = 0:num
    mov ax, bx
    div cx ; dx:ax / cx, thuong = ax, du = dx
    cmp dx, 0
    je _ret0 ; case chia het
    cmp cx, 2
    je _ret1
    loop _divLoop
    
    _ret1:
    mov ax, 1
    jmp _doneNguyenTo
    _ret0:
    mov ax, 0
     
    _doneNguyenTo:
    pop bx
    pop cx
    pop dx
    ret   
endp
end start ; set entry point and stop the assembler.
