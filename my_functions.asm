;
; Functions
;

print_string:
    _loop:
        ;mov al, [si]
        lodsb ; mov al, [si] + inc si
        cmp al, 0
        je _end

        mov ah, 0x0e
        int 0x10
        ;inc si
        jmp _loop

    _end:

    ret

print_char:
    mov ah, 0x0e ; BIOS scrolling teletype function 
    int 0x10
    ret

print_hex:
    push bx
    push si
    mov si, HEX_TEMPLATE

    mov bx, dx      ; bx -> 0xe234
    shr bx, 12      ; bx -> 0x00 0e
    mov bx, [bx + HEXABET]
    mov [HEX_TEMPLATE + 2], bl 

    mov bx, dx      ; bx -> 0xe234
    shr bx, 8       ; bx -> 0x00 e2
    and bx, 0x000f  ; bx -> 0x00 02
    mov bx, [bx + HEXABET]
    mov [HEX_TEMPLATE + 3], bl 

    mov bx, dx      ; bx -> 0xe234
    shr bx, 4       ; bx -> 0x0e 34
    and bx, 0x000f  ; bx -> 0x00 02
    mov bx, [bx + HEXABET]
    mov [HEX_TEMPLATE + 4], bl 

    mov bx, dx      ; bx -> 0xe234
    and bx, 0x000f  ; bx -> 0x00 02
    mov bx, [bx + HEXABET]
    mov [HEX_TEMPLATE + 5], bl 

    call print_string
    pop si
    pop bx
    ret


HEX_TEMPLATE:
    db '0x???? ', 0

HEXABET:
    db '0123456789abcdef'