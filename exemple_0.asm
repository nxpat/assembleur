; Premier exemple
; Ajoute deux entiers et écrit le résultat dans la console
; Ne fonctionne que pour des entiers et une somme inférieurs à 10 !
;
; assemble, link and run with ./pasm exemple_0
; exécuter dans le shell avec la commande ./pasm exemple_0

section .text

global _start

_start:

    mov     eax, [x]      ; eax = '5' (caractère ASCII 5)
    sub     eax, '0'      ; eax = '5' - '0' = 5 
    mov     ebx, [y]      ; ebx = '3' (caractère ASCII 3)
    sub     ebx, '0'      ; ebx = '3' - '0' = 5
    add     eax, ebx      ; eax = eax + ebx = 5 + 3 = 8
    add     eax, '0'      ; eax = 8 + '0' = '8'

    mov     [sum], eax    ; [sum] = eax (la mémoire pointée par sum est mise à eax)

    ; Call write syscall
    mov     ecx, msg     ; adresse du message
    mov     edx, len     ; longueur du message (en octets)
    mov     ebx, 1       ; code pour affichage à l'écran (stdout)
    mov     eax, 4       ; mode en écriture
    int     0x80         ; interruption (appel système)

    ; Call write syscall
    mov     ecx, sum     ; adresse du message (la mémoire pointée par sum)
    mov     edx, 1       ; longueur du message (en octets)
    mov     ebx, 1
    mov     eax, 4
    int     0x80

    mov     ecx, 0xA     ; [ret] = 0xA (caractère ASCII du retour à la ligne)
    mov     [rl], ecx
    
    ; Call write syscall
    mov     ecx, rl
    mov     edx, 1
    mov     ebx, 1
    mov     eax, 4
    int     0x80

    ; Exit the program
    mov     eax, 1       ; arrêt de l'appel système
    int     0x80

section .data
    x db '5'
    y db '3'
    msg db  "La somme de x et y est "
    len equ $ - msg

segment .bss
    sum resb 1
    rl  resb 1
