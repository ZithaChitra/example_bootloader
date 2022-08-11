; firstly, don't be too hard on yourself while learnig this stuff.
; what you'll find in asm is that what 
; things look like when you write asm code is 
; not always how the computer works underneath - Nick Blundell 

[org 0x7c00]

; Setup the stack away from our code.
mov bp, 0x8000
mov sp, bp

mov dx, 0x3333
call print_hex


jmp $ ; endless jump

%include "my_functions.asm"

print_hex:
    mov si, HEX_TEMPLATE
    call print_string
    ret

;
; Data
;

HEX_TEMPLATE:
    db '0x0000', 0


HELLO_MSG:
    db 'Hello ', 0

GOODBYE_MSG:
    db 'Goodbye', 0

times 510 - ($ - $$) db 0
dw 0xaa55
  