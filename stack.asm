; playing with the stack....
; So sometimes it's inconvinient to access memory
; using indexes (memory addressing/direct access),
; sometimes you dont care where you store the data,
; you might just want to store the data and retrive it
; later on, and thats when the stack comes in.

[org 0x7c00]


mov ah, 0x0e

mov al, [my_character] 
int 0x10

mov [0x9000], byte  'e'
mov al, [0x9000]
int 0x10

my_character:
    db 'H'

jmp $

times 510 - ($ - $$) db 0
dw 0xaa55