xquery version "1.0";
declare default element namespace "http://www.expression.org";
declare option saxon:output "omit-xml-declaration=yes";

declare function local:rec($name){
	if($name/name() = 'op') then
		concat('(', local:rec($name/*[1]),($name)/@val,local:rec($name/*[2]), ')')
	else
		($name)	

};

declare function local:print($name as xs:string) as xs:string{
	local:rec(doc($name)/expr/op)
};

local:print("expression.xml")