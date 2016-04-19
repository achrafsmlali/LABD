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

```SPARQL
PREFIX humans: <http://www.inria.fr/2007/09/11/humans.rdfs#>
SELECT * WHERE {
  ?x a humans:Person
  ?x  humans:name ?n
  ?x humans:shoesize ?s
  ?x humans:age ?a
  FILTER (?n ="John")
}
```

2)

```SPARQL
PREFIX humans: <http://www.inria.fr/2007/09/11/humans.rdfs#>
DESCRIBE ?x
WHERE {
  ?x  humans:name ?n
  FILTER (?n ="John") 
}
```

### Question 6

1)

 - John est le père de Mark
 - Catherine est la mère de lucas
 - Harry à pour enfant John
 - Jack à pour enfant Harry
 - Flora à pour enfant Pierre
 - Gaston à pour enfant Pierre
 - Gaston à pour enfant John

2)

```SPARQL
PREFIX humans: <http://www.inria.fr/2007/09/11/humans.rdfs#>
SELECT ?x WHERE
{
  ?x humans:hasChild ?son
}
```

3)

5 réponses obtenues avec la requete ci-dessus. 1 doublon : Gaston.

4)

Pour éviter les doublons, on effectue un "SELECT DISTINCT" au lieu d'un "SELECT".

5)

```SPARQL
PREFIX humans: <http://www.inria.fr/2007/09/11/humans.rdfs#>
SELECT DISTINCT ?x WHERE
{
  ?x a humans:Man
  FILTER NOT EXISTS {?x humans:hasChild ?children}
}
```

6) Flora est mariée et à pour enfant Pierre, Jennifer est mariée également.

```SPARQL
PREFIX humans: <http://www.inria.fr/2007/09/11/humans.rdfs#>
SELECT DISTINCT ?x ?children WHERE
{
?x a humans:Woman
OPTIONAL {?x humans:hasChild ?children}
?x humans:hasSpouse ?somebody
}
```

### Question 7

Karl & Mark ont la meme taille de chemises.

```SPARQL
PREFIX humans: <http://www.inria.fr/2007/09/11/humans.rdfs#>
SELECT ?x ?y WHERE
{
?x a humans:Person
?y a humans:Person 
?x humans:shirtsize ?sx
?y humans:shirtsize ?sy

FILTER (?x != ?y)

FILTER (xsd:integer(?sx) = xsd:integer(?sy))
}
```

### Question 8

```SPARQL
PREFIX humans: <http://www.inria.fr/2007/09/11/humans.rdfs#>
SELECT ?friend ?x WHERE
{
?x humans:hasFriend ?friend
}
```

### Question 9

Lorsque j'utilise NOT EXISTS, FILTER NOT EXISTS ou MINUS, cela ne fonctionne pas.

```SPARQL
PREFIX humans: <http://www.inria.fr/2007/09/11/humans.rdfs#>
SELECT DISTINCT * WHERE
{
  ?x a humans:Person
  FILTER NOT EXISTS{
    ?x a humans:Man
  }
}
```

## Exercice 2

### Question 1

La classe age est une propriété qui semble pouvoir etre appliquée partout car elle n'a pas de domaine.

### Question 2

```SPARQL
SELECT ?x WHERE
{
 ?x a rdfs:Class
}
```

### Question 3

```SPARQL
SELECT * WHERE {
  ?x rdfs:subClassOf ?y
}
```

a completer

## Exercice 3

### Question 1

1)

```SPARQL
PREFIX humans: <http://www.inria.fr/2007/09/11/humans.rdfs#>
SELECT DISTINCT ?x WHERE
{
?x a humans:Person
}

PREFIX humans: <http://www.inria.fr/2007/09/11/humans.rdfs#>
SELECT DISTINCT ?x WHERE
{
?x a humans:Animal
}
```

En réinitialisant corese j'obtiens 7 Personnes & 0 Animaux.

2)

On peut observer dans le human.rdfs que la classe "Man" & "Woman"sont des sous classes de "Person". Ceci explique le fait que nous obtenons alors plus de résultat pour les Personnes puisque des personnes étaient déclarés comme Man & Woman sans forcément etre déclarés comme des Personnes dans le fichier human.rdf.

Quand aux Animaux, nous pouvons observer dans human.rdfs que "Person" est une sous classe de "Animal", ceci expliquant les résultats de la deuxième requete.

### Question 2

1)

```SPARQL
PREFIX humans: <http://www.inria.fr/2007/09/11/humans.rdfs#>
SELECT DISTINCT *  WHERE
{
?x a humans:Male
?x humans:hasSpouse ?y
}
```

Nous n'obtenons désormais qu'un seul résultat car les autres personnes sont déclarés comme étant des personnes et non des "Man".

2)

Nous obtenons désomais le couple Karl & Catherine car l'attribut hasFather procure le statut de "Male".

### Question 3


a completer

### Question 4

```SPARQL
PREFIX humans: <http://www.inria.fr/2007/09/11/humans.rdfs#>
SELECT DISTINCT ?x WHERE
{
?x humans:hasAncestor ?y
}
```

La relation hasAncestor semble découler des rélations hasParent, hasMother & hasFather.