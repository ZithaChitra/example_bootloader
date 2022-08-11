; firstly, don't be too hard on yourself while learnig this stuff.
; what you'll find in asm is that what 
; things look like when you write asm code is 
; not always how the computer works underneath - Nick Blundell 

[org 0x7c00]

mov ah, 0x0e ; BIOS scrolling teletype function 
mov al, 'A'

loop:
    int 0x10
    add al, 1
    cmp al, 'Z'
    jle loop

jmp $ ; endless jump

times 510 - ($ - $$) db 0
dw 0xaa55
  