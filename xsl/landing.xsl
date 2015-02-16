<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">

  <xsl:include href="common.xsl"/>

  <xsl:template match="/*">

    <div class="yui-gc">
      <div class="yui-u first">


        <div class="center-block">
          <div class="vertical-center">

            <div class="basic">
              <a href="browse.html">BROWSE</a> | <a href="advanced_search.html">ADVANCED SEARCH</a> | <a href="web/images/landingpage.png">HELP</a>
            </div>
                      
          </div>
        </div>
                     
      
      </div>

      <div class="yui-u">

        <h3>
          <p>Latest News and Events from Harvard University</p>
        </h3>

        <div style="overflow : scroll;">
          <xsl:for-each select="//rss/channel/item">

            <xsl:if test="position() &lt; 10">
              <div class="item">

                <div class="rsstitle">
                  <a href="{link}" target="_blank" rel="bookmark">
                    <xsl:value-of select="title"/>
                  </a>
                </div>
                <div class="rssdescription">
                  <xsl:value-of select="pubDate"/>
                </div>
                <br/>
                <!--            <xsl:value-of select="category"/><br/>-->
                <div class="rssdescription">
                  <xsl:value-of select="description"/>
                </div>


              </div>
            </xsl:if>

          </xsl:for-each>
        </div>

      </div>
    </div>

  </xsl:template>

  <xsl:template match="text()"/>
</xsl:stylesheet>
