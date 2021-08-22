[org 0x7c00]

mov [BOOT_DISK], dl

mov bp, 0x7c00
mov sp, bp

call cls

mov bx, WelcomeString
call PrintString

call ReadDisk
mov bx, PROGRAM_SPACE
call PrintString


jmp $

%include 'Core\string.asm'
%include 'Core\data.asm'
%include 'Core\diskIO.asm'

times 510-($-$$) db 0
dw 0xaa55