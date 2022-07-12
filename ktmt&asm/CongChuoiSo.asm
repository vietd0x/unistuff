.model small

.stack 0x100

.data
     chuoi db 10, -12, 19, "$" 
     val_10 dw 10  
     sum dw 0
.code

    main proc
        mov ax, @data
        mov ds, ax
        
        lea bx, chuoi
        lea di, sum
    _startAdd:
        cmp [bx], "$"
        je _done
        mov ax, [bx]
        xor ah, ah
        jmp _check
    _continue:
        
    _soDuong:
        cmp ah, 0
        jne _bk
    _con1:
        add [di], al
       
        inc bx
        jmp _startAdd
    
    _done:
        mov ax, sum
        cmp ax, 128
        jg _overflow
        call _print_ax             
    _exit:
        mov ah, 0x4c
        int 0x21
            
    main endp  

_overflow:
    push ax
    mov ah, 0x2
    mov dl, "-"
    int 0x21
    pop ax
    
    mov bx, 256
    sub bx, ax
    mov ax, bx
    call _print_ax
    jmp _exit
      
_check: 
    push ax
    
    and ax, 0x80
    cmp ax, 0x80
    je _soAm
    
    pop ax
    jmp _continue      
      
_soAm:
    pop ax
    neg ax
    ;mov al, ah
    sub [di], al
    inc bx
    jmp _startAdd
          
_bk:
    mov al, ah
    jmp _con1      
_print_ax:
    pusha
        mov cx, 0
    _print_div:
        xor dx, dx
        div val_10
        inc cx        
        push dx
        cmp ax, 0
        jne _print_div
        
        mov ah, 0x2
    _print_print:
        pop dx
        add dx, 0x30
        int 0x21
        
        dec cx
        cmp cx, 0
        jne _print_print
    popa
    ret