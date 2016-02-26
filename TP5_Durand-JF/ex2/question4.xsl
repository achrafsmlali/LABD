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
			<xsl:copy-of select="//mouvements"/>
			<oeuvres>
				<xsl:apply-templates select="document('catalogue-1.xml')//oeuvre"/>
			</oeuvres>
		</art>		
	</xsl:template>

	<xsl:template match="artiste">
		<artiste>
			<xsl:attribute name="id" select="./@id"/>
			<xsl:copy-of select="./*"/>
		</artiste>
	</xsl:template>

	<xsl:template match="oeuvre">
		<oeuvre>
			<xsl:variable name="nom" select="./auteur/nom"/>
			<xsl:attribute name="auteur"  select="document('artistes-avec-clef.xml')//artiste[./nom = $nom]/@id" />
			<xsl:copy-of select="./titre"/>
			<xsl:copy-of select="./date"/>
		</oeuvre>
	</xsl:template>

</xsl:stylesheet>
