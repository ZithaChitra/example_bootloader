; what you'll find in asm is that what 
; things look like when you write asm code is 
; not always how the computer works underneath - Nick Blundell 

[org 0x7c00]

mov [0x40], word 0x0


mov ah, 0x0e ; BIOS scrolling teletype function 

mov al, [my_character]
int 0x10

my_character:
    db "H"

jmp $ ; endless jump

times 510 - ($ - $$) db 0
dw 0xaa55
  