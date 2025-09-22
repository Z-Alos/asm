global _start
section .data
    addr db "yellow", 0x0A ;; string addr="yellow"
    addr_size equ $ - addr 

section .text
_start:
    ;; [addr] points to the start of the string
    ;; byte keyword is important cause it 
    ;; specifies how much data is being shipped
    mov [addr], byte 'H' 
    mov [addr+5], byte '!' ;; pointer moves to w and replaces it with !
    mov rax, 1             ;; syscall: sys_write
    mov rdi, 1             ;; sys_write: stdout
    mov rsi, addr          ;; pass ref 
    mov rdx, addr_size     ;; pass size of addr
    syscall 

    mov rax, 60 ;; syscall: sys_exit
    mov rdi, 0  ;; sys_exit: exit status
    syscall

