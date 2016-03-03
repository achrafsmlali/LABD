xquery version "1.0";
declare option saxon:output "omit-xml-declaration=yes";
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
				{
					for $f in doc("plant_families.xml")//FAMILY return
						if ($f/SPECIES = $c/BOTANICAL) then
							$f/NAME
						else
							"-"
				}
			</FAMILY>
		</PLANT>
	}


</CATALOG>