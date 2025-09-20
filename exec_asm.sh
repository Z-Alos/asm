#!/bin/bash

# Args Validation
if [ "$#" -ne 1 ]; then
    echo "Usage: run <filename without .asm>"
    exit 1
fi 

# Assemble
nasm -f elf64 -o "$1.o" "$1.asm"

# Link
ld -o exe "$1.o"

# Run
./exe
