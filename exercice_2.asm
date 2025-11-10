; Exercice_2
; vérifie si un nombre est pair ou impair et affiche un message dans la console
;
; assemble, link and run with ./pasm exercice_2
; exécuter dans le shell avec la commande ./pasm exercice_2

section .text

global _start

_start:

    mov     eax, [n]      ; eax = [n]

    mov     ecx, msg1     ; adresse du message
    mov     edx, len1     ; longueur du message (en octets)
    mov     ebx, 1
    mov     eax, 4
    int     0x80

    mov     eax, 1        ; arrêt de l'appel système
    int     0x80

section .data
    n dd 123
    msg1 db  "n est un nombre", 0xA          ; message avec retour à la ligne
    len1 equ $ - msg1

