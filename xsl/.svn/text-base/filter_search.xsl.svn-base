<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="2.0">
    
    <xsl:param name="department"/>
    <xsl:param name="cg"/>
    <xsl:param name="offered"/>
    <xsl:param name="level"/>
    <xsl:param name="desc"/>
    <xsl:param name="term"/>
    <xsl:param name="instructor"/>
    <xsl:param name="day"/>
    <xsl:param name="time"/>
    
    <xsl:template match="/">
        
        <xsl:choose>
            <xsl:when test="$time='0'">
                <xsl:call-template name="search"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="search_time"/>
            </xsl:otherwise>
        </xsl:choose> 
        
    </xsl:template>
    
    <xsl:template name="search">
      <fas_courses>
       <xsl:for-each select="//course">  
        <xsl:if test="($department = '' or $department = '*' or $department = department/@code) and
            ($cg = '' or $cg = '*' or $cg = course_group/@code) and
            ($offered = '' or $offered = '*' or $offered = @offered) and
            ($level='' or $level = '*' or $level = course_level/@code) and
            ($desc = '' or $desc = '*' or $desc = description) and
            ($term = '' or $term = '*' or $term = term/@term_pattern_code) and
            ($instructor = '' or $instructor = '*' or $instructor = faculty_text) and
            ($day = '' or $day = '*' or $day = schedule/meeting/@day) and
            ($time = '' or $time = '*' or $time = '0' )
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
                <dept_short_name><xsl:value-of select="department/dept_short_name"/></dept_short_name>
                <faculty_text><xsl:value-of select="faculty_text"/></faculty_text> 
                <credit><xsl:value-of select="credit"/></credit>
                <schedule><meeting><xsl:attribute name="begin_time"><xsl:value-of select="meeting_text"/></xsl:attribute></meeting></schedule>
                <schedule><meeting><xsl:attribute name="end_time"></xsl:attribute></meeting></schedule>                
                <meeting_text><xsl:value-of select="meeting_text"/></meeting_text>
                <meeting_locations><location><xsl:attribute name="building"><xsl:value-of select="meeting_locations/location/@building"/></xsl:attribute></location></meeting_locations>
                <meeting_locations><location><xsl:attribute name="room"><xsl:value-of select="meeting_locations/location/@room"/></xsl:attribute></location></meeting_locations>
            </course>                             
            
            
        </xsl:if>         
       </xsl:for-each>
      </fas_courses>   
    </xsl:template>    
    
    
    <xsl:template name="search_time">
        <fas_courses>            
            <xsl:for-each select="//course">
                <xsl:if test="$time='1'">
                    <xsl:variable name="stul" select="900"/>
                    <xsl:variable name="stll" select="1100"/>
                
                
                <xsl:if test="($department = '' or $department = '*' or $department = department/@code) and
                    ($cg = '' or $cg = '*' or $cg = course_group/@code) and
                    ($offered = '' or $offered = '*' or $offered = @offered) and
                    ($level='' or $level = '*' or $level = course_level/@code) and
                    ($desc = '' or $desc = '*' or $desc = description) and
                    ($term = '' or $term = '*' or $term = term/@term_pattern_code) and
                    ($instructor = '' or $instructor = '*' or $instructor = faculty_text) and
                    ($day = '' or $day = '*' or $day = schedule/meeting/@day) and
                    (schedule/meeting/@begin_time &gt;= $stul and schedule/meeting/@begin_time &lt;= $stll) 
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
                        <dept_short_name><xsl:value-of select="department/dept_short_name"/></dept_short_name>
                        <faculty_text><xsl:value-of select="faculty_text"/></faculty_text> 
                        <credit><xsl:value-of select="credit"/></credit>                     
                        <meeting_text><xsl:value-of select="meeting_text"/></meeting_text>
                        <xsl:for-each-group select="schedule/meeting" group-by="@begin_time">
                        <schedule><meeting><xsl:attribute name="begin_time"><xsl:value-of select="current-grouping-key()"/></xsl:attribute></meeting></schedule>
                        </xsl:for-each-group>
                        <xsl:for-each-group select="schedule/meeting" group-by="@end_time">
                        <schedule><meeting><xsl:attribute name="end_time"><xsl:value-of select="current-grouping-key()"/></xsl:attribute></meeting></schedule>
                        </xsl:for-each-group>
                        <meeting_locations><location><xsl:attribute name="building"><xsl:value-of select="meeting_locations/location/@building"/></xsl:attribute></location></meeting_locations>
                        <meeting_locations><location><xsl:attribute name="room"><xsl:value-of select="meeting_locations/location/@room"/></xsl:attribute></location></meeting_locations>
                    </course>     
                    
                </xsl:if>
                </xsl:if>     
            </xsl:for-each>
        </fas_courses>   
    </xsl:template>
    
    
</xsl:stylesheet>