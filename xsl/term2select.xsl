<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="2.0">
  <xsl:template match="/">
  <div class="forminput"><label for="level">Term</label>:<br/>
    <select name="term" id="term">
	  <option value="" >Any Term Pattern</option>
      <xsl:for-each-group select="//term" group-by="@term_pattern_code">
        <xsl:sort select="@term_pattern_code" data-type="number"/>
        <option value="{current-grouping-key()}">
          <xsl:value-of select="."/></option>
      </xsl:for-each-group>
    </select>
  </div>
  </xsl:template>
  
  <xsl:template match="text()"/>
</xsl:stylesheet>