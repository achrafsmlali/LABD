# TP10 - LABD

*Durand Jean-Frédéric*

## Exercice 1

### Question 1 

```SPARQL
SELECT DISTINCT ?x WHERE
{
 ?x a rdfs:Class
}
```

### Question 2

```SPARQL
PREFIX sch: <http://www.labd.org/2015/sport/schema#>
SELECT DISTINCT ?x WHERE
{
 ?x rdfs:domain sch:Sport
}
```

### Question 3

```SPARQL
PREFIX sch: <http://www.labd.org/2015/sport/schema#>
SELECT DISTINCT ?x WHERE
{
 ?x rdf:type sch:Sport
}
```

### Question 4

```SPARQL
PREFIX sch: <http://www.labd.org/2015/sport/schema#>
SELECT DISTINCT ?x ?t WHERE
{
 ?x rdfs:comment ?t
 FILTER regex(?t, "sport")
}
```

### Question 5

```SPARQL
PREFIX sch: <http://www.labd.org/2015/sport/schema#>
SELECT DISTINCT ?x WHERE
{
 ?x a sch:Sport
 FILTER NOT EXISTS {?x sch:utiliseMateriel ?y}
}
```

### Question 6

1)

```SPARQL
PREFIX sch: <http://www.labd.org/2015/sport/schema#>

SELECT ?x WHERE
{
 ?x sch:pratique ?t
}
GROUP BY ?x
HAVING (COUNT (?t) > 1)
```

2)

```SPARQL

```

### Question 7

1)

```QPARQL
PREFIX sch: <http://www.labd.org/2015/sport/schema#>

SELECT ?x WHERE
{
 ?x sch:pratique ?t
}
GROUP BY ?x
HAVING (COUNT (?t) = 1)
```

2)

```SPARQL

```

### Question 8

```SPARQL
PREFIX sch: <http://www.labd.org/2015/sport/schema#>
SELECT ?x (count(?t) as ?y) WHERE
{
  ?x sch:pratique ?t
}
GROUP BY ?x
```

### Question 9

```SPARQL
PREFIX sch: <http://www.labd.org/2015/sport/schema#>
PREFIX ins: <http://www.labd.org/2015/sport/instance#>
SELECT ?x  WHERE
{
  ins:Basket sch:match/sch:duree/rdfs:member ?x
}
```

### Question 10

```SPARQL
PREFIX sch: <http://www.labd.org/2015/sport/schema#>
PREFIX ins: <http://www.labd.org/2015/sport/instance#>
SELECT ?x  WHERE
{
  ins:Basket sch:match/sch:duree/rdfs:member ?x
  FILTER regex(?x, "NBA")
}
```

### Question 11

```SPARQL
PREFIX sch: <http://www.labd.org/2015/sport/schema#>
PREFIX ins: <http://www.labd.org/2015/sport/instance#>
SELECT ?x ?t WHERE
{
  ?x a sch:SportCollectif
   ?x sch:match/sch:duree/rdfs:member? ?t
   FILTER isLiteral(?t)
}
```

## Exercice 2

### Question 1 

```SPARQL
PREFIX foaf: <http://xmlns.com/foaf/0.1/>
PREFIX james: <http://bond007.org/RDF/mes_donnees.rdf#>
SELECT ?x ?t WHERE
{
 james:me foaf:knows ?y
 ?y foaf:name ?x
 OPTIONAL {?y foaf:homepage ?t}
}
```

### Question 2

```SPARQL
PREFIX foaf: <http://xmlns.com/foaf/0.1/>
PREFIX james: <http://bond007.org/RDF/mes_donnees.rdf#>
SELECT ?x ?t WHERE
{
 james:me foaf:knows ?y
 ?y foaf:name ?x
OPTIONAL {?y foaf:homepage | foaf:interest | foaf:workplaceHomepage ?t}
}
``` 

### Question 3

```SPARQL
PREFIX foaf: <http://xmlns.com/foaf/0.1/>
PREFIX james: <http://bond007.org/RDF/mes_donnees.rdf#>
SELECT ?x WHERE
{
 james:me foaf:knows+/foaf:name ?x
 FILTER NOT EXISTS { ?x foaf:name "James Bond" }
}
```

### Question 4

```SPARQL
PREFIX foaf: <http://xmlns.com/foaf/0.1/>
PREFIX james: <http://bond007.org/RDF/mes_donnees.rdf#>
SELECT ?x WHERE
{
 james:me foaf:knows ?y
 ?y foaf:name ?x
 FILTER NOT EXISTS {?y foaf:phone ?z}
}
```

### Question 5

```SPARQL
PREFIX foaf: <http://xmlns.com/foaf/0.1/>
PREFIX james: <http://bond007.org/RDF/mes_donnees.rdf#>
SELECT  ?x (count(?t) as ?y) WHERE
{
 ?x a foaf:Person 
 ?x foaf:knows ?t
}
GROUP BY ?x
```