# README TP2 - LABD

# Durand Jean-Frédéric

## Ex1

### Question 1

> //livre[titre="edition"]

Sélectionne les éléments livre dont l'attribut titre vaut "edition"

> //livre[titre=edition]

Comparaison des éléments livre dont l'attribut titre équivaut l'attribut edition

__ Exemple : __

> <livre>
>   <titre>edition</titre>
>   <edition>edition</edition>
> </livre>

### Question 2

> /item/livre[@titre="labd" and position()=last()]

> /item/livre[@titre="labd"] [position()=last()]

> /item/livre[position()=last()] [@titre="labd"]
