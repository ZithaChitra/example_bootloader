mov ah, 0x0e ; BIOS scrolling teletype function 

mov al, 'H'
int 0x10

db 'X'

jmp $ ; endless jump

times 510 - ($ - $$) db 0
dw 0xaa55