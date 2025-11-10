# Petit assembleur : afficher la somme des multiples de 3 de 0 à n
 
  ## Étapes
  1. Compléter le programme assembleur `petit_assembleur.asm` pour qu'il affiche la somme des multiples de 3 de 0 à `n`. \
`n` est défini dans la section `.data`.
  Le résultat sera mis dans le registre `eax` et sera affiché dans la console par la sous-routine `int_to_string` qui est déjà codée. \
  Votre code doit être ajouté à l'endroit indiqué :

```asm
      ; insérer votre code entre les deus traits.
      ; le registre eax doit contenir la somme 
      ; qui sera affichée.
      ; --------------------------------------------


      ; --------------------------------------------
      ; !!!! Ne pas modifier le code ci-dessous !!!!
      ; appel à une interruption pour afficher un
      ; message dans la console.
```
  2. Tester votre programme pour `n = 12`, puis pour d'autres valeurs de `n`. \
Pour lancer la compilation et l'exécution taper la commande `./pasm petit_assembleur` dans un terminal.

  4. Compléter le commentaire à la fin du programme avec les résultats que vous avez obtenu pour `n = 15`, `n = 100`, `n = 601` et `n = 2773`.

  6. Quand vous avez fini votre travail, cliquer sur le bouton **Submit** en haut à droite de la fenêtre du devoir Replit.

## Aide

Référez-vous aux documents de cours dans **Classroom** si nécessaire.

La suite de ce document n'est pas nécessaire à l'exercice. 

C'est une information pour expliquer le code traitant l'affichage en assembleur d'un nombre entier.

## Conversion d'un entier en chaine de caractères

La sous-routine `int_to_string` convertit un nombre entier dans la suite de caractères ASCII correspondants à ses chiffres.

Pour cela, une division euclidienne par 10 est effectuée autant de fois que le nombre contient de chiffres. Le reste de chaque division euclidienne donne le chiffre pour chaque rang.

### Exemple
Soit le nombre `782` à afficher.

On doit affectuer 3 divisions euclidiennes (`782` a 3 chiffres).

1. Première division sur le nombre `782`

   `782 = 78*10 + 2`
   
    Le reste `2` donne le chiffre des unités.
   
    L'opération `'0' + 2` permet ensuite de retourner le code ASCII du chiffre `2`, c'est-à-dire `50` en décimal ou `0x32` en hexadécimal.
 
2. Deuxième division sur le quotient obtenu : `78`

    `78 = 7*10 + 8`

   Le reste `8` donne le chiffre des dizaines.

4. Troisième division sur le quotient obtenu : `7`

    `7 = 0*10 + 7`

   Le reste `7` donne le chiffre des centaines.

La boucle s'arrête lorsque le quotient à diviser est `0`.

## Affichage à l'écran

Lorsqu'un programme assembleur affiche un résultat à l'écran, il le fait sur une partie de l'écran appelée **console** ou **shell** sur un système *nix (Unix, Linux, macOS, etc.).

Afficher un caractère à l'écran (c'est-à-dire la console) en assembleur demande plusieurs dizaines de lignes de code car l'écran est un périphérique de sortie, et l'intéraction avec un périphérique d'entrée/sortie en assembleur, un langage de bas niveau, demande beaucoup de code.

On utilise donc une *commande système*, déjà codée en langage machine pour notre système, via une **interruption**. On *interrompt* notre programme pour *faire appel* à la commande du système qui permet d'afficher à l'écran. Une fois la commande terminée, le système rend la main à notre programme et la suite de notre code assembleur continue de s'exécuter.

L'appel à cette commande système se fait en 5 lignes :

```asm
    mov edx, len         ; longueur du message en octets
    mov ecx, msg  	   	 ; addresse mémoire du message
    mov ebx, 1  		 ; numéro du périphérique : 1 est l'écran
    mov eax, 4  		 ; numéro de la commande : 4 est l'écriture 
    int 0x80             ; appel d'interruption à la commande
```
`len` et `msg` seront définis dans la section **données**. Par exemple :

```asm
		msg db 'Bonjour !'   ; message à afficher
    len db 9             ; longueur du message = 9 octets
```

On peut aussi calculer automatiquement la longueur du message avec `equ $ - msg` :

```asm
		msg db 'Bonjour !'   ; message à afficher
    len equ $-msg        ; calcule la longueur du message précédent
```

On peut aussi ajouter un retour à la ligne à notre message :

```asm
		msg db 'Bonjour !', 0xA   ; message à afficher + retour à la ligne
    len equ $-msg             ; calcule la longueur du message précédent
```

Le *code ASCII* du retour à la ligne est `0xA` en hexadécimal ou `10` en décimal.

**À noter :** `msg` est l'adresse (du premier octet) de la mémoire contenant la suite des codes ASCII du message.

Le message à afficher ne peut contenir que des **caractères affichables de la table ASCII** (lettres majuscules et minuscules, chiffres et symboles) et certains **caractères de contrôle** tel que le retour à la ligne.

## Conversion d'un chiffre en code ASCII

Après le code suivant :
```
    mov eax, 6       ; eax contient le nombre 6
    mov msg, eax     ; msg contient 6
```
un appel à la commande sytème pour afficher `msg` n'affichera rien, car `msg` est interprété comme une suite d'octets contenant du code ASCII. Et `6` est le code ASCII d'un caractère non-affichable.

Pour afficher le chiffre "6", `msg` doit donc contenir le code ASCII du caractère "6" :
```
    mov eax, '6'     ; eax contient le code ASCII du chiffre "6", c'est-à-dire 54
    mov msg, eax
```

Ce qui est équivalent au code suivant :
```
    mov eax, 54     ; eax contient le nombre 54, le code ASCII du chiffre "6"
    mov msg, eax
```

Ce qui est équivalent au code suivant :
```
    mov eax, 0x36    ; eax contient le nombre 54 (0x36 en hexadécimal)
    mov msg, eax
```

`36` est l'écriture hexadécimale de `54`, le préfixe `0x` indiquant que l'écriture est hexadécimale.

Pour convertir un chiffre en son code ASCII, on peut aussi utiliser le code suivant :
```
    mov eax, 6       ; eax contient 6
    add eax, '0'     ; eax contient 6 + '0' = 6 + 48 = 54 
                     ; (48 est le code ASCII du caractère "0")
```
