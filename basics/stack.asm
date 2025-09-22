global _start
section .data

section .text
_start:
    ;; Stack offset: 4 bytes ex:- 4, 8, 12, 16
    ;; Stack pointer: starts at a higher addr in memory
    ;; and moves down with pushes and back up with pops 
    sub rsp, 4 ;; start of our stack
    mov [rsp], byte 'H'
    mov [rsp+1], byte 'e'
    mov [rsp+2], byte 'y'
    mov [rsp+3], byte '!'
    mov [rsp+4], byte 0x0A

    mov rax, 1   ;; sys_write
    mov rdi, 1   ;; std_out 
    mov rsi, rsp ;; reference to stack pointer
    mov rdx, 5   ;; number of bytes to write: 'Hey!', 0x0A
    syscall 

    mov rax, 60 ;; sys_exit
    mov rdx, 0  ;; exit status
    syscall
