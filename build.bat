nasm bootloader.asm -f bin -o bootloader.bin
nasm Extended\extendedCore.asm -f bin -o extendedCore.bin
copy /b bootloader.bin+extendedCore.bin bootloader.img
move bootloader.img Bin\bootloader.img
del bootloader.bin extendedCore.bin