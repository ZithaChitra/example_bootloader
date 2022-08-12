; firstly, don't be too hard on yourself while learnig this stuff.
; what you'll find in asm is that what 
; things look like when you write asm code is 
; not always how the computer works underneath - Nick Blundell 

[org 0x7c00]

; Setup the stack away from our code.
mov bp, 0xffff
mov sp, bp

mov si, MY_MESSAGE
call print_string

jmp $ ; endless jump

%include "my_functions.asm"

MY_MESSAGE:
    db "Am i loaded in memory ? ", 0

times 510 - ($ - $$) db 0
dw 0xaa55
  