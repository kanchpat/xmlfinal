<?xml version="1.1" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    
    <xsl:param name="time"/>
    
    <xsl:template match="/">
        <html xmlns="http://www.w3.org/1999/xhtml">
            <head><link rel="stylesheet" href="css/search_styling.css" type="text/css" /></head>
        <body>
                <xsl:if test="count(//course) = 0">
                    <xsl:text>" Your search retrieved no items. Please change your search criteria " </xsl:text>
                </xsl:if>
            <div class="results_tag">Your Course Search Results <xsl:value-of select="count(//course)"></xsl:value-of> rows.</div>
            <table  xmlns="http://www.w3.org/1999/xhtml" cellpadding="20" width="100%" >
                
                
                <xsl:for-each select="//course">
                  
                  <xsl:choose>
                    <xsl:when test="last()>15000">
                        <xsl:if test="position()=15000">
                            <xsl:text>" Too many results to display. Please narrow our search. " </xsl:text>
                        </xsl:if>
                    </xsl:when>              
                        
                    <xsl:otherwise>
                       <xsl:if  test="position()=1">
                           <tr class="tableheaders" xmlns="http://www.w3.org/1999/xhtml">
                               <td>Catlog Number</td>
                               <td>Term</td>
                               <td>Department  <br/> Course Number</td>
                               <td>Title And Instructor</td>
                               <td>Day And <br/>Time</td>
                               <td>Location</td>
                               <td>Room</td>
                           </tr>   
                       </xsl:if>
                        <tr>
                              <xsl:choose>
                                  <xsl:when test="position() mod 2"> <xsl:attribute name="class"><xsl:value-of select="'evenrow'"></xsl:value-of></xsl:attribute></xsl:when>
                                  <xsl:otherwise> <xsl:attribute name="class"><xsl:value-of select="'oddrow'"></xsl:value-of></xsl:attribute></xsl:otherwise>
                              </xsl:choose>              
                            <td><xsl:value-of select="catalog_number"/></td>
                            <td><xsl:value-of select="term"/></td>
                            <td><xsl:value-of select="dept_short_name"/><xsl:value-of select="course_number"/></td>
                            <td><xsl:value-of select="title"/><br/><xsl:if test="faculty_text !=''"><div class="txtstyle">By: </div></xsl:if><xsl:value-of select="faculty_text"/></td>
                            <!-- <a href="web/courses/catalog_number.html?deptcode=&amp;groupcode=catalog_number"></a> -->
                            <xsl:choose>
                                <xsl:when test="$time='0'">
                                    <td><meeting_text><xsl:value-of select="meeting_text"/></meeting_text></td>
                                </xsl:when>
                                <xsl:otherwise>
                                    
                                    <!--<td> <xsl:if test="schedule/meeting/@begin_time !=''"><div class="txtstyle">Starts At: </div></xsl:if><xsl:value-of select="schedule/meeting/@begin_time"/> <xsl:if test="schedule/meeting/@end_time !=''"><div class="txtstyle">Ends At: </div></xsl:if> <xsl:value-of select="schedule/meeting/@end_time"/>  </td>-->
                                    <td><meeting_text><xsl:value-of select="meeting_text"/></meeting_text></td>  
                                </xsl:otherwise>
                            </xsl:choose>
                            <td><xsl:value-of select="meeting_locations/location/@building"/></td>
                            <td><xsl:value-of select="meeting_locations/location/@room"/></td>
                            
                        </tr>
                    </xsl:otherwise>
                    
                </xsl:choose>
                
                </xsl:for-each>
                </table>   
        </body>
        </html>
    </xsl:template>
</xsl:stylesheet>