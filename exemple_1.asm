; sum of array elements (integers)
; and write to console
; only works if the sum is a single digit
;
; assemble, link and run with ./pasm exemple_1

section .text

global _start

_start:
       mov eax, 0		
       mov ebx, tab		  
       mov ecx, 5  
bcl:
       cmp ecx, 0	
       je fin	
       add eax, [ebx]
       add ebx, 4	
       sub ecx, 1
       jmp bcl
fin:
       add eax, '0'   ; eax becomes a character
       mov [sum], eax
       
       ; Call write syscall
       mov edx, 1     ; length of the string
       mov ecx, sum   ; address of the string
       mov ebx, 1     ; file descriptor, in this case stdout
       mov eax, 4     ; Syscall number:  write
       int 0x80

       ; Call exit syscall
       mov eax, 1
       int 0x80
       
section .data
			tab dd 1, 2, 3, 2, 1  
	
section .bss
			sum resd 1  
