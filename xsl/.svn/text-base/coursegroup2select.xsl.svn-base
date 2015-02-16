<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="2.0">

  <xsl:template match="/">
  <div class="forminput"><label for="course_group">Course Group</label>:<br/>
    <select name="course_group" id="course_group">
	<option value="" >Any Course Group</option>
      <xsl:for-each-group select="//course_group" group-by="@code">
        <xsl:sort select="."/>
        <option value="{current-grouping-key()}">
          <xsl:value-of select="."/></option>
      </xsl:for-each-group>
    </select>
  </div>
  </xsl:template>
  
  <xsl:template match="text()"/>
</xsl:stylesheet>