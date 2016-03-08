xquery version "1.0";
declare option saxon:output "omit-xml-declaration=yes";

<CATALOG>
	{ for $m in distinct-values(doc("exposure.xml")//LIGHT)
		order by $m ascending return 
	<LIGHT>
		<EXPOSURE>
			{data($m)}
		</EXPOSURE>
		{for $p in doc("plant_catalog.xml")//PLANT
		where $p/LIGHT = $m
		order by $p/COMMON ascending
		return
		<PLANT>
			{$p/COMMON}
			{$p/BOTANICAL}
			{$p/ZONE}
			{$p/PRICE}
			{$p/AVAILABILITY}
			<FAMILY>
				{data(doc("plant_families.xml")//SPECIES[.=$p/BOTANICAL]/../NAME)}
			</FAMILY>
		</PLANT>
		}
	</LIGHT>		
	}
</CATALOG>