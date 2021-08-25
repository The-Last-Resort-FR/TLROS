[org 0x7e00]

jmp EnterProtectedMode

%include 'Extended\gdt.asm'

EnterProtectedMode:
    call EnableA20
    cli
    lgdt [gdt_descriptor]
    mov eax, cr0
    or eax, 1
    mov cr0, eax
    jmp codeseg:StartProtectedMode

EnableA20:
    in al, 0x92
    or al, 2
    out 0x92, al
    ret


[bits 32]

%include 'Extended\CPUID.asm'
%include 'Extended\paging.asm'

StartProtectedMode:
    mov ax, dataseg
    mov ds, ax
    mov ss, ax
    mov es, ax
    mov fs, ax
    mov gs, ax

    mov ebp, 0x90000
    mov esp, ebp


    call DetectCPUID
    call DetectLongMode
    call SetupIdentityPaging
    call EditGdt

    jmp codeseg:Start64bits

[bits 64]
Start64bits:
    mov edi, 0xb8000
    mov rax, 0x1f201f201f201f20
    mov ecx, 500
    rep stosq
    jmp $

times 2048-($-$$) db 0