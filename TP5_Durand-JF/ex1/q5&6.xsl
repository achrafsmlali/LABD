<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="xml" indent="yes"/>


    <xsl:template match="/">
        <clubs>
            <xsl:apply-templates select="//club"/>
        </clubs>
    </xsl:template>


    <xsl:template match="club">
        <club>
            <xsl:attribute name="id">
                <xsl:value-of select="@id"/>
            </xsl:attribute>
            <nom><xsl:value-of select="nom"/></nom>
            <ville><xsl:value-of select="ville"/></ville>

            <rencontres>
                <domicile>
                    <xsl:apply-templates select="//rencontre" mode="domicile">
                        <xsl:with-param name="idC" select="@id"/>
                    </xsl:apply-templates>
                </domicile>
                <exterieur>
                    <xsl:apply-templates select="//rencontre" mode="exterieur">
                        <xsl:with-param name="idC" select="@id"/>
                    </xsl:apply-templates>
                </exterieur>

            </rencontres>
        </club>
    </xsl:template>

    <!--domicile-->
    <xsl:template match="rencontre" mode="domicile">
        <xsl:param name="idC"/>
        <xsl:if test="$idC = receveur/text()">
            <rencontre>
                <xsl:attribute name="num">
                    <xsl:value-of select="ancestor::journee/@num"/>
                </xsl:attribute>
                <club>
                    <xsl:apply-templates select="//club" mode="domicile">
                        <xsl:with-param name="idI" select="invite"/>
                    </xsl:apply-templates>
                </club>
                <score>
                    <xsl:value-of select="score"/>
                </score>
            </rencontre>
        </xsl:if>
    </xsl:template>

    <xsl:template match="club" mode="domicile">
        <xsl:param name="idI"/>
        <xsl:if test="$idI = @id">
            <xsl:value-of select="nom"/>
        </xsl:if>
    </xsl:template>

    <!-- exterieur -->
    <xsl:template match="rencontre" mode="exterieur">
        <xsl:param name="idC"/>
        <xsl:if test="$idC = invite/text()">
            <rencontre>
                <xsl:attribute name="num" mode="getAtt">
                    <xsl:value-of select="ancestor::journee/@num"/>
                </xsl:attribute>
                <club>
                    <xsl:apply-templates select="//club" mode="exterieur">
                        <xsl:with-param name="idR" select="receveur/text()"/>
                    </xsl:apply-templates>
                </club>
                <score>
                    <xsl:value-of select="score"/>
                </score>
            </rencontre>
        </xsl:if>
    </xsl:template>

    <xsl:template match="club" mode="exterieur">
        <xsl:param name="idR"/>
        <xsl:if test="$idR = @id">
            <xsl:value-of select="nom"/>
        </xsl:if>
    </xsl:template>

</xsl:stylesheet>
