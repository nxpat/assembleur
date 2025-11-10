; affiche le n-ième nombre de la suite de Fibonacci
;
; assemble, link and run with ./pasm fibonacci

section .text

global _start

_start:

      ; insérer votre code ici
      ; ----------------------------------------------


      ; ----------------------------------------------
      ; fin de votre code
      ; eax doit contenir le n-ième nombre de la suite de Fibonacci 
      ; et sera affiché par les instructions ci-après.
      ; !!!! Ne pas modifier le code ci-dessous !!!!
out:
      ; convert integer to string
      ; écrit le résultat dans "msg"
      mov  esi, msg 
	    add  esi, len-2
      call int_to_string

      ; écrit "n" dans "msg"
      mov eax, [n]      
      mov  esi, msg
	    add  esi, 5
      call int_to_string

      ; affiche "msg" dans la console
      ; call write syscall
      mov edx, len         ; length of the string
      mov ecx, msg  		   ; address of the string
      mov ebx, 1  		     ; file descriptor, in this case stdout
      mov eax, 4  		     ; syscall number for write
      int 0x80

      ; call exit syscall
      mov eax, 1
      int 0x80

; Input:
; eax = integer value to convert
; esi = pointer to string to write the digit characters
int_to_string:
			mov ebx, 10			    ; pour la division euclidienne par 10
.next_digit:
			xor edx, edx        ; clear edx prior to dividing edx:eax by ebx
			div ebx            	; eax /= 10
			add dl, '0'        	; convert the remainder to ASCII 
			dec esi    		      ; store characters in reverse order
			mov [esi], dl	      ;
			test eax, eax           
			jnz .next_digit    	; repeat until eax == 0
			ret

section .data
			n dd 7
			msg db "Le   -ième nombre de Fibonacci est           .", 0xA
      len: equ $-msg      ; length of msg


; Vos résultats :
; n = 7        nombre = 
; n = 23       nombre = 
; n = 34       nombre = 
; n = 48       nombre = 
