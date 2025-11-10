section .text
    global _start

_start:
    ; Write the message to stdout
    mov eax, 4          ; syscall number for sys_write
    mov ebx, 1          ; file descriptor 1 (stdout)
    mov ecx, message    ; pointer to the string
    mov edx, 13         ; length of the string
    int 0x80            ; call kernel

    ; Exit the program
    mov eax, 1          ; syscall number for sys_exit
    xor ebx, ebx        ; return 0 status
    int 0x80            ; call kernel

section .data
    message db 'Hello, World!', 0  ; Null-terminated string

