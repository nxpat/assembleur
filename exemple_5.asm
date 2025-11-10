; compare deux nombres et affiche un message dans la console
;
; assemble, link and run with ./pasm exemple_5
; exécuter dans le shell avec la commande ./pasm exemple_5

section .text

global _start

_start:

    mov     eax, [x]      ; eax = [x]
    mov     ebx, [y]      ; ebx = [y]
    cmp     ebx, eax      ; compare ebx à eax
    je      egalite       ; ebx = eax

    mov     ecx, msg2     ; adresse du message
    mov     edx, len2     ; longueur du message (en octets)
    mov     ebx, 1
    mov     eax, 4
    int     0x80
    jmp     fin
    
egalite:
    mov     ecx, msg1    ; adresse du message
    mov     edx, len1    ; longueur du message (en octets)
    mov     ebx, 1       ; code pour affichage à l'écran (stdout)
    mov     eax, 4       ; mode en écriture
    int     0x80         ; interruption (appel système)

fin:
    mov     eax, 1       ; arrêt de l'appel système
    int     0x80

section .data
    x dd 278
    y dd 278
    msg1 db  "x est égal à y", 0xA          ; message avec retour à la ligne
    len1 equ $ - msg1
    msg2 db  "x est différent de y", 0xA
    len2 equ $ - msg2
