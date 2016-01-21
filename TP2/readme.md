# README TP2 - LABD

# Durand Jean-Frédéric

## Ex1

### Question 1

> //livre[titre="edition"]

Sélectionne les éléments livre dont l'élément titre vaut "edition"

> //livre[titre=edition]

Comparaison des éléments livre dont l'élément titre équivaut l'élément edition

**Exemple :**

` <livre>

`   <titre>edition</titre>

`   <edition>edition</edition>

` </livre>

### Question 2

> /item/livre[@titre="labd" and position()=last()]

Sélectionne le sous élément de item : livre dont l'attribut titre est "labd" ET est en dernière position. Si en dernière position il n'y a aucun élément dont le titre est "labd" il ne retournera rien.

> /item/livre[@titre="labd"] [position()=last()]

Sélectionne le sous élément de item : livre dont l'attribut titre est "labd" puis va chercher le dernier élément parmis ceux dont le titre est "labd".

> /item/livre[position()=last()] [@titre="labd"]

Idem que pour la première expression.

**Exemple :**

` <item>

`   <livre titre="labd"/>

`   <livre titre="AutreChose"/>

` </item>

### Question 3

> /descendant::livre[1]

Retourne le premier livre fils parmi la liste de tous les éléments

> //livre[1]

Retourne la liste du premier livre fils à chaque noeud

**Exemple :**

` <item>

`   <livres>

`     <livre/>

`   </livres>

`   <livres>

`     <livre/>

`   </livres>

` </item>

Ici la première expression renverra le fils du premier livre, tandis que la deuxième renverra le premier livre mais également le deuxième.

## Ex2

### Question 1

1.

> //fruit/producteur

2.

> //legume[origine = "Espagne"]

3.

> //fruit[@type = "clementine" and @calibre = 1]

4.

> //origine[@region="Bretagne"]/../producteur

## Ex3

### Question 1
