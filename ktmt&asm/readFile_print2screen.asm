.model small
.stack 100h
.data 
    msg1 db "Nhap ten file: $"
    msg2 db 10,13,"noi dung file la: $" 
    noidung db 100 dup("$")
    ten db 30 dup(?),0
    pf dw ?
.code 
main proc
    mov ax,@data
    mov ds,ax 
    mov es,ax 
    mov ah,9
    lea dx,msg1
    int 21h 
    mov si,0
nhap_filename:
    mov ah,1
    int 21h
    cmp al,0Dh
    je read
    mov ten[si],al
    inc si
    jmp nhap_filename
read: 
    mov ah,9
    lea dx,msg2
    int 21h 
;open file 
    mov ah,3Dh
    mov al,2
    lea dx, ten
    int 21h
    mov pf,ax 
;read file
    mov ah,3Fh
    mov bx,pf
    mov cx,250
    lea dx,noidung    
    int 21h
;close file
    mov ah,3Eh
    mov bx,pf
    int 21h 
    mov ah,9
    lea dx,noidung
    int 21h   
;thoat 
    mov ah,4ch
    int 21h    
    main endp
end main 