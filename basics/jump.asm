section .text
    global _start:

_start:
    mov rsi, 99
    mov rax, 60 ;; sys_exit
    mov rdi, 11 ;; exit code: 11
    ; jmp skip    ;; jump to skip
    cmp rsi, 99 ;; compare rsi to 99

    ;; Jump Operation: jump, je, jne, jg, jge, jl, jle
    je skip    ;; jump to skip if previous comparision is equal
    mov rdi, 12 ;; doesn't get executed
    syscall     ;; doesn't get executed
skip:
    mov rdi, 69
    syscall

    
