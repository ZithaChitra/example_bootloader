; firstly, don't be too hard on yourself while learnig this stuff.
; what you'll find in asm is that what 
; things look like when you write asm code is 
; not always how the computer works underneath - Nick Blundell 

[org 0x7c00]

; Setup the stack away from our code.
mov bp, 0xffff
mov sp, bp

mov si, MSG_REAL_MODE
call print_string

; Switch into 32 bit protected mode.

jmp $ ; endless jump

%include "my_functions.asm"
%include "switch_to_pm.asm"
%include "my_pm_functions.asm"

[bits 32]

BEGIN_PM:

    ; 0xb8000 - video memory buffer
    mov esi, MSG_PROT_MODE
    call print_string_pm
    jmp $


[bits 16]
; Messages to display
MSG_REAL_MODE: db "Started in 16 bit real mode. ", 0
MSG_PROT_MODE: db "Successfully switched into 32-bit Protected mode. ", 0



times 510 - ($ - $$) db 0
dw 0xaa55
  