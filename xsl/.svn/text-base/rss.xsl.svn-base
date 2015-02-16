<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns="http://www.w3.org/1999/xhtml"
  version="2.0">
	<xsl:param name="wantdesc">
		<xsl:value-of select="'yes'" />
	</xsl:param>
   <xsl:output method="xml" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN"
          doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"
          indent="yes" />
  
  <xsl:template match="/">
    <html>
      <head>
        <link rel="stylesheet" href="css/rss2.css" type="text/css" media="all"/>
        <title>Harvard Course Catalog - News and Notices RSS Feed </title>
        
      </head>
      <body>
        
          <h1>Harvard Course Catalog RSS Feed</h1>
          <p>Latest News and Events from Harvard University</p>
        
        
       
       <xsl:for-each select="rss/channel/item">
         
         
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
          
        
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
