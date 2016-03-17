xquery version "1.0";
declare default element namespace "http://www.expression.org";
declare option saxon:output "omit-xml-declaration=yes";

(:Question 1:)

declare function local:printrec($name){
	if($name/name() = 'op') then
		concat('(', local:printrec($name/*[1]),($name)/@val,local:printrec($name/*[2]), ')')
	else
		($name)	

};

declare function local:print($name as xs:string) as xs:string{
	local:printrec(doc($name)/expr/op)
};

local:print("expression.xml")
