; sum of array elements (integers)
; and write to console
; only works if the sum is a single digit
; same code as ax1.asm but with an added message
; and a calculation of the length of the array
;
; assemble, link and run with ./pasm exemple_2

section .text

global _start

_start:
      mov eax, 0		
      mov ebx, tab		  
      mov ecx, 5  
boucle:
      cmp ecx, 0	
      je end	
      add eax, [ebx]
      add ebx, 4	
      sub ecx, 1
      jmp boucle
end:
      add eax, '0'       ; eax becomes a character
      mov [sum], eax
      mov al, [sum]
      mov [msg + 13], al ; 13 is offset of '?'
      
      ; call write syscall
      mov edx, len       ; length of the string
      mov ecx, msg       ; address of the string
      mov ebx, 1         ; file descriptor, in this case stdout
      mov eax, 4         ; Syscall number:  write
      int 0x80

      ; call exit syscall
      mov eax, 1
      int 0x80
      
section .data
      tab dd 1, 2, 3, 2, 1  
      msg db "La somme est ?.", 0xA
      len: equ $-msg     ; "len" calculates the current
                         ; offset minus the "msg" offset.
                         ; which gives the size of "msg"
	
section .bss
      sum resd 1  
