xquery version "1.0";
declare option saxon:output "omit-xml-declaration=yes";
declare variable $f := "plant_families.xml";
<CATALOG>
	{ for $c in distinct-values( //LIGHT)
			return 
	<LIGHT>
		<EXPOSURE>{fn:data($c)}</EXPOSURE>
		{for $p in //PLANT
		where $p/LIGHT = $c
		return
		<PLANT>
			{$p/COMMON}
			{$p/BOTANICAL}
			{$p/ZONE}
			{$p/PRICE}
			{$p/AVAILABILITY}
			<FAMILY>{fn:data(doc($f)//SPECIES[.=$c/BOTANICAL]/../NAME)}</FAMILY>
		</PLANT>
		}
		
	</LIGHT>
			
		}
</CATALOG>	