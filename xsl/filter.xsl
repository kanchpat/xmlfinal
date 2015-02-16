<?xml version="1.1" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:param name="department"/>
    <xsl:param name="cg"/>
    <xsl:param name="offered"/>
    <xsl:param name="level"/>
    <xsl:param name="desc"/>
    <xsl:param name="term"/>
    <xsl:variable name="flag">true</xsl:variable> 
   
    <xsl:template match="/">
        <html xmlns="http://www.w3.org/1999/xhtml">
        <body>
            <ul>
                <xsl:if test="count(//course[($department = '' or $department = '*' or $department = department/@code) and
                    ($cg = '' or $cg = '*' or $cg = course_group/@code) and
                    ($offered = '' or $offered = '*' or $offered = @offered) and
                    ($level='' or $level = '*' or $level = course_level/@code) and
                    ($desc = '' or $desc = '*' or $desc = description) and
                    ($term = '' or $term = '*' or $term = term/@term_pattern_code)]) = 0">
                    
                    <xsl:text>" No results returned. Please broaden our search. " </xsl:text>  
                
                </xsl:if>
                <xsl:apply-templates select="//course[($department = '' or $department = '*' or $department = department/@code) and
                    ($cg = '' or $cg = '*' or $cg = course_group/@code) and
                    ($offered = '' or $offered = '*' or $offered = @offered) and
                    ($level='' or $level = '*' or $level = course_level/@code) and
                    ($desc = '' or $desc = '*' or $desc = description) and
                    ($term = '' or $term = '*' or $term = term/@term_pattern_code)]
                    "/>
            </ul>
        </body>
        </html>
    </xsl:template>
    
    <xsl:template match="course[($department = '' or $department = '*' or $department = department/@code) and
        ($cg = '' or $cg = '*' or $cg = course_group/@code) and
        ($offered = '' or $offered = '*' or $offered = @offered) and
        ($level='' or $level = '*' or $level = course_level/@code) and
        ($desc = '' or $desc = '*' or $desc = description) and
        ($term = '' or $term = '*' or $term = term/@term_pattern_code)]
        ">
        
        <xsl:if test="position()=0">
            
        </xsl:if>
            <xsl:choose>
                <xsl:when test="last()>500">
                    <xsl:if test="position()=500">
                         <xsl:text>" Too many results to display. Please narrow our search. " </xsl:text>
                    </xsl:if>
                </xsl:when>
                <xsl:otherwise>
                   <li>                  
                    <xsl:value-of select="department/dept_short_name"/><xsl:value-of select="course_number/num_int"/><xsl:value-of select="course_number/num_char"/><xsl:text>.</xsl:text><xsl:value-of select="title"/> <br/>
                    <xsl:text>Catlog Number :</xsl:text> <xsl:value-of select="@cat_num"/> <br/>
                    <xsl:value-of select="faculty_text"/> <br/>
                    <xsl:value-of select="credit"/> <xsl:value-of select="meeting_text"/>
                  </li>        
                </xsl:otherwise>
            </xsl:choose>
            
    </xsl:template>    
          
</xsl:stylesheet>