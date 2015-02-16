<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="2.0">
    
    <xsl:param name="department"/>
    <xsl:param name="cg"/>
    <xsl:param name="offered"/>
    <xsl:param name="level"/>
    <xsl:param name="desc"/>
    <xsl:param name="term"/>
    <xsl:param name="instructor"/>
    
    
        <xsl:template match="/">
            <fas_courses>
                   <xsl:for-each select="//course">
                       
                      
                       <xsl:if test="($department = '' or $department = '*' or $department = department/@code) and
                           ($cg = '' or $cg = '*' or $cg = course_group/@code) and
                           ($offered = '' or $offered = '*' or $offered = @offered) and
                           ($level='' or $level = '*' or $level = course_level/@code) and
                           ($desc = '' or $desc = '*' or $desc = description) and
                           ($term = '' or $term = '*' or $term = term/@term_pattern_code) and
                           ($instructor = '' or $instructor = '*' or $instructor = faculty_text)
                           ">
                            
                              <course>  
                                <catalog_number><xsl:value-of select="@cat_num"/></catalog_number> 
                                <course_group><xsl:value-of select="course_group"/></course_group>
                                <term><xsl:value-of select="term"/></term>
                                <offered><xsl:value-of select="@offered"/></offered>
                                <course_type><xsl:value-of select="course_type"/></course_type>
                                <course_level><xsl:value-of select="course_level"/></course_level>
                                <title><xsl:value-of select="title"/></title>
                                  <course_number><xsl:value-of select="course_number/num_int"/><xsl:value-of select="course_number/num_char"/></course_number>
                              </course>                             
                            
                            
                        </xsl:if>   
                    </xsl:for-each>
            </fas_courses>
        </xsl:template>
      
    <xsl:template match="text()"/> 
</xsl:stylesheet>