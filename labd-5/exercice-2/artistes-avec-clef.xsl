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
			<xsl:attribute name="id" select="position()"/>
			<xsl:copy-of select= "./*"/>
		</artiste>
	</xsl:template>

</xsl:stylesheet>
