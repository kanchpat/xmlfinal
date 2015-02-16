<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns="http://www.w3.org/1999/xhtml">
    <xsl:output method="xhtml" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
        doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" indent="yes"/>

    <!-- PARAMETER DECLARATION -->
    <xsl:param name="department"/>
    <xsl:param name="cg"/>
    <xsl:param name="offered"/>
    <xsl:param name="level"/>
    <xsl:param name="desc"/>
    <xsl:param name="term"/>
    <xsl:param name="instructor"/>
    <xsl:param name="day"/>
    <xsl:param name="time"/>
    <xsl:param name="relativepath"/>
    <xsl:param name="deptcode"/>
    <xsl:param name="groupcode"/>
    <xsl:param name="groupby"/>


    <xsl:template match="/">

        <html xmlns:xi="http://www.w3.org/2001/XInclude">
            <head>
                <title>FAS Course Catalog</title>
                <link rel="stylesheet"
                    href="http://yui.yahooapis.com/2.8.0r4/build/reset-fonts-grids/reset-fonts-grids.css"
                    type="text/css"/>
                <link rel="stylesheet" href="css/styling.css" type="text/css"/>

                <script src="js/jquery/jquery.js" type="text/javascript">&#160;</script>
                <script src="js/jquery/jquery.form.js" type="text/javascript">&#160;</script>
                <script src="js/customJS.js" type="text/javascript">&#160;</script>
<!--                <script src="http://maps.google.com/maps?file=api&amp;v=2&amp;key=AIzaSyCCcTItmQnYeGwrxXEZE5TKiq46V0EoauY" type="text/javascript">&#160;</script>-->

                <!--<script type="text/javascript">
  $(document).ready(function() {
    $('#department').change(function(){
      getCourseList();
    });
    $('#course_group').change(function(){
      getCourseList();
    });
    $('#offered').change(function(){
      getCourseList();
    });
    $('#term').change(function(){
      getCourseList();
    });
    $('#level').change(function(){
      getCourseList();
    });
    $('#instructor').change(function(){
      getCourseList();
    });
    $('#day').change(function(){
      getCourseList();
    });
    $('#time').change(function(){
      getCourseList();
    });
  })
  function getCourseList() {
    var department = $('#department').fieldValue()[0];
    var course_group = $('#course_group').fieldValue()[0];
    var offered = '';
    var offered_checkbox = $('#offered').fieldValue()[0];
    if (offered_checkbox != undefined) {
      offered = offered_checkbox;
    }

    var level = $('#level').fieldValue()[0];
    var term = $('#term').fieldValue()[0];
    var instructor = $('#instructor').fieldValue()[0];
    var day = $('#day').fieldValue()[0];
    var time = $('#time').fieldValue()[0];
    $('#courselist').load(
      'ajax/search_advanced.xhtml',
      {
        'department'    : department,
        'course_group'  : course_group,
        'offered'       : offered,
        'term'          : term,
        'level'         : level,
        'instructor'    : instructor,
        'day'           : day,
        'time'          : time
       }
    );
  }
  </script>-->


            </head>

            <body class="yui-skin-sam">

                <div id="doc3" class="yui-t7">
                    <!-- header -->
                    <div id="hd" role="banner">

                        <xsl:call-template name="header"/>

                    </div>
                    <div id="bd" role="main">

                        <xsl:apply-templates/>

                    </div>
                    <div id="ft" role="contentinfo">
                        <xsl:call-template name="footer"/>
                    </div>
                </div>
            </body>
        </html>


    </xsl:template>

    <!-- BREADCRUMB SECTION -->
    <xsl:template name="breadcrumb">

        <xsl:choose>

            <!-- no department or course has been selected. this is the default launch settings -->
            <xsl:when test="$deptcode='' and $groupcode=''">
                <table width="100%">
                    <tr id="bc">
                        <td id="bc">
                            <a href="home.html">Return to Home </a> &#8594; <b>Select a department
                                to start browsing</b>
                        </td>
                    </tr>
                </table>
            </xsl:when>
            
            <!-- department has been selected, but no course has been selected, so just show department name as an inactive link -->
            <xsl:when test="$deptcode!='' and $groupcode=''">
                <table width="100%">
                    <tr id="bc">
                        <td id="bc">
                            <xsl:value-of
                                select="distinct-values(//department[@code=$deptcode]/dept_short_name)"
                            /> &#8594; </td>
                    </tr>
                </table>
            </xsl:when>
            
            <!-- department has been selected, and a course has been selected, so show department name as an active link -->
            <xsl:when test="$deptcode!='' and $groupcode!=''">
                <table width="100%">
                    <tr id="bc">
                        <td id="bc">
                            <a href="#" onclick="loadCourses('{$deptcode}');return false;">
                                <xsl:value-of
                                    select="distinct-values(//department[@code=$deptcode]/dept_short_name)"
                                />
                            </a> &#8594; <xsl:value-of
                                select="distinct-values(//department[@code=$deptcode]/parent::course[@cat_num=$groupcode]/title/text())"
                            />
                        </td>
                    </tr>
                </table>
            </xsl:when>
        </xsl:choose>



    </xsl:template>

    <!-- HEADER -->
    <xsl:template name="header">
        <div id="top-right">
            <a href="mobile/index.xhtml">| Switch to mobile |</a>
        </div>
        <table>
            <tr>
                <td>
                    <a class="plain" href="home.html"><img src="{$relativepath}web/images/shield.png" alt=""/></a>
                </td>
                <td>
                    <h1>Harvard University, Faculty of Arts &amp; Sciences Course Catalog </h1>
                </td>
            </tr>
        </table>

    </xsl:template>

    <!-- FOOTER -->
    <xsl:template name="footer">
        <hr/>
        <div class="cgAnch"> &#169; 2011 Orange Team - CSCI153 -- </div>

    </xsl:template>

    <!-- GROUP BY SELETION -->
    <xsl:template name="groupBySelection">        
        <xsl:if test="$deptcode!=''">
            <div id="top-right">
                <p id="groupby">Group By : 
                     <a>
                         <xsl:attribute name="href">#</xsl:attribute> 
                         <xsl:attribute name="onclick">groupCoursesBy('term');</xsl:attribute>
                         <xsl:if test="$groupby='term'"><xsl:attribute name="class">selected</xsl:attribute></xsl:if>
                         By Term</a>
                    | <a>
                        <xsl:attribute name="href">#</xsl:attribute> 
                        <xsl:attribute name="onclick">groupCoursesBy('dandt');</xsl:attribute>
                        <xsl:if test="$groupby='dandt'"><xsl:attribute name="class">selected</xsl:attribute></xsl:if>
                        By Day &amp; Time</a> | 
                    <a>
                        <xsl:attribute name="href">#</xsl:attribute> 
                        <xsl:attribute name="onclick">groupCoursesBy('instructor');</xsl:attribute>
                        <xsl:if test="$groupby='instructor'"><xsl:attribute name="class">selected</xsl:attribute></xsl:if>
                        By Instructor</a>
                    &#160;</p>
            </div>
        </xsl:if>
    </xsl:template>

    <xsl:template match="text()"/>

</xsl:stylesheet>
