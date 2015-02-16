<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="2.0" xmlns:xi="http://www.w3.org/2001/XInclude">

  <xsl:include href="common.xsl"/>
  

  <xsl:template match="/*">
   
    <div id="yui-gc">
      <div class="yui-u first">

        <div style="width: 65%; float: left; margin-left: 10px;">
          <form action=" " onsubmit="getCourseList(); return false;">
            <div>
              <xi:include href="cocoon:/dept2select.html"/>
              <xi:include href="cocoon:/coursegroup2select.html"/>
              
              <xi:include href="cocoon:/term2select.html"/>
              <xi:include href="cocoon:/level2select.html"/>
              <xi:include href="cocoon:/instructor2select.html"/>
              <xi:include href="cocoon:/days2select.html"/>
              <xi:include href="cocoon:/time2select.html"/>
              <div class="forminput"><input type="checkbox" checked="checked" id="offered" name="offered" value="Y"/>
                <label for="offered">Show only offered courses</label>
              </div>        
              <div class="forminput"><input type="button" id="submit" name="submit" onclick="getCourseList()"
                value="Search"/>
              </div>
            </div>
            <div class="headers">Course Search and Location Results:</div>
            <div id="courselist">
              Course Listings will be displayed here.
            </div>
          </form>
        </div>

      </div>
    
    <div class="yui-u">
     
      <p>Latest News and Events from Harvard University</p>
      
      
      
      <xsl:for-each select="//rss/channel/item">
        
        
        <ul>
          <xsl:if test="position() &lt; 6">
            <li><a href="{link}" rel="bookmark"><xsl:value-of select="title"/></a></li>
            <xsl:value-of select="pubDate"/>
            <br/>
            <xsl:value-of select="category"/><br/>
            <xsl:value-of select="description"/>
          </xsl:if>
        </ul>   
      </xsl:for-each>
      
    </div>
    </div>
    
  </xsl:template>
  
  <xsl:template match="text()"/>
</xsl:stylesheet>