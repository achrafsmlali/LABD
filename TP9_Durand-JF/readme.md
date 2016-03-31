# TP9 - LABD

*Durand Jean-Frédéric*

## Exercice 1

### Question 1 

Instance séparée du Schema. Voir SchemaQ1.turtle & InstanceQ1.turtle pour la première partie. Ainsi que ShemaQ1.xml & InstanceQ1.xml pour le RDF/XML.

### Question 2

Mon interprétation de la question 2 est la suivante :
je considère toujours les deux classes précédentes Voitures et Marque à la différence que le nom de la voiture est maintenant uniquement du domaine de voiture.
En effet je viens greffer Societe comme un Datatype du domaine de Marque. Societe contient a son tour un DatatypeProperty qui s'appelle dateCreation.

## Exercice 2

J'ai déclaré Boby et Leon comme étant des personnes puis effectué une réification du sujet "Leon" avec le prédicat "estAtteintPar", l'objet "maladie".

## Exercice 3

<#Container> fournit la liste au format conteneur.

<#Collection> fournit la liste au format rdf:first & rdf:rest.

## Exercice 4

### Question 1

Les 10 triplets sont :

- Personne, de type classe
- Stagiaire de type classe
- Stagiaire de sous-type Personne
- Tuteur de type classe
- Tuteur de sous-type Personne
- encadre de type Propriété
- encadre de domaine Tuteur
- encadre va chercher ses informations parmis les informations de Stagiaire
- encadre est une sous-propriété de "connus"
- Ali encadre Louis

### Question 2

Les 5 triplets supplémentaires insérables sont :

- Un Type pour une Classe
- Un Domaine pour une Classe
- Un Range pour une Classe

## Exercice 5

Pour plus de détail sur la façon dont j'ai modélisé l'exercice 5 voir le schema: ex5/ex5.svg.

Concernant la modélisation : 

    - Le schema abstrait est enregistré sous ex5/ex5.turtle
    - Une instance contenant quelques regles de basketball & football est disponible sous ex5/instanceEx5.turtle