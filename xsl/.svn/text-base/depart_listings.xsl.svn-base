<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="2.0">
    
    
    <xsl:template match="/">
        <departments>
            
            <xsl:for-each-group select="//department" group-by="@code">
              
                <xsl:sort select="dept_short_name"/>
                <department>  
                   <xsl:attribute name="code"><xsl:value-of select="current-grouping-key()"/></xsl:attribute>
                    <xsl:attribute name="name"><xsl:value-of select="current-group()[1]/dept_short_name"/></xsl:attribute>
                   <!-- <xsl:attribute name="name"><xsl:value-of select="current-group()[1]/dept_short_name"/></xsl:attribute>
                    <xsl:attribute name="code"><xsl:value-of select="current-grouping-key()"/></xsl:attribute>-->                    
                </department>    
            </xsl:for-each-group>
            
        </departments>
    </xsl:template>
    
    <xsl:template match="text()"/>
</xsl:stylesheet>