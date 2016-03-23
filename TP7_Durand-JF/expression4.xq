xquery version "1.0";
declare default element namespace "http://www.expression.org";
declare option saxon:output "omit-xml-declaration=yes";

(:Question 4:)
(: java -cp saxon9he.jar net.sf.saxon.Query expression4.xq :)

declare function local:simplifierec($name,$var){
	if($name/name() = 'op' and count($var) > 0) then
		if ($name/@val = "/") then
			(local:simplifierec($name/*[1], $var) idiv local:simplifierec($name/*[2], $var))
			else ( if ($name/@val = "*") then
				(local:simplifierec($name/*[1], $var) * local:simplifierec($name/*[2], $var))
				else ( if ($name/@val = "-") then
					(local:simplifierec($name/*[1], $var) - local:simplifierec($name/*[2], $var))
					else ( if ($name/@val = "+") then
						(local:simplifierec($name/*[1], $var) + local:simplifierec($name/*[2], $var))
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
				if (count($var//*[./name() = $name]) < 1) then
					(:constante pour les multiplications et divisions:)
					if($name/../@val='/' or $name/../@val='*') then
						1
					else
						(
							(:constante pour les additions et soustractions:)
							if($name/../@val='+' or $name/../@val='-') then
								0
							else
								()

						)
				else
					($var//*[./name() = $name])
			)
		else
			($name)
		
		)
};

declare function local:simplifie($name as xs:string, $var as xs:string) as element(){
	<expr xsi:schemaLocation="http://www.expression.org expression.xsd"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsmlns="http://www.expression.org">
	{
		xs:string(local:simplifierec(doc($name)/expr/op, doc($var)))
	}
	</expr>
};


local:simplifie("expression.xml","variables.xml")
