section .text
    global _start

_start:
    mov rbx, 0 ;; start rbx at 0
    mov rcx, 5 ;; number of iteration 
loop: 

    ;; loop
    add rbx, 1 ;; rbx++
    dec rcx    ;; rcx--
    cmp rcx, 0 
    jg loop

    ;; return 
    mov rax, 60  ;; sys_exit 
    mov rdi, rbx ;; exit status = rbx (sum)
    syscall      ;; echo $? should log 5
