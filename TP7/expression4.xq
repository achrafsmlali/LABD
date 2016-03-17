xquery version "1.0";
declare default element namespace "http://www.expression.org";
declare option saxon:output "omit-xml-declaration=yes";

(:Question 4:)
(: java -cp saxon9he.jar net.sf.saxon.Query expression4.xq :)

declare function local:simplifie($name as xs:string, $var as xs:string) as element(){

}