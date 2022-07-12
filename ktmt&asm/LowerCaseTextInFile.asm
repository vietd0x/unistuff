; multi-segment executable file template.

data segment
    msg1 db 'nhap ten file: $'
    tenfile db 100 dup (?)
    file dw ?
    buf db 10,13, 100 dup (?)
    len dw 0
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

    lea dx, msg1
    call printf
    
    lea si, tenfile
    call readline
    
    ; open file
    mov ah, 3dh
    mov al, 2 ; read/write mode
    lea dx, tenfile
    int 21h
    mov file, ax
            
    ; read file to buf
    mov ah, 3fh
    mov bx, file
    mov dx, offset buf
    add dx, 2
    int 21h
    ; number bytes read
    mov cx, ax
    add cx, 2
    
    ;----------- buf processing
    push di
    mov di, dx
    toLowCase:
    ;mov bl, [dx]
    cmp [di], 0
    jz done
    cmp [di], 'Z'
    ja nextChar
    cmp [di], 'A'
    jb nextChar
    
    ; upcase char
    ;mov bl, [dx]
    add [di], 20h
    
    nextChar:
    inc di
    jmp toLowCase
    
    pop di    
    done:
    
    
    ; write buf to file
    mov ah, 40h
    mov bx, file
    lea dx, buf
    int 21h
    
    ; close the file
    mov bx, file
    mov ah, 3eh
    int 21h
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends
readline PROC
    mov ah, 1
    
    nhap:
    int 21h
    cmp al, 13
    jz  exit
    mov [si], al
    inc si
    jmp nhap
    exit:
    ret
readline ENDP

printf PROC
    mov ah, 9
    int 21h
    ret
printf endp

calcLen PROC
; input si - str
; output cx - len
    mov cx, si
    lup:
    cmp [si], 0
    je done_
    inc si
    jmp lup
    
    done_:
    sub si, cx
    mov cx, si
    ret
calcLen endp
end start ; set entry point and stop the assembler.
