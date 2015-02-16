<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:fo="http://www.w3.org/1999/XSL/Format"
  xmlns:fn="http://www.w3.org/2005/xpath-functions"
  xmlns="http://www.w3.org/1999/xhtml" version="2.0">
 
 <!-- sample URL fro reference -->
 <!--
   <a href="singlecourse.pdf?pdepCode={department/@code}&
   depName={department/dept_short_name}&;
   pdepLName={department/dept_long_name}&;
   pcrsGrpCode={course_group/@code}&
   pcrsCatNum={@cat_num}>View Single course in PDF  </a> -->
 <!-- parameters required  to get the course details  -->
  <xsl:param name="pcrsCatNum"  />
  <xsl:param name="pdepCode" /> 
  <xsl:param name="pcrsGrpCode"  /> 
  <xsl:param name="pdepLName"  /> 
  <xsl:param name="depName" /> 
  <!-- end parameters required for course details -->
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
          
          <!-- Page Number -->
          <fo:block font-size="8pt" text-align="end">
            <xsl:text> Page   </xsl:text>   
            <fo:page-number/>
            <xsl:text> of </xsl:text>
            <fo:page-number-citation ref-id="theEnd"/>
          </fo:block>
          <!-- this defines a title -->
          <fo:block xsl:use-attribute-sets="depTitle">
            <xsl:value-of select="$pdepLName" />
          </fo:block>
         
         <!-- working
           select="/fas_courses/course[@cat_num = 5085 ]" 
         -->  
          <!-- main departmentns nm -->
          <fo:block>
            <xsl:apply-templates 
              select="/fas_courses/course[department/@code = $pdepCode and  course_group/@code= $pcrsGrpCode and @cat_num = $pcrsCatNum]" 
              mode="main" />
            <!-- <xsl:apply-templates select="/fas_courses" mode="main" /> -->
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
    
   
  <xsl:template match="course" mode="main">
      <!-- use attribute sets -->
          <fo:block >
            <xsl:value-of select="course_group/text()" /> 
              <xsl:text>  </xsl:text>
              <xsl:value-of select="concat(./course_number/num_int/text(),./course_number/num_char/text())" />
                <xsl:text> . </xsl:text>
              <xsl:value-of select="concat('  ',./title)" /> 
              </fo:block>            
           
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
        
  </xsl:template>
  <xsl:template match="text()" />
  
  </xsl:stylesheet>
