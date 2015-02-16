<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:fo="http://www.w3.org/1999/XSL/Format"
  xmlns:fn="http://www.w3.org/2005/xpath-functions"
  xmlns="http://www.w3.org/1999/xhtml" version="2.0">

  <!-- request parameters width default value -->
  <xsl:param name="depCode" select="'CLAS'" /> 
  <xsl:param name="depName" />
  <xsl:param name="depLName" />
  <xsl:param name="grpColumn" select="'1'" />
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
            <xsl:value-of select="$depName"/><xsl:text> , </xsl:text> Page
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
            <xsl:value-of select="$depLName" />
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
         <!-- <fo:block>
            <xsl:apply-templates select="/conferences" mode="toc"/>
          </fo:block> -->
        
        </fo:flow> <!-- closes the flow element-->
      </fo:page-sequence> <!-- closes the page-sequence -->
    </fo:root>
  </xsl:template>
    
    <xsl:template match="fas_courses" mode="toc">
     <xsl:for-each-group select="course" group-by="department/@code">  
    <!-- just  a test  <xsl:variable name="vrbGrpCol" select="'department/@code'" />
      <xsl:for-each-group select="course" group-by="$vrbGrpCol">  -->     
       <xsl:if test=" current-grouping-key() eq $depCode " >        
      
         <xsl:for-each-group select="current-group()[generate-id() = generate-id (key('course-group',@cat_num)[1])]" group-by="faculty_text/text()">
         
        <!-- updated
          <xsl:for-each-group select="current-group()[generate-id() = generate-id (key('course-nbr',concat(string(course_number/num_int),course_number/num_char))[1])]" group-by="course_group/text()">
        end updated -->
            <xsl:sort select="faculty_text/text()" />                       
               <fo:block text-align-last="justify" font-size="12pt" font-weight="bold">
               <fo:basic-link>
                 <xsl:attribute name="internal-destination">
                   <xsl:value-of select="generate-id()" /> 
                 </xsl:attribute>   
                 <xsl:value-of select="faculty_text/text()" /> 
                    
                   <fo:leader leader-pattern="dots"/>
                    <fo:page-number-citation>
                     <xsl:attribute name="ref-id">
                        <xsl:value-of select="generate-id()"/>
                     </xsl:attribute>
                      </fo:page-number-citation> 
                       <!--</fo:block>  -->
                    </fo:basic-link>
                 </fo:block>    
            <!--[generate-id() = generate-id (key('course-nbr',course_number/num_int)[1])]" -->
            
            <xsl:for-each-group 
              select="current-group()[generate-id() = generate-id (key('course-detail',concat(@cat_num,title))[1])]"
              group-by="title">            
              <xsl:sort select="@title" /> <!--  <xsl:for-each-group select="current-group()[generate-id() = generate-id (key('course-nbr',course_number/number_int)[1])]" group-by="course_number/number_int">
                  -->
              <!--  [generate-id() =  generate-id(key('course_nbr',course_number/number_int)[1])]">
              -->
               <!-- <xsl:for-each-group select="current-group()[generate-id() = generate-id (key('course-nbr',course_number/number_int)[1])]" group-by="course_number/number_int">
               -->
                 <!--<xsl:for-each select="current-group()">  -->
                 <fo:block text-align-last="justify" font-size="9pt" margin-left="8pt">
                <fo:basic-link>
                  <xsl:attribute name="internal-destination">
                    <xsl:value-of select="generate-id()" /> 
                  </xsl:attribute>
                   <xsl:value-of select="title" />                   
                  <!--<xsl:value-of select="concat(@cat_num,title)" /> -->
                  <fo:leader leader-pattern="dots"/>
                  <fo:page-number-citation>
                    <xsl:attribute name="ref-id">
                      <xsl:value-of select="generate-id()"/>
                    </xsl:attribute>
                  </fo:page-number-citation> 
              </fo:basic-link>                  
                 </fo:block>
                  <!--</xsl:for-each>  -->
            </xsl:for-each-group>           
                
             <!-- </xsl:for-each-group> -->
            </xsl:for-each-group>
           
        </xsl:if> 
     </xsl:for-each-group>
    </xsl:template>
  
  <xsl:template match="fas_courses" mode="main">
    <xsl:for-each-group select="course" group-by="department/@code">
      <xsl:if test=" current-grouping-key() eq $depCode " >       
        <xsl:for-each-group select="current-group()[generate-id() = generate-id (key('course-group',@cat_num)[1])]" group-by="faculty_text/text()">         
          
       <!-- updated
         <xsl:for-each-group select="current-group()[generate-id() = generate-id (key('course-nbr',concat(string(course_number/num_int),course_number/num_char))[1])]" group-by="course_group/text()">
          end updated --> 
          <xsl:sort select="faculty_text/text()" />
          <!-- use attribute sets -->
          <fo:block id="{generate-id()}" 
                    break-before="page"                    
            >
            <xsl:value-of select="current-grouping-key()"/>   
           </fo:block>     
          <!-- select="current-group()[generate-id() = generate-id (key('course-nbr',course_number/num_int)[1])]" 
            -->
          <xsl:for-each-group 
            select="current-group()[generate-id() = generate-id (key('course-detail',concat(@cat_num,title))[1])]" group-by="title">            
               <xsl:sort select="@title" />
           
            <!-- Print Course Details -->
            
            <xsl:if test="position() &gt; 1" >
              <fo:block  id="{generate-id()}"  font-size="9pt"
              font-weight="bold"  >              
              <xsl:value-of select="./course_group" /> 
              <xsl:text>  </xsl:text>
              <xsl:value-of select="concat(./course_number/num_int/text(),./course_number/num_char/text())" />
                <xsl:text> . </xsl:text>
              <xsl:value-of select="concat('  ',./title)" /> 
              </fo:block>
            </xsl:if>
            <xsl:if test="position() = 1" >
              <fo:block    font-size="9pt"
                font-weight="bold"  >               
                 
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
         
        </xsl:for-each-group>
      </xsl:if> 
    </xsl:for-each-group>
  </xsl:template>
  <xsl:template match="text()" />
  
  <!-- <xsl:template match="conferences" mode="toc">
    <xsl:for-each-group select="school" group-by="@conference">
      <xsl:sort select="@conference"/>
      <fo:block text-align-last="justify">
        <xsl:value-of select="current-grouping-key()"/>
        <fo:leader leader-pattern="dots"/>
        <fo:page-number-citation>
          <xsl:attribute name="ref-id">
            <xsl:value-of select="generate-id()"/>
          </xsl:attribute>
        </fo:page-number-citation>
      </fo:block>
    </xsl:for-each-group>
  </xsl:template> -->
  </xsl:stylesheet>
