nasm bootloader.asm -f bin -o bootloader.bin
nasm Extended\extendedCore.asm -f elf64 -o extendedCore.o

wsl /usr/local/x86_64elfgcc/bin/x86_64-elf-gcc -ffreestanding -mno-red-zone -m64 -c "Kernel.cpp" -o "Kernel.o"

wsl /usr/local/x86_64elfgcc/bin/x86_64-elf-ld -o kernel.tmp -Ttext 0x7e00 ExtendedCore.o Kernel.o

wsl objcopy -O binary kernel.tmp Kernel.bin

copy /b bootloader.bin+Kernel.bin bootloader.img
move bootloader.img Bin\bootloader.img
del bootloader.bin extendedCore.bin extendedCore.o Kernel.bin Kernel.o kernel.tmp