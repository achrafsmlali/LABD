<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns="http://labd/art"
	xpath-default-namespace="http://labd/art">
	<xsl:output method="xml" indent="yes" encoding="UTF-8"/>

	<xsl:template match="/">
		<artistes>
			<xsl:apply-templates select="//artiste"/>
		</artistes>		
	</xsl:template>

	<xsl:template match="artiste">
		<artiste>
			<xsl:variable name="nom" select="./nom"/>
			<nom><xsl:value-of select="./nom"/></nom>
			<nbOeuvres>
				<xsl:value-of select="count(document('catalogue-1.xml')//oeuvre[.//nom = $nom])"/>
			</nbOeuvres>
		</artiste>
	</xsl:template>
</xsl:stylesheet>
