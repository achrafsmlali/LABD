# README TP3 - LABD

# Durand Jean-Frédéric

## Ex1

1.

```XML
<xsd:simpleType name="contrainteTemps">
	<xsd:attribute name="heure" type="xsd:positiveinteger">
		<xsd:minInclusive value ="2"/>
		<xsd:maxInclusive value ="16"/>
	</xsd:attribute>
	<xsd:attribute name="minutes" type="xsd:positiveinteger">
		<xsd:minInclusive value =""/>
		<xsd:maxInclusive value =""/>
	</xsd:attribute>
</xsd:simpleType>
```