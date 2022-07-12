div A
	- 8 bit: [AX] // A = [AL], % A = [AH]
	- 16 bit: [DX:AX] // A = [AX], %A = [DX]
```asm
newline db 10, 13, '$'
; funct_name MACRO param
inchuoi MACRO chuoi
	mov ah, 9h
	lea dx, chuoi ; [ds:dx] will point to first char in chuoi
	int 21h
ENDM
```
____________________________
CALL bin_in
; save param into regs before CALL
```asm
bin_in PROC
	MOV BL, 0 ; Xóa BL
	MOV CX, 8 ; nhập đủ 8 bit thì dừng
	nhap:
		MOV AH, 1h ; Hàm nhập ký tự
		INT 21h
		
		CMP AL, 0Dh ; nếu là phím Enter thì thôi nhập
		JZ exit ; không phải Enter thì đổi sang bit
		SHL BL, 1 ; Dịch trái BL 1 bit
		SUB AL, 30h ; Ký số - 30h = số
		ADD BL, AL ; Chuyển bit từ AL sang BL lưu trữ
		LOOP nhap
	exit:
		RET
endp

atoi proc
; input: di number, cx lenNumber
; output: ax atoi(number)
	- a = 0
    - loop cx:
	  + mul muoi ; ax = ax * 10
	  + dl = char - 30h
	  + di++
endp

giaithua proc
; cx = n
; ax = n!
    mov ax, 1
    multiNTime:
    mul cx
    loop multiNTime
    ret
endp

decout proc
; ax = n
	chia:
	- cx = 0, dx = 0
	- ax / 10
	- dx += 30h
	- inc cx
	- cmp ax, 0; jne chia

	inra: // loop cx 
	- pop dx
endp

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
```
-----------AH table value---------------	
1-read a char w/ echo to [AL]
7-read a char w/0 echo to [AL]
8-read stdin w/o echo

2-print char stored in [DL], after execution [AL = DL]
9-print string on [DX] into screen
0xah-nhap str from stdin to chuoi
	buf db [bufSize], ?, [bufSize] dup (?), '$' 
FILE:
	`file_handle dw ?`
	3ch-creat or truncate file
		file attributes[CX] (0 normal-no attr, 1 read-only, 2 hidden, 3 system, 4 system, 7 hidden&system and read-only, 16 archive)
		[DS:DX] -> filename
		returns:
			[CF] clear if successful, [AX] = file handle
			[CF] set on error, [AX] = error code	
	3dh-open existing file
		[AL] access&sharing modes (0 read, 1 write, 2 read/write)
		[DS:DX]-> filename
		returns:
			[CF] clear if successful, [AX] = file handle
			[CF] set on error, [AX] = error code
	3eh-close file
		[BX] file handle
		[CF] clear if successful, [AX] destroyed
		[CF] set on error, [AX]= error code (06h)
	3fh-read from file
		[BX] file handle
		[CX]number of bytes to read
		[DS:DX] buffer of data
		return:
			[CF] is clear if successful
				[AX] number of bytes read
			[CF] is set on err [AX]= err code
	40h-write to file
		[BX] file handle
		[CX] number of bytes to write
		[DS:DX] -> data to write
			
4ch - exit
________________________________
#### cmp2str
```asm
cld             ; set DF = 0 direction flag
mov cx, len_cmp
lea si, s_str   ; 
lea di, d_str   ; 
repe cmpsb ; so sanh tung byte,reuturn SI - Di
```
compare bytes: ES:[DI] 

#### template
```asm
mov ah, 1
lea si, buf
nhap:
int 21h
cmp al, 0dh
jz thoat

mov [si], al
inc si
jmp nhap
```

## Note
only [SI, DI] maybe can get value