<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:fo="http://www.w3.org/1999/XSL/Format"
  xmlns:fn="http://www.w3.org/2005/xpath-functions"
  xmlns="http://www.w3.org/1999/xhtml" version="2.0">

  <!-- request parameters width default value -->
  <xsl:param name="pdepCode" /> 
  <xsl:param name="pdepName" />
  <xsl:param name="pdepLName" />
  <xsl:param name="grpColumn" select="'1'" />
  <xsl:param name="pGroupOnMore"  />
  <xsl:output method="xml"/>
  
  <!-- Define diffrent attribute sets -->
  <xsl:attribute-set name="depTitle">
    <xsl:attribute name="font-family">Times, serif</xsl:attribute>    
    <xsl:attribute name="font-size">14pt</xsl:attribute>   
    <xsl:attribute name="font-weight">bold</xsl:attribute>
    <xsl:attribute name="text-align">center</xsl:attribute>
    <xsl:attribute name="padding">1em</xsl:attribute> 
  </xsl:attribute-set>
  <xsl:attribute-set name="depToc">
    <xsl:attribute name="font-family">Times, serif</xsl:attribute>
    <xsl:attribute name="font-size">11pt</xsl:attribute>
  </xsl:attribute-set>
  <xsl:attribute-set name="normal">
    <xsl:attribute name="font-family">Times, serif</xsl:attribute>
    <xsl:attribute name="font-size">8pt</xsl:attribute>
  </xsl:attribute-set>
  <xsl:attribute-set name="txtIndent">
    <xsl:attribute name="space-before">3pt</xsl:attribute>
    <xsl:attribute name="space-after">3pt</xsl:attribute>
    <xsl:attribute name="start-indent">1cm</xsl:attribute>
  </xsl:attribute-set>
  <xsl:attribute-set name="txtIndentLast">
    <xsl:attribute name="space-before">3pt</xsl:attribute>
    <xsl:attribute name="space-after">10pt</xsl:attribute>
    <xsl:attribute name="start-indent">1cm</xsl:attribute>
  </xsl:attribute-set>
  <doc xmlns="http://www.oxygenxml.com/ns/doc/xsl">
    <desc></desc>
  </doc> 
  <!-- key to use for TOC -->
 <xsl:key name="course-group" match="course" use="@cat_num" />  
 <xsl:key name="course-detail" match="course" use="concat(@cat_num,title)" />
  <xsl:key name="course-key-more" match="course" use="concat(string(course_number/num_int),course_number/num_char)" />
  <!-- updated
    <xsl:key name="course-group" match="course" use="concat(string(course_number/num_int),course_number/num_char)" />
    end updated -->
  <xsl:key name="course-nbr" match="course" use="course_number/num_int" />
  
  <xsl:template match="/">
    <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
      
      <fo:layout-master-set>
        <!-- fo:layout-master-set defines in its children the page layout: 
             the pagination and layout specifications
             - page-masters: have the role of describing the intended subdivisions 
             of a page and the geometry of these subdivisions 
             In this case there is only a simple-page-master which defines the 
             layout for all pages of the text
             -->
        <!-- layout information -->
        <fo:simple-page-master master-name="simple"
          page-height="11in" 
          page-width="8.5in"
          margin-top="1.0in" 
          margin-bottom="1.0in" 
          margin-left="1.25in" 
          margin-right="1.25in">
          <fo:region-body margin-top="0.25in"/>
          <fo:region-before extent="0.5in"/>
        </fo:simple-page-master>
      </fo:layout-master-set>
      <!-- end: defines page layout -->
      
      
      <!-- end: defines page layout -->
      
      <!-- start page-sequence
           here comes the text (contained in flow objects)
           the page-sequence can contain different fo:flows 
           the attribute value of master-name refers to the page layout
           which is to be used to layout the text contained in this
           page-sequence-->
      <fo:page-sequence master-reference="simple">
        <!-- Page Header -->
        <!-- fo:static-content for header -->
        <fo:static-content flow-name="xsl-region-before">
          <fo:block font-size="8pt" text-align="end">
            <xsl:value-of select="$pdepName"/><xsl:text> , </xsl:text> Page
            <fo:page-number/>
            <xsl:text> of </xsl:text>
            <fo:page-number-citation ref-id="theEnd"/>
           </fo:block>
         </fo:static-content> 
        
        <!-- start fo:flow
             each flow is targeted 
             at one (and only one) of the following:
             xsl-region-body (usually: normal text)
             xsl-region-before (usually: header)
             xsl-region-after  (usually: footer)
             xsl-region-start  (usually: left margin) 
             xsl-region-end    (usually: right margin)
             ['usually' applies here to languages with left-right and top-down 
             writing direction like English]
             in this case there is only one target: xsl-region-body
             -->
        <fo:flow flow-name="xsl-region-body">
          
          <!-- each paragraph is encapsulated in a block element
               the attributes of the block define
               font-family and size, line-heigth etc. -->
          
          <!-- this defines a title -->
          <fo:block xsl:use-attribute-sets="depTitle">
            <xsl:value-of select="$pdepLName" />
          </fo:block>
          <!-- nm Departments TOC -->
          <fo:block xsl:use-attribute-sets="depToc">
            <xsl:apply-templates select="/fas_courses" mode="toc" />
          </fo:block>
          <!-- main departmentns nm -->
          <fo:block>
            <xsl:apply-templates select="/fas_courses" mode="main" />
          </fo:block>
          <!-- nm Last block for pagenumber ending -->
          <fo:block id="theEnd">
          </fo:block>
          <!-- generate table of contents -->
       
        </fo:flow> <!-- closes the flow element-->
      </fo:page-sequence> <!-- closes the page-sequence -->
    </fo:root>
  </xsl:template>
    
    <xsl:template match="fas_courses" mode="toc">
     <xsl:for-each-group select="course" group-by="department/@code">  
      <xsl:if test=" current-grouping-key() eq $pdepCode " >        
         <!-- Second level grouping by Course Group -->
          <xsl:for-each-group select="current-group()[generate-id() = generate-id (key('course-group',@cat_num)[1])]" group-by="course_group/text()">
              <xsl:sort select="course_group/text()" />                       
               <fo:block text-align-last="justify" font-size="12pt" font-weight="bold">
               <fo:basic-link>
                 <xsl:attribute name="internal-destination">
                   <xsl:value-of select="generate-id()" /> 
                 </xsl:attribute>
                        <xsl:value-of select="course_group/text()" />                     
                   <fo:leader leader-pattern="dots"/>
                   <fo:page-number-citation>
                     <xsl:attribute name="ref-id">
                        <xsl:value-of select="generate-id()"/>
                     </xsl:attribute>
                      </fo:page-number-citation> 
                       <!--</fo:block>  -->
                    </fo:basic-link>
               </fo:block>    
                   
            <xsl:choose>
              <xsl:when test="$pGroupOnMore = '1'">
                <xsl:call-template name="crsTOCDetails" />
              </xsl:when>
              <xsl:when test="$pGroupOnMore = '2'">
                <xsl:for-each-group select="current-group()[generate-id() = generate-id (key('course-key-more',concat(string(course_number/num_int),course_number/num_char))[1])]" group-by="term/@term_pattern_code">
                  <xsl:sort select="term/@term_pattern_code" />                   
                  <fo:block text-align-last="justify" font-size="10pt" font-weight="bold" margin-left="4pt">
                    <fo:basic-link>
                      <xsl:attribute name="internal-destination">
                         <xsl:value-of select="generate-id()" />                         
                      </xsl:attribute>   
                     <!-- Translate Term Values to Text -->
                             <xsl:choose>
                        <xsl:when test="term/@term_pattern_code = '1'">  
                            <xsl:text>Fall Term</xsl:text> 
                         </xsl:when>
                        <xsl:when test="term/@term_pattern_code = '2'">
                          <xsl:text>Spring Term</xsl:text>
                        </xsl:when>
                        <xsl:when test="term/@term_pattern_code = '3'">
                          <xsl:text>Fall Term and Repeated Spring Term </xsl:text>
                        </xsl:when>
                        <xsl:when test="term/@term_pattern_code = '4'">
                          <xsl:text>Full Year</xsl:text>
                        </xsl:when>
                      </xsl:choose>                                           
                      <fo:leader leader-pattern="dots"/>
                      <fo:page-number-citation>
                        <xsl:attribute name="ref-id">
                          <xsl:value-of select="generate-id()"/>
                        </xsl:attribute>
                      </fo:page-number-citation>                        
                     </fo:basic-link>
                  </fo:block>                 
                  <xsl:call-template name="crsTOCDetails" />
                </xsl:for-each-group>  
              </xsl:when>
              <xsl:when test="$pGroupOnMore = '3'">
                <xsl:for-each-group select="current-group()[generate-id() = generate-id (key('course-key-more',concat(string(course_number/num_int),course_number/num_char))[1])]" 
                  group-by="meeting_text">
                  <xsl:sort select="meeting_text" /> 
                  <fo:block text-align-last="justify" font-size="10pt" font-weight="bold" margin-left="4pt">
                    <fo:basic-link>
                      <xsl:attribute name="internal-destination">
                        <xsl:value-of select="generate-id()" /> 
                      </xsl:attribute>   
                       <xsl:value-of select="meeting_text" />            
                      
                      <fo:leader leader-pattern="dots"/>
                      <fo:page-number-citation>
                        <xsl:attribute name="ref-id">
                          <xsl:value-of select="generate-id()"/>
                        </xsl:attribute>
                      </fo:page-number-citation> 
                      <!--</fo:block>  -->
                    </fo:basic-link>
                  </fo:block>  
                  <xsl:call-template name="crsTOCDetails" />
                </xsl:for-each-group>  
              </xsl:when>
              <!-- Group by instructor -->
              <xsl:when test="$pGroupOnMore = '4'">
                <xsl:for-each-group select="current-group()[generate-id() = generate-id (key('course-key-more',concat(string(course_number/num_int),course_number/num_char))[1])]" 
                  group-by="faculty_text ">
                  <xsl:sort select="faculty_text " /> 
                  <fo:block text-align-last="justify" font-size="10pt" font-weight="bold" margin-left="4pt">
                    <fo:basic-link>
                      <xsl:attribute name="internal-destination">
                        <xsl:value-of select="generate-id()" /> 
                      </xsl:attribute>   
                      
                        <xsl:value-of select="faculty_text" />
                       
                      
                      <fo:leader leader-pattern="dots"/>
                      <fo:page-number-citation>
                        <xsl:attribute name="ref-id">
                          <xsl:value-of select="generate-id()"/>
                        </xsl:attribute>
                      </fo:page-number-citation> 
                    
                    </fo:basic-link>
                  </fo:block>  
                  <xsl:call-template name="crsTOCDetails" />
                </xsl:for-each-group>  
              </xsl:when>
              
              </xsl:choose> 
          
             <!-- </xsl:for-each-group> -->
            </xsl:for-each-group>
           
        </xsl:if> 
     </xsl:for-each-group>
    </xsl:template>
  
  <xsl:template match="fas_courses" mode="main">
    <xsl:for-each-group select="course" group-by="department/@code">
      <xsl:if test=" current-grouping-key() eq $pdepCode " >       
        <xsl:for-each-group select="current-group()[generate-id() = generate-id (key('course-group',@cat_num)[1])]" group-by="course_group/text()">         
          
         <xsl:sort select="course_group/text()" />
          <xsl:choose>
           <xsl:when test="$pGroupOnMore = '1'" >
             <!-- use attribute sets -->
             <fo:block id="{generate-id()}" 
               break-before="page"                    
               >
              <xsl:value-of select="current-grouping-key()"/>   
             </fo:block>     
               <xsl:call-template name="crsMainDetails" />
           </xsl:when>
            <xsl:when test="$pGroupOnMore = '2'">           
              <fo:block  break-before="page">               
                <xsl:value-of select="current-grouping-key()" />                 
                <xsl:for-each-group select="current-group()[generate-id() = generate-id (key('course-key-more',concat(string(course_number/num_int),course_number/num_char))[1])]" group-by="term/@term_pattern_code">
                <xsl:sort select="term/@term_pattern_code" />
                 <xsl:if test="( (position() = 1) ) "> <!-- or (position() = 2) or (position() = 3)  )" > -->
                  <fo:block   font-size="9pt"
                    font-weight="bold"  > 
                    <xsl:choose>
                      <xsl:when test="term/@term_pattern_code = '1'">  
                        <xsl:text>Fall Term</xsl:text> 
                      </xsl:when>
                      <xsl:when test="term/@term_pattern_code = '2'">
                        <xsl:text>Spring Term</xsl:text>
                      </xsl:when>
                      <xsl:when test="term/@term_pattern_code = '3'">
                        <xsl:text>Fall Term and Repeated Spring Term </xsl:text>
                      </xsl:when>
                      <xsl:when test="term/@term_pattern_code = '4'">
                        <xsl:text>Full Year</xsl:text>
                      </xsl:when>
                    </xsl:choose>   
                  </fo:block>
                </xsl:if>
                <xsl:if test="( (position() &gt; 1 ) )"> <!-- 3)   ) " > -->
                  <fo:block  id="{generate-id()}" font-size="9pt"
                    font-weight="bold"  > 
                    <xsl:choose>
                      <xsl:when test="term/@term_pattern_code = '1'">  
                        <xsl:text>Fall Term</xsl:text> 
                      </xsl:when>
                      <xsl:when test="term/@term_pattern_code = '2'">
                        <xsl:text>Spring Term</xsl:text>
                      </xsl:when>
                      <xsl:when test="term/@term_pattern_code = '3'">
                        <xsl:text>Fall Term and Repeated Spring Term </xsl:text>
                      </xsl:when>
                      <xsl:when test="term/@term_pattern_code = '4'">
                        <xsl:text>Full Year</xsl:text>
                      </xsl:when>
                    </xsl:choose>   
                  </fo:block> 
               </xsl:if>   
               <xsl:call-template name="crsMainDetails" />
                </xsl:for-each-group>
               </fo:block> 
            </xsl:when>
            <xsl:when test="$pGroupOnMore = '3'">
              <xsl:for-each-group select="current-group()[generate-id() = generate-id (key('course-key-more',concat(string(course_number/num_int),course_number/num_char))[1])]" 
                group-by="meeting_text">
                <xsl:sort select="meeting_text" />
                <xsl:if test="( (position() = 1) ) "> <!-- or (position() = 2) or (position() = 3)  )" > -->
                  <fo:block     font-size="9pt"
                    font-weight="bold"  > 
                    <xsl:value-of select="current-grouping-key()" />
                  </fo:block>
                </xsl:if>
                <xsl:if test="( (position() &gt; 1) ) "> <!-- or (position() = 2) or (position() = 3)  )" > -->
                  <fo:block    id="{generate-id()}" font-size="9pt"
                    font-weight="bold"  > 
                    <xsl:value-of select="current-grouping-key()" />
                  </fo:block>
                </xsl:if>
                
                <xsl:call-template name="crsMainDetails" />
              </xsl:for-each-group>
            </xsl:when>
            <xsl:when test="$pGroupOnMore = '4'">
              <xsl:for-each-group select="current-group()[generate-id() = generate-id (key('course-key-more',concat(string(course_number/num_int),course_number/num_char))[1])]" 
                group-by="faculty_text">
                <xsl:sort select="faculty_text" />
                <xsl:if test="( (position() = 1) ) "> 
                  <fo:block    font-size="9pt"
                  font-weight="bold"  > 
                    <xsl:value-of select="faculty_text" />
                  </fo:block>   
                  </xsl:if> 
                  <xsl:if test="position() = 1 or position() =2 or position() = 3" >
                  <fo:block   font-size="9pt"
                  font-weight="bold"  > 
                  </fo:block>  
                  </xsl:if>   --> 
                <xsl:call-template name="crsMainDetails" />
              </xsl:for-each-group>
            </xsl:when>
            </xsl:choose>
       
          
        </xsl:for-each-group>
      </xsl:if> 
    </xsl:for-each-group>
  </xsl:template>
  
  <xsl:template name="crsTOCDetails">
    <xsl:for-each-group 
      select="current-group()[generate-id() = generate-id (key('course-detail',concat(@cat_num,title))[1])]"
      group-by="title">            
      <xsl:sort select="@title" /> 
      <fo:block text-align-last="justify" font-size="9pt" margin-left="8pt">
        <fo:basic-link>
          <xsl:attribute name="internal-destination">
            <xsl:value-of select="generate-id()" /> 
          </xsl:attribute>
           <xsl:value-of select="title" />                  
          <fo:leader leader-pattern="dots"/>
          <fo:page-number-citation>
            <xsl:attribute name="ref-id">
              <xsl:value-of select="generate-id()"/>
            </xsl:attribute>
          </fo:page-number-citation> 
        </fo:basic-link>                  
      </fo:block>     
    </xsl:for-each-group>       
  </xsl:template>
  
