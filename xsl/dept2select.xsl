<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="2.0">

  <xsl:template match="/">
  <div class="forminput"><label for="department">Department</label>:<br/>
    <select name="department" id="department">
		<option value="" >Any Department</option>
      <xsl:for-each-group select="//department" group-by="@code">
        <xsl:sort select="dept_short_name"/>
        <option value="{current-grouping-key()}">
          <xsl:value-of select="current-group()[1]/dept_short_name"/></option>
      </xsl:for-each-group>
    </select>
  </div>
  </xsl:template>
  
  <xsl:template match="text()"/>
</xsl:stylesheet>