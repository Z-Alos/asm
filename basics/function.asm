global _start

section .text
_start:
    call func   ;; calls func label, pushes next instruction on stack
    mov rax, 60 ;; sys_exit
    syscall

func:
    mov rdi, 69  

    ;; return from the function
    pop rax ;; pop location of func of the stack and put it in rax
    jmp rax ;; jump back to location stored in rax
    ;; Shorthand for returning from function
    ; ret
