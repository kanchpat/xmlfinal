<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="2.0">

  <xsl:template match="/">
 <ul id='leftnav-list'>
      <xsl:for-each-group select="//department" group-by="@code">
        <xsl:sort select="dept_short_name"/>
        <li> 
          <a href="#" onclick="loadCourses('{current-grouping-key()}', 'true');"><p class="leftnav-heading"><xsl:value-of select="current-group()[1]/dept_short_name"/></p></a>
        </li>
    </xsl:for-each-group>
 </ul>
  </xsl:template>
  
  <xsl:template match="text()"/>
</xsl:stylesheet>