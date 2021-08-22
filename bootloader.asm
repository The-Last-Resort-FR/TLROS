[org 0x7c00]

mov bp, 0x7c00
mov sp, bp

call cls

mov bx, WelcomeString
call PrintString

jmp $



PrintString:
    mov ah, 0x0e
    .Loop:
        cmp [bx], byte 0
        je .Exit
        mov al, [bx]
        int 0x10
        inc bx
        jmp .Loop
    .Exit:
    ret

WelcomeString:
    db 'Welcome to TLROS', 0

cls:
    mov ah, 0x00
    mov al, 0x03  ; text mode 80x25 16 colours
    int 0x10
    ret

times 510-($-$$) db 0
dw 0xaa55