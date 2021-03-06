# README TP2 - LABD

# Durand Jean-Frédéric

## Ex1

### Question 1

> //livre[titre="edition"]

Sélectionne les éléments livre dont l'élément titre vaut "edition"

> //livre[titre=edition]

Comparaison des éléments livre dont l'élément titre équivaut l'élément edition

**Exemple :**

```XML
 <livre>
   <titre>edition</titre>
   <edition>edition</edition>
 </livre>
```

### Question 2

> /item/livre[@titre="labd" and position()=last()]

Sélectionne le sous élément de item : livre dont l'attribut titre est "labd" ET est en dernière position. Si en dernière position il n'y a aucun élément dont le titre est "labd" il ne retournera rien.

> /item/livre[@titre="labd"] [position()=last()]

Sélectionne le sous élément de item : livre dont l'attribut titre est "labd" puis va chercher le dernier élément parmis ceux dont le titre est "labd".

> /item/livre[position()=last()] [@titre="labd"]

Idem que pour la première expression.

**Exemple :**

```XML
 <item>
   <livre titre="labd"/>
   <livre titre="AutreChose"/>
 </item>
```

### Question 3

> /descendant::livre[1]

Retourne le premier livre fils parmi la liste de tous les éléments

> //livre[1]

Retourne la liste du premier livre fils à chaque noeud

**Exemple :**

```XML
 <item>
   <livres>
     <livre/>
   </livres>
   <livres>
     <livre/>
   </livres>
 </item>
```

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

### Question 2

1.

> //titre[1]

> //titre[1]

2.

> //ingredient/nom_ing

> //ingredient[@nom]

3.

> //recette[2]/titre

> //recette[2]/titre

4.

> //recette/texte/etape[last()]

> //recette/texte/etape[last()]

5.

> count(//recette)

> count(//recette)

6.

> //recette[.//ingredients[count(*) <7]]

> //recette[count(.//ingredients/ing-recette) < 7]

7.

> //recette/titre[..//ingredients[count(*) <7]]

> //recette/titre[count(..//ingredients/ing-recette) < 7]

8.

> //recette[.//*[contains(., "farine")]]

> //recette[.//ingredients/ing-recette[contains(@ingredient,"farine")]]

9.

> //recette[.//categorie[contains(.,"entrée")]]

> //recette[contains(@categ,"entree")]

## Ex4

### Question 1

1.

> count(//dict/dict[key="Track ID"])

2.

> //key[text()="Album"]/following-sibling::string[1]

3.

> //key[text()="Genre"]/following-sibling::string[1]

4.

> count(//key[text()="Genre"]/following-sibling::string[1][text()="Jazz"])

5.

> distinct-values(//key[text()="Genre"]/following-sibling::string[1])

6.

> //key[text()="Play Count"]/following-sibling::integer[1]/../key[text()="Name"]/following-sibling::string[1]

7.

_explication :_ on va chercher les dict ne contenant pas une clé "Play Count" et une clé "Name". On va ensuite renvoyé la valeur de l'élément string suivant le nom de ces valeures.

> //dict[not(key = "Play Count") and key = "Name"]/key[text()="Name"]/following-sibling::string[1]

8.

> //dict[key[text()="Year"]/following-sibling::integer[1] = min(//key[text()="Year"]/following-sibling::*[1])]/key[text()="Name"]/following-sibling::*[1]

**décomposition :**

Trouver l'année minimum:

> min(//key[text()="Year"]/following-sibling::integer[1])

Trouvé le plus petit élément year dont la valeur est min :

> key[text()="Year"]/following-sibling::integer[1] = min(..)

Renvoyer le nom ou les noms associé à cet(ces) élément(s) précédemment trouvé(s) :

> //dict[..]/key[text="Name"]/following-sibling::string[1]

**version plus courte**

Attention cette version n'est pas parfaite car s'il existe un autre entier égal à l'année minimum dans les (dict) et dont une clé "Name" existe elle renverra aussi le résultat. Cependant ici ça marche.

> //dict[integer = min(//key[text()="Year"]/following-sibling::*[1])]/key[text()="Name"]/following-sibling::*[1]

