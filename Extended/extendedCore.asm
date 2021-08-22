[org 0x7e00]

mov bx, DiskReadSuccess
call PrintString

%include 'Core\string.asm'

DiskReadSuccess:
    db 'Disk succesfully read', 0

times 2048-($-$$) db 0