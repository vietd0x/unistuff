data segment
    filename db 100 dup (?)
    buf db 160 dup (?)
    bufLen dw 0
    file dw ?
    msg1 db 'nhap ten file1: $'
    msg2 db 'nhap ten file2: $'
    msg3 db 'nhap ten file moi: $'
    newline db 10, 13, '$'
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
    
    lea si, filename
    call readline
    
    ; open file1
    mov ah, 3dh
    mov al, 0 ; read mode
    lea dx, filename
    int 21h
    mov file, ax
    
    ; read file1 to buf
    mov ah, 3fh
    mov bx, file
    mov cx, 100
    lea dx, buf
    int 21h
            
    mov buflen, ax
    
    ;close file1
    mov bx, file
    mov ah, 3eh
    int 21h
    
    lea dx, newline
    call printf
    
    ;-----------file2--------
    lea dx, msg2
    call printf
    
    lea si, filename
    call readline
    
    ; open file2
    mov ah, 3dh
    mov al, 0 ; read mode
    lea dx, filename
    int 21h
    mov file, ax
    
    ; read file2 to buf
    mov ah, 3fh
    mov bx, file
    mov cx, 100
    lea dx, buf
    add dx, buflen
    int 21h
    
    ; close file2
    mov bx, file
    mov ah, 3eh
    int 21h
    
    lea dx, newline
    call printf
    ;----------new file-------
    lea dx, msg3
    call printf
    
    lea si, filename
    call readline
    
    ; create new file
    mov ah, 3ch
    mov cx, 0
    lea dx, filename
    int 21h   
    mov file, ax
    
    
    
    lea si, buf
    call calcLen
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
