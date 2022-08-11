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
