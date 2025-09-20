;; Definition of data section
section .data
    ;; string variable
    msg db "Hello, World!"

;; Definition of text section
section .text 
    ;; Reference to entry point of our program
    ;; Mark _start as global to make it visible to the linker 
    global _start

;; Entry point
_start:
    ;; Put value 1 in register 'rax'
    ;; System call: 1 -> sys_write
    mov rax, 1 
    ;; First Arg [Operation] of sys_write: 1 -> stdout 
    mov rdi, 1 
    ;; Second Arg [data] of sys_write: msg -> reference of msg string var 
    mov rsi, msg
    ;; Third Arg [length] of sys_write: 13 -> length of msg
    mov rdx, 13
    ;; Call the sys_write system call
    syscall

    ;; Let's make our Exit
    ;; System call: 60 -> sys_exit
    mov rax, 60
    ;; First Arg [Status] of sys_exit: 0 -> success exit status (no error)
    mov rdi, 0
    ;; Call the sys_exit system call
    syscall


    
