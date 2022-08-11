; firstly, don't be too hard on yourself while learnig this stuff.
; what you'll find in asm is that what 
; things look like when you write asm code is 
; not always how the computer works underneath - Nick Blundell 

[org 0x7c00]

; Setup the stack away from our code.
mov bp, 0x8000
mov sp, bp

mov dx, 0xe234
call print_hex

jmp $ ; endless jump

%include "my_functions.asm"

print_hex:
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
1    ret

HEX_TEMPLATE:
    db '0x???? ', 0

HEXABET:
    db '0123456789abcdef'

times 510 - ($ - $$) db 0
dw 0xaa55
  