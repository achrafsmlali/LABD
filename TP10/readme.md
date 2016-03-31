# TP10 - LABD

*Durand Jean-Frédéric*

## Exercice 1

### Question 1 

La requête va renvoyer pour tous les éléments :

 - ?x le nom de l'élement.
 - ?t le type de l'élement ?x.


On obtient 33 résultats. Ce resultat doit correspondre au nombre d'élement que contient le fichier human.

```SPARQL
SELECT ?x ?t WHERE
{
 ?x rdf:type ?t
 FILTER regex(?x, "John")
}
```

En effectuant le filtre précédent, on retrouve que John est de type Human.

### Question 2

La requête va chercher tous les éléments ?x ayant comme époux ?y.

En exécutant la requête on obtient 6 résultats.

### Question 3

La propriété utilisée pour donner l'age d'une personne est : age.

```SPARQL
PREFIX humans: <http://www.inria.fr/2007/09/11/humans.rdfs#>
shSELECT ?x ?y WHERE
{
  ?x humans:age ?y
  FILTER (xsd:integer(?y) > 20)
}
```

On obtient 6 résultats. Je sélectionne ici également le ?y bien que ça ne soit pas obligatoire pour contrôler les ages.

### Question 4

1) On obtient 4 résultats

```SPARQL
PREFIX humans: <http://www.inria.fr/2007/09/11/humans.rdfs#>
SELECT ?x ?y WHERE
{
   ?x a humans:Person
   ?x humans:shoesize ?y
}
```

2) On obtient 7 résultats

```SPARQL
PREFIX humans: <http://www.inria.fr/2007/09/11/humans.rdfs#>
SELECT ?x ?y WHERE
{
   ?x a humans:Person
   OPTIONAL{?x humans:shoesize ?y}
}
```

3) On obtient 7 résultats

```SPARQL
PREFIX humans: <http://www.inria.fr/2007/09/11/humans.rdfs#>
SELECT ?x ?y WHERE
{
   ?x a humans:Person
   OPTIONAL{?x humans:shoesize ?y
    FILTER(xsd:integer(?y)>8)}
}
```

4)

```SPARQL
PREFIX humans: <http://www.inria.fr/2007/09/11/humans.rdfs#>
SELECT ?x ?y ?z WHERE
{
  ?x a humans:Person
  {
     ?x humans:shoesize ?y
     FILTER(xsd:integer(?y)>8)
  }UNION{
     ?x humans:shirtsize ?z
     FILTER(xsd:integer(?z)>12)
  }
}
```

### Question 5

    <http://www.inria.fr/2007/09/11/humans.rdfs-instances#John>

1)



