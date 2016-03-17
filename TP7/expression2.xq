xquery version "1.0";
declare default element namespace "http://www.expression.org";
declare option saxon:output "omit-xml-declaration=yes";

(:Question 2:)
(: java -cp saxon9he.jar net.sf.saxon.Query expression2.xq :)

declare function local:evalrec($name){
	if($name/name() = 'op') then
		if ($name/@val = "/") then
			(local:evalrec($name/*[1]) idiv local:evalrec($name/*[2]))
			else ( if ($name/@val = "*") then
				(local:evalrec($name/*[1]) * local:evalrec($name/*[2]))
				else ( if ($name/@val = "-") then
					(local:evalrec($name/*[1]) - local:evalrec($name/*[2]))
					else ( if ($name/@val = "+") then
						(local:evalrec($name/*[1]) + local:evalrec($name/*[2]))
						else ()
					)
				)
			)

	else
		($name)
};
	
declare function local:eval($name as xs:string) as xs:integer{
	xs:int(local:evalrec(doc($name)/expr/op))
};


local:eval("expression2.xml")