xquery version "1.0";
declare option saxon:output "omit-xml-declaration=yes";
declare variable $f := "plant_families.xml";
<CATALOG>
	{
		for $c in doc("plant_catalog.xml")//PLANT return
		<PLANT>
			<COMMON>{$c/COMMON}</COMMON>
			<BOTANICAL>{$c/BOTANICAL}</BOTANICAL>
			<ZONE>{$c/ZONE}</ZONE>
			<LIGHT>{$c/LIGHT}</LIGHT>
			<AVAILABILITY>{$c/AVAILABILITY}</AVAILABILITY>
			<FAMILY>
				{fn:data(doc($f)//SPECIES[.=$c/BOTANICAL]/../NAME)}
			</FAMILY>
		</PLANT>
	}


</CATALOG>