<xsl:template name="crsMainDetails">
  <xsl:for-each-group 
    select="current-group()[generate-id() = generate-id (key('course-detail',concat(@cat_num,title))[1])]" group-by="title">            
    <xsl:sort select="@title" />
    
    <!-- Print Course Details -->
   
    <xsl:if test="( (position() &gt; 1)  and ($pGroupOnMore = '1')) " >
      <fo:block  id="{generate-id()}"  font-size="9pt"
        font-weight="bold"  >              
        <xsl:value-of select="./title"/>
        <xsl:value-of select="./course_group" /> 
        <xsl:text>  </xsl:text>
        <xsl:value-of select="concat(./course_number/num_int/text(),./course_number/num_char/text())" />
        <xsl:text> . </xsl:text>
        <xsl:value-of select="concat('  ',./title)" /> 
      </fo:block>
    </xsl:if>
    <xsl:if test="((position() = 1)  and ($pGroupOnMore = '1') )" >
      <fo:block    font-size="9pt"
        font-weight="bold"  >               
        
        <xsl:value-of select="./title"/>
        <xsl:value-of select="./course_group" /> 
        <xsl:text>  </xsl:text>
        <xsl:value-of select="concat(./course_number/num_int/text(),./course_number/num_char/text())" />
        <xsl:text> . </xsl:text>
        <xsl:value-of select="concat('  ',./title)" /> 
      </fo:block>
    </xsl:if>
    <xsl:if test="(( ( position() = 1) ) and ($pGroupOnMore != '1') )" >
      <fo:block     font-size="9pt"
        font-weight="bold"  >   
        <xsl:value-of select="./title"/>
        <xsl:value-of select="./course_group" /> 
        <xsl:text>  </xsl:text>
        <xsl:value-of select="concat(./course_number/num_int/text(),./course_number/num_char/text())" />
        <xsl:text> . </xsl:text>
        <xsl:value-of select="concat('  ',./title)" /> 
      </fo:block>
    </xsl:if>
    <xsl:if test="( (position() &gt; 1)  and ($pGroupOnMore != '1')) " >
      <fo:block  id="{generate-id()}"  font-size="9pt"
        font-weight="bold"  >              
        <xsl:value-of select="./title"/>
        <xsl:value-of select="./course_group" /> 
        <xsl:text>  </xsl:text>
        <xsl:value-of select="concat(./course_number/num_int/text(),./course_number/num_char/text())" />
        <xsl:text> . </xsl:text>
        <xsl:value-of select="concat('  ',./title)" /> 
      </fo:block>
    </xsl:if>
    <fo:block xsl:use-attribute-sets="normal">
      Catalog Number: <xsl:value-of select="./@cat_num" />
    </fo:block>
    <fo:block font-size="8pt" font-style="italic">
      <xsl:value-of select="./faculty_text" /> 
    </fo:block>
    <fo:block font-size="8pt" font-style="italic">
      <xsl:value-of select="./credit" /><xsl:text> ( </xsl:text><xsl:value-of select="./term" /> <xsl:text> ) </xsl:text> <xsl:value-of select="./meeting_text" />
    </fo:block>
    <fo:block  xsl:use-attribute-sets="normal">
      <xsl:value-of select="./course_level" /> / <xsl:value-of select="./course_type" />
    </fo:block>
    <fo:block  xsl:use-attribute-sets="normal txtIndent">
      <xsl:value-of select="./description" />
    </fo:block>
    <fo:block xsl:use-attribute-sets="normal txtIndentLast">
      Note : <xsl:value-of select="./notes" />
    </fo:block>
  </xsl:for-each-group>
  
 </xsl:template> 
  
 
  <xsl:template match="text()" />
  
  </xsl:stylesheet>
