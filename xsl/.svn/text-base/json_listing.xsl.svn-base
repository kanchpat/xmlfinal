<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="2.0">
    
    <xsl:template match="/">
    
        
        <xsl:text>{"courses":[</xsl:text>
        <xsl:for-each select="//course">
            { 
            "title":"<xsl:value-of select="title"/>",
            "course_group":"<xsl:value-of select="course_group"/>",
            "catalog_number":"<xsl:value-of select="catalog_number"/>", 
            "course_number":"<xsl:value-of select="course_number"/>",
            "term":"<xsl:value-of select="term"/>",
            "offered":"<xsl:value-of select="offered"/>",
            "course_type":"<xsl:value-of select="course_type"/>",
            "course_level":"<xsl:value-of select="course_level"/>"
            }<xsl:if test="position() != last()"><xsl:text>,</xsl:text></xsl:if>
        </xsl:for-each>
        <xsl:text>]}</xsl:text>
        <!--<xsl:apply-templates select="//course[($department = '' or $department = '*' or $department = department/@code) and
            ($cg = '' or $cg = '*' or $cg = course_group/@code) and
            ($offered = '' or $offered = '*' or $offered = @offered) and
            ($level='' or $level = '*' or $level = course_level/@code) and
            ($desc = '' or $desc = '*' or $desc = description) and
            ($term = '' or $term = '*' or $term = term/@term_pattern_code)]
            "/> -->
        
    
    </xsl:template>
    
    <!--<xsl:template match="course[($department = '' or $department = '*' or $department = department/@code) and
        ($cg = '' or $cg = '*' or $cg = course_group/@code) and
        ($offered = '' or $offered = '*' or $offered = @offered) and
        ($level='' or $level = '*' or $level = course_level/@code) and
        ($desc = '' or $desc = '*' or $desc = description) and
        ($term = '' or $term = '*' or $term = term/@term_pattern_code)]
        ">
        { 
        "title":"<xsl:value-of select="title"/>",
        "course_group":"<xsl:value-of select="course_group"/>",
        "catalog_number":"<xsl:value-of select="@cat_num"/>", 
        "course_number":"<xsl:value-of select="course_number/num_int"/>",
        "term":"<xsl:value-of select="term"/>",
        "offered":"<xsl:value-of select="@offered"/>",
        "course_type":"<xsl:value-of select="course_type"/>",
        "course_level":"<xsl:value-of select="course_level"/>"
        }<xsl:if test="position() != last()"><xsl:text>,</xsl:text></xsl:if>
    </xsl:template> -->       
        
</xsl:stylesheet>