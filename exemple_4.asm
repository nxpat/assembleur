;
; test write to console with printf
; assemble, link and run with:
; ./pasmg exemple_4

section .text

global main      ; main required for gcc

extern printf

main:
      mov  eax, 0		
      mov  ebx, array		  
      mov  ecx, 5  
loop:
      cmp  ecx, 0	
      je   out	
      add  eax, [ebx]
      add  ebx, 4	
      sub  ecx, 1
      jmp  loop
out:
      push eax
      push message
      call printf
      add esp, 8
      
      mov ebx, array
      mov eax, [ebx+8]
      push eax
      push message
      call printf
      add esp, 8
      ret

section .data
      array dd 10, 20, 30, 40, 501
      message db "Somme = %d", 0xA, 0
