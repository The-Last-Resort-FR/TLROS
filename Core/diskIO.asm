PROGRAM_SPACE equ 0x7e00

ReadDisk:
    mov ah, 0x02
    mov bx, PROGRAM_SPACE
    mov al, 16               ; Number of sector to read (512 bytes each)
    mov dl, [BOOT_DISK]
    mov ch, 0x00            ; Cylinder 0
    mov dh, 0x00            ; Head 0
    mov cl, 0x02            ; From sector 2
    int 0x13

    jc DiskReadError
    
    ret

DiskReadFailedStr:
 db 'Disk read failed', 0

DiskReadError:
    mov bx, DiskReadFailedStr
    call PrintString

BOOT_DISK:
    db 0