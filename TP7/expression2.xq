xquery version "1.0";
declare default element namespace "http://www.expression.org";
declare option saxon:output "omit-xml-declaration=yes";

(:Question 2:)

declare function local:evalrec($name){
	if($name/name() = 'op') then
		if ($name/@val = "/") then
			xs:integer(local:evalrec($name/*[1]) div local:evalrec($name/*[2]))
			else ( if ($name/@val = "*") then
				xs:integer(local:evalrec($name/*[1]) * local:evalrec($name/*[2]))
				else ( if ($name/@val = "-") then
					xs:integer(local:evalrec($name/*[1]) - local:evalrec($name/*[2]))
					else ( if ($name/@val = "+") then
						xs:integer(local:evalrec($name/*[1]) + local:evalrec($name/*[2]))
						else ()
					)
				)
			)

	else
		($name)
};
	
declare function local:eval($name as xs:string) as xs:integer{
	local:evalrec(doc($name)/expr/op)
};


local:eval("expression2.xml")