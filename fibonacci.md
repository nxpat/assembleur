# Suite de Fibonacci

## Introduction

La [suite de Fibonacci](https://fr.wikipedia.org/wiki/Suite_de_Fibonacci) est une suite de nombres qui commence par `0` et `1` et dont chaque nombre suivant est la somme des deux nombres précédents. Cette suite de nombres intervient dans de nombreux phénomènes naturels, notamment la croissance des plantes.

Le début de la suite est : `0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144`.

Le 7<sup>ème</sup> nombre de la suite de Fibonacci est `8`.  \
Le 12<sup>ème</sup> nombre de la suite de Fibonacci est `89`. 

Chaque nombre est obtenu en additionnant les deux nombres précédents :

`0 + 1 = 1` \
`1 + 1 = 2` \
`1 + 2 = 3` \
`2 + 3 = 5` \
`3 + 5 = 8` \
`5 + 8 = 13` \
etc.

  ## Étapes
  1. Compléter le programme en assembleur `fibonacci.asm` pour qu'il affiche le `n`-ième nombre de la suite de Fibonacci. \
Le nombre `n` est défini dans la section  `.data`. \
Le résultat sera mis dans le registre `eax` et sera affiché dans la console par la sous-routine `int_to_string` qui est déjà codée. \
Votre code doit être ajouté à l'endroit indiqué (entre les deux traits) : 
```asm
      ; insérer votre code ici
      ; ----------------------------------------------


      ; ----------------------------------------------
      ; fin de votre code
      ; eax doit contenir le n-ième nombre de la suite de Fibonacci 
      ; et sera affiché par les instructions ci-après.
```
  3. Tester votre programme pour `n = 7`, puis pour d'autres valeurs de `n`. \
Pour lancer la compilation et l'exécution cliquer sur le bouton vert **Run**. \
Vous pouvez aussi lancer la commande `./main.sh` dans le shell ou la console.
  5. Compléter le commentaire à la fin du programme avec les résultats que vous avez obtenu pour `n = 23`, `n = 34` et `n = 48`.
  6. Quand vous avez fini votre travail, cliquer sur le bouton **Submit** en haut à droite de la fenêtre du devoir Replit.

## Aide

Référez-vous aux documents de cours dans **Classroom** si nécessaire.

