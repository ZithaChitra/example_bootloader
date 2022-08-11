; firstly, don't be too hard on yourself while learnig this stuff.
; what you'll find in asm is that what 
; things look like when you write asm code is 
; not always how the computer works underneath - Nick Blundell 

[org 0x7c00]

; Setup the stack away from our code.
mov bp, 0x8000
mov sp, bp


mov si, HELLO_MSG
call print_string

mov si, GOODBYE_MSG
call print_string


jmp $ ; endless jump

%include "my_functions.asm"

;
; Data
;

HELLO_MSG:
    db 'Hello ', 0

GOODBYE_MSG:
    db 'Goodbye', 0

times 510 - ($ - $$) db 0
dw 0xaa55
  