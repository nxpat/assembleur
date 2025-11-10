; affiche la somme des multiples de 3 de 0 à n dans la console
;
; assemble, link and run with ./pasm petit_assembleur
; exécuter dans le shell avec la commande ./pasm petit_assembleur

section .text

global _start

_start:

      ; insérer votre code entre les deux traits.
      ; le registre eax doit contenir la somme 
      ; qui sera affichée.
      ; --------------------------------------------

 

      ; --------------------------------------------
      ; !!!! Ne pas modifier le code ci-dessous !!!!
      ; appel à une interruption pour afficher un
      ; message dans la console.

      ; convert integer to string
      mov  esi, msg
      call int_to_string

      ; affiche "msg" dans la console
      ; call write syscall
      mov edx, lenmsg      ; length of the string
      mov ecx, msg  		   ; address of the string
      mov ebx, 1  		     ; file descriptor, in this case stdout
      mov eax, 4  		     ; syscall number for write
      int 0x80

      ; call exit syscall
      mov eax, 1
      int 0x80

; fonction : conversion d'un entier en ASCII
; Input:
; eax = integer value to convert
; esi = pointer to string to write the digit characters
int_to_string:
	    add esi, lenmsg-2
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
			n dd 100
			msg db "La somme est           .", 0xA
      lenmsg: equ $-msg   ; length of msg


; Vos résultats :
; n = 15       somme = 45
; n = 100      somme = 
; n = 601      somme = 
; n = 2773     somme = 
