global _start

_start:
    call func
    
    mov rax, 60 ;; sys_exit
    mov rdi, 0  ;; exit status
    syscall

func:
    ;; Prologue
    ;; Base pointer
    push rbp     ;; saves our ass from altering rbp if we're using nested func
    mov rbp, rsp ;; store in rbp the initial point where the stack was entered
    sub rsp, 2   ;; allocate 2 bytes on the stack

    ;; Store data
    mov [rsp], byte 'H'
    mov [rsp+1], byte 'i'
    mov [rsp+2], byte 0x0a 

    ;; Stdout
    mov rax, 1   ;; sys_write
    mov rdi, 1   ;; stdout
    mov rsi, rsp ;; bytes to write
    mov rdx, 3   ;; number of bytes to write
    syscall

    ;; Epilogue
    mov rsp, rbp ;; deallocate space: restore stack pointer to initial point
    pop rbp      ;; restore rbp   
    ret
