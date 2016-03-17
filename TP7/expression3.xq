xquery version "1.0";
declare default element namespace "http://www.expression.org";
declare option saxon:output "omit-xml-declaration=yes";

(:Question 3:)

declare function local:eval-varrec($name, $var){

	if($name/name() = 'op' and count($var) > 0) then
		if ($name/@val = "/") then
			(local:eval-varrec($name/*[1], $var) idiv local:eval-varrec($name/*[2], $var))
			else ( if ($name/@val = "*") then
				(local:eval-varrec($name/*[1], $var) * local:eval-varrec($name/*[2], $var))
				else ( if ($name/@val = "-") then
					(local:eval-varrec($name/*[1], $var) - local:eval-varrec($name/*[2], $var))
					else ( if ($name/@val = "+") then
						(local:eval-varrec($name/*[1], $var) + local:eval-varrec($name/*[2], $var))
						else ()
					)
				)
			)

	else
		( 
		(: défintion de la valeur a renvoyer en fonction de si c'est une variable ou non :)
		if ($name/name() = 'var') then
			(: gestions des erreurs :)
			if (count($var//*[./name() = $name]) > 1) then
				error(xs:QName("ERROR"), "Déclaration multiple d'une même variable")
			else( 
				if (count($var//*[./name() = $name]) > 1) then
					error(xs:QName("ERROR"), "Pas de déclaration pour la variable", $name)
				else
					($var//*[./name() = $name])
			)
		else
			($name)
		
		)
};

declare function local:eval-var($name as xs:string, $var as xs:string) as xs:integer{
	xs:int(local:eval-varrec(doc($name)/expr/op, doc($var)))
};

local:eval-var("expression.xml","variables.xml")