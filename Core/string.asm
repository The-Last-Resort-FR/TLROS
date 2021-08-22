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
    mov al, 0x0a
    int 0x10
    mov al, 0x0d
    int 0x10
    ret

cls:
    mov ah, 0x00
    mov al, 0x03  ; text mode 80x25 16 colours
    int 0x10
    ret
