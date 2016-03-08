xquery version "1.0";
declare option saxon:output "omit-xml-declaration=yes";
	
	<PRICE>
		{round-half-to-even(
			sum(
				for $p in doc("plant_order.xml")//PLANT
					return
				(xs:double(fn:data(substring(doc("plant_catalog.xml")//PRICE[../COMMON = $p/COMMON],2)))) * data($p/QUANTITY)
			)
		,1)
		}
	</PRICE>
