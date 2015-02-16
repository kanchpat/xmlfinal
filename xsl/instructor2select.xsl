<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="2.0">
    
    <xsl:template match="/">
        <div class="forminput"><label for="instructor">Instructor</label>:<br/>
            <select name="instructor" id="instructor">
                <option value="" >Any Instructor</option>
               <xsl:for-each-group select="//course" group-by="faculty_text">
                     <xsl:sort select="current-grouping-key()"/>
                              
                   <xsl:if test=" current-grouping-key() != '' and current-grouping-key() != '&gt;' and faculty_list/faculty/@id != '' ">
                       <option value="{current-grouping-key()}">     
                                        <xsl:value-of select="current-grouping-key()"/>
                        </option>    
                   </xsl:if>
                           
               </xsl:for-each-group>>
               
            </select>
        </div>
    </xsl:template>
    
    <xsl:template match="text()"/>
</xsl:stylesheet>