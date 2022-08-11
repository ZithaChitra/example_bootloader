; playing with the stack....
; So sometimes it's inconvinient to access memory
; using indexes (memory addressing/direct access),
; sometimes you dont care where you store the data,
; you might just want to store the data and retrive it
; later on, and thats when the stack comes in.

; Something important with the stack is that it deals
; with 16 bit chunks (word/2bytes)
; So even if you push a character it will allocate 2 bytes

[org 0x7c00]


mov ah, 0x0e ; BIOS scrolling teletype function

mov al, [my_character] 
int 0x10

push 'e'
pop bx

mov al, bl
int 0x10

mov bp, 0x8000
mov sp, bp


my_character:
    db 'H'

jmp $

times 510 - ($ - $$) db 0
dw 0xaa55
