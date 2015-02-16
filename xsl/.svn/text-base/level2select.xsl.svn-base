<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="2.0">

  <xsl:template match="/">
  <div class="forminput"><label for="level">Level</label>:<br/>
    <select name="level" id="level">
	  <option value="" >Any Level</option>
      <xsl:for-each-group select="//course_level" group-by="@code">
        <xsl:sort select="index-of(('P', 'O', 'G', 'T'),@code)"/>

        <option value="{current-grouping-key()}">
          <xsl:value-of select="."/></option>
      </xsl:for-each-group>
    </select>
  </div>
  </xsl:template>
  
  <xsl:template match="text()"/>
</xsl:stylesheet>