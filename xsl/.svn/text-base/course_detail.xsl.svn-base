<!--<?xml version="1.0" encoding="UTF-8"?>-->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns="http://www.w3.org/1999/xhtml">

    <xsl:import href="common.xsl"/>

    <xsl:param name="mode"/>

    <xsl:template match="/">

        <xsl:if test="$mode!='popup'">
            <p id="groupby"/>
            <xsl:call-template name="breadcrumb"/>
        </xsl:if>

        <xsl:apply-templates select="//course[department/@code=$deptcode][@cat_num=$groupcode]"/>

    </xsl:template>

    <xsl:template match="course">

        <xsl:variable name="lat"
            select="//building/name[text()=//course[department/@code=$deptcode][@cat_num=$groupcode]/meeting_locations/location/@building]/parent::building/latitude"/>
        <xsl:variable name="long"
            select="//building/name[text()=//course[department/@code=$deptcode][@cat_num=$groupcode]/meeting_locations/location/@building]/parent::building/longitude"/>
        <xsl:variable name="buildingName"
            select="//building/name[text()=//course[department/@code=$deptcode][@cat_num=$groupcode]/meeting_locations/location/@building]/parent::building/name"/>
        

        <xsl:variable name="deptShortName" select="//course[department/@code=$deptcode][1]/department/dept_short_name"/>
        <xsl:variable name="deptLongName" select="//course[department/@code=$deptcode][1]/department/dept_long_name"/>
        <xsl:variable name="groupCode" select="//course[department/@code=$deptcode][@cat_num=$groupcode]/course_group/@code"/>
        
       
        <!-- COURSE TITLE -->
        <div>
            <xsl:if test="$lat!='' and $long!=''">
                <xsl:if test="$mode!='popup'">
                    <a href="http://maps.google.com/maps?q={$lat},{$long}+({$buildingName})&amp;z=14&amp;ll={$lat},{$long}" target="_blank">
                    <img id="map"
                        src="http://maps.googleapis.com/maps/api/staticmap?center={$lat},{$long}&amp;zoom=17&amp;size=400x400&amp;maptype=roadmap&amp;markers=color:red%7Clabel:A%7C{$lat},{$long}&amp;sensor=false"
                        >&#160;</img>
                    </a>
                </xsl:if>
                <xsl:if test="$mode='popup'">
                    <a href="http://maps.google.com/maps?q={$lat},{$long}+({$buildingName})&amp;z=14&amp;ll={$lat},{$long}" target="_blank">
                    <img id="map"
                        src="http://maps.googleapis.com/maps/api/staticmap?center={$lat},{$long}&amp;zoom=15&amp;size=200x200&amp;maptype=roadmap&amp;markers=color:red%7Clabel:A%7C{$lat},{$long}&amp;sensor=false"
                        >&#160;</img>
                        </a>
                </xsl:if>
            </xsl:if>

            <div class="right">
                <p class="link">
                <a href="#"
                    onclick="exportToPDF('{$deptcode}', '', 'single', '{./title/text()}', '{$groupcode}', '{$deptShortName}', '{$deptLongName}', '{$groupCode}');"
                    ><img src="web/images/pdf.png" width="28px" height="30px"/> Export to PDF</a>
                    </p>
            </div>

            <h2>
                <xsl:value-of select="./title/text()"/>
            </h2>

        </div>
        <!-- COURSE GROUP TEXT, COURSE #, COURSE TITLE -->
        <p>
            <b>
                <xsl:value-of select="./course_group/text()"/>
                <xsl:text> </xsl:text>
                <xsl:value-of select="./course_number/num_int/text()"/>
                <xsl:text>. </xsl:text>
                <xsl:value-of select="./title/text()"/>
            </b>
        </p>

        <!-- CATALOG # -->
        <p>
            <xsl:text>Catalog Number: </xsl:text>
            <xsl:value-of select="@cat_num"/>
        </p>

        <!-- FACULTY TEXT -->
        <p>
            <i>
                <xsl:value-of select="./faculty_text/text()"/>
            </i>
        </p>

        <!-- SCHEDULE -->
        <p>
            <xsl:value-of select="./credit/text()"/>
            <xsl:text>. </xsl:text>
            <xsl:value-of select="./meeting_text/text()"/>
        </p>

        <!-- COURSE LEVEL / TYPE -->
        <p>
            <xsl:value-of select="./course_level/text()"/>
            <xsl:text> / </xsl:text>
            <xsl:value-of select="./course_type/text()"/>
        </p>

        <!-- COURSE DESCRIPTION -->
        <p class="indented">
            <xsl:value-of select="./description/text()"/>
        </p>

        <!-- NOTES -->
        <p class="indented">
            <xsl:if test="exists(./notes/text())">
                <i>Note : </i>
                <xsl:value-of select="./notes/text()"/>
            </xsl:if>
        </p>

        <!-- PREREQS -->
        <p class="indented">
            <xsl:if test="exists(./prerequisites/text())">
                <i>Prerequisites : </i>
                <xsl:value-of select="./prerequisites/text()"/>
            </xsl:if>
        </p>


    </xsl:template>

    <xsl:template match="text()"/>
</xsl:stylesheet>
