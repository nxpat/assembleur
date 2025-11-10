;
; exercice 5 p22 NSI 1ère Hachette
; assemble, link and run with :
; ./pasmg ex5p22

section .text

global main	; main required for gcc

extern printf

main:
      mov eax, [x]
      mov [z], eax
      mov eax, [y]
      mov [x], eax
      mov eax, [z]
      mov [y], eax
out:
      mov eax, [x]
      push eax
      push message_x
      call printf
      add esp, 8
      
      mov eax, [y]
      push eax
      push message_y
      call printf
      add esp, 8
      ret

section .data
      x dd 2
      y dd 7
      message_x db "x = %d", 0xA, 0
      message_y db "y = %d", 0xA, 0

section .bss
      z resd 1
