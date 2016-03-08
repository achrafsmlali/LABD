xquery version "1.0";
declare option saxon:output "omit-xml-declaration=yes";

<CATALOG>
	{
		for $c in doc("plant_catalog.xml")//PLANT return
		<PLANT>
			{$c/COMMON}
			{$c/BOTANICAL}
			{$c/ZONE}
			{$c/LIGHT}
			{$c/AVAILABILITY}
			<FAMILY>
				{data(doc("plant_families.xml")//SPECIES[.=$c/BOTANICAL]/../NAME)}
			</FAMILY>
		</PLANT>
	}


</CATALOG>