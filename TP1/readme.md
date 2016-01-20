# README TP1 - LABD

# Durand Jean-Frédéric

## Ex1

j'ai organisé le XML de la façon suivante :
 - pays, capitale et habitant sont de éléments
 - pays à pour attribut nom

## Ex2

Fonctionnel, y compris pour l'alcove qui a été géré via un flag (inARoom) qui gère si la supérficie de la pièce est définie par un élément de niveau supérieur.

Commandes :

Lancement :

> java ex2 maisons.xml

Compilation : 

> javac ex2.java

## Ex3

Voir ex3.md

## Ex4

J'ai organisé mon XML et mes DTD de la façon suivante : 
 - itinéraire à 2 éléments fils recapitulatif & detail
 - récapitulatif contient les éléments fils suivants : depart, arrivee, date, mode, preferences, vitesse, duree
 - detail contient un élément fils qui est etapes
 - etapes possède 4 attributs heure, direction, duree, mode.
 - mode est obligatoire

## Ex5

 Voir famille.dtd

## Ex6

 Voir maisons.dtd

La déclaration des Attributs est lourde via les DTD, je ne vois pas de solutions pour déclarer plusieurs attributs commun a un élément en une fois.

Pour le cas de la chambre on est obligé de finir avec une * et non un ?
