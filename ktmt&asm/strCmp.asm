print macro str
    mov ah, 9h
    lea dx, str
    int 21h
endm

data segment
    newline db 10, 13, '$'
    
    msv db 'AT160658'
    lenmsv dw $-msv
    buf db 100 dup (?)
    lenbuf dw 0
    msg0 db 'khac nhau$'
    msg1 db 'giong nhau$'
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

    lea si, buf
    call readline
    
    lea si, buf
    call calcLen
    
    mov lenbuf, cx
    cmp cx, lenmsv
    jne _not_equal
    
    lea si, msv
    lea di, buf
    cld
    repe cmpsb
    jnz _not_equal
    
    _equal:
    print msg1
    jmp _exit
    
    _not_equal:
    print msg0
    
    _exit:
    ; wait for any key....    
    mov ah, 1
    int 21h
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

readline PROC
; si buf
    mov ah, 1
    
    nhap:
    int 21h
    cmp al, 13
    jz  doneReadline
    mov [si], al
    inc si
    jmp nhap
    doneReadline:
    mov [si], '$'
    ret
readline ENDP

calcLen PROC
; input si - str
; output cx - len
    mov cx, si
    lup:
    cmp [si], '$'
    je done
    inc si
    jmp lup
    
    done:
    sub si, cx
    mov cx, si
    ret
calcLen endp

atoi proc
; di - str, cx - len
; ax - atoi(str)
    push dx
    push bx
    
    mov bx, 10
    xor dx, dx
    mov ax, 0
    
    multiloop:
    mul bx
    mov dl, [di]
    sub dl, 30h
    add ax, dx
    inc di
    loop multiloop
    
    pop bx
    pop dx
    ret    
endp

dec_out proc
; ax = n
    push bx
    push cx
    push dx

    mov bx, 10
    xor cx, cx

    chia:
    xor dx, dx
    div bx
    
    add dx, 30h
    push dx
    inc cx
    cmp ax, 0
    jne chia
    
    inra:
    pop dx
    mov ah, 2
    int 21h
    loop inra

    pop dx
    pop cx
    pop bx
    ret
endp

printBin proc
; ax - n
    push bx
    push dx
    push cx
    
    xor cx, cx
    mov bx, 2
    
    divL00p:
    xor dx, dx
    div bx
    
    add dx, 30h
    push dx
    inc cx
    cmp ax, 0
    je doneDec2bin:
    jmp divL00p
    
    doneDec2bin:
    pop dx
    mov ah, 2
    int 21h
    loop doneDec2bin
    
    pop cx
    pop dx
    pop bx
    ret
endp


end start ; set entry point and stop the assembler.
