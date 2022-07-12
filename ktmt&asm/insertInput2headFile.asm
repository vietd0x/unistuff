data segment
    filename db 100 dup (?)
    buf db 160 dup (?)
    bufLen dw 0
    msg1 db 'nhap chuoi: $'
    msg2 db 'nhap ten file: $'
    newline db 10, 13, '$'
ends

stack segment
    dw   128  dup(0)
    file dw ?
ends

code segment
start:
; set segment registers:
    mov ax, data
    mov ds, ax
    mov es, ax
    
    lea dx, msg1
    call printf
   
    lea si, buf
    call readline
    
    lea dx, newline
    call printf
    
    lea dx, msg2
    call printf
    
    lea si, filename
    call readline
            
    ; open file
    mov ah, 3dh
    mov al, 2 ; write mode
    lea dx, filename
    int 21h
    mov file, ax
    
    ; calc input length
    lea si, buf
    call calcLen
    mov buflen, cx
    
    ; read file to buf
    mov ah, 3fh
    mov bx, file
    mov dx, offset buf
    add dx, cx
    int 21h
    
    ;- al= number of bytes read from file
    ; calc total buf len
    mov ch, 0
    mov cl, al
    add cx, buflen 
    
    ; len already in cx
    ; write to file
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
    je done
    inc si
    jmp lup
    
    done:
    sub si, cx
    mov cx, si
    ret
calcLen endp
end start ; set entry point and stop the assembler.
