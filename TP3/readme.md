# README TP3 - LABD

# Durand Jean-Frédéric

## Ex1

1.

```XML
<xsd:simpleType name="contrainteTemps">
	<xsd:restriction base="xsd:time">
		<xsd:minInclusive value ="02:30:00"/>
		<xsd:maxInclusive value ="16:50:00"/>
	</xsd:restriction>
</xsd:simpleType>
```

2.

```XML
<xsd:simpleType name="monReel">
	<xsd:restriction base="xsd:float">
		<xsd:minInclusive value="-3476.4"/>
		<xsd:maxExclusive value="5"/>
	</xsd:restriction>
</xsd:simpleType>
```

3.
```XML
<xsd:simpleType name="quatreCarac">
	<xsd:restriction base="xsd:string">
		<xsd:length value="4"/>
	</xsd:restriction>
</xsd:simpleType>
```

4.

```XML
<xsd:simpleType name="chaineImage">
	<xsd:restriction base="xsd:string">
		<xsd:pattern value="(jpg|gif|png)"/>
	</xsd:restriction>
</xsd:simpleType>
```

5.

```XML
<xsd:simpleType name="ISBN">
	<xsd:restriction base="xsd:positiveInteger">
		<xsd:totalDigits value="13"/>
	</xsd:restriction>
</xsd:simpleType>
```

## Ex2

Cf ex2.xsd

## Ex3

Cf expression.xsd

## Ex4

Cf championnat.xsd
