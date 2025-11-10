#!/bin/bash
#
# assemble (nasm), link (ld) and run file given in argument
# usage: pasmg <base_filename>
nasm -f elf32 -g "$1.asm" && ld -m elf_i386 -s -o "$1" "$1.o" && "./$1"
