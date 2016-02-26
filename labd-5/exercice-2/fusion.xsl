<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="2.0" 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns="http://labd/art"
	xpath-default-namespace="http://labd/art">
	
	<xsl:output method="xml" indent="yes"/>

	<xsl:template match="/">
		<art xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
			<artistes>
				<xsl:apply-templates select="//artiste"/>
			</artistes>
			<mouvements>
				<xsl:copy-of select="//mouvement"/>
			</mouvements>
		</art>
	</xsl:template>


	<xsl:template match="artiste">
		<artiste>
			<xsl:variable name="nom" select="./nom"/>
			<nom><xsl:value-of select="./nom"/></nom>
			<xsl:copy-of select="./période"/>
			<xsl:apply-templates select="document('catalogue-1.xml')//oeuvre[.//nom = $nom]"/>
		</artiste>
	</xsl:template>

	<xsl:template match="oeuvre">
		<oeuvre>
			<xsl:attribute name="genre" select="./@genre"/>
			<titre><xsl:value-of select="./titre"/></titre>
			<date><xsl:value-of select="./date"/></date>
		</oeuvre>
	</xsl:template>

</xsl:stylesheet>
