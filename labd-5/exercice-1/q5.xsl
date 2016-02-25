<?xml version='1.0' encoding='UTF-8'?>
<xsl:stylesheet version="2.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns="http://www.w3.org/1999/xhtml"
    >
    <xsl:output method="xml" indent="yes" encoding="UTF-8"
    omit-xml-declaration="no"/>

	<xsl:template match="/">
		<clubs xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
			<xsl:apply-templates select="//club"/>
		</clubs>
	</xsl:template>

	<xsl:template match="club">
		<xsl:copy-of select="nom"/>
		<xsl:copy-of select="ville"/>
		<rencontres>
			<domicile>
				<xsl:apply-templates select="//rencontres" mode="domicile">
					<xsl:with-param name="id" select="@id"/>
				</xsl:apply-templates>
			</domicile>
			<exterieur>
				<xsl:apply-templates select="//rencontres" mode="domicile">
					<xsl:with-param name="id" select="@id"/>
				</xsl:apply-templates>
			</exterieur>
		</rencontres>
	</xsl:template>


	<xsl:template match="rencontre" mode ="domicile">
		<xsl:param name="id"/>
		<xsl:if test="$id= receveur/text()">
			<rencontre>
				<!-- ajout de l'attribut numéro de la journée -->
				<xsl:attribute name="num">
					<xsl:apply-templates select="//club" mode="getAtt">
						<xsl:with-param name="idI" select="invite"/>
						<xsl:with-param name="idR" select="receveur"/>
					</xsl:apply-templates>
				</xsl:attribute>
			</rencontre>
		</xsl:if>
	</xsl:template>

</xsl:stylesheet>