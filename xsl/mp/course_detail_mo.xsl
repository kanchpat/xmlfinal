<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns="http://www.w3.org/1999/xhtml">
    <xsl:import href="common_mo.xsl"/>
    <xsl:output method="xml" encoding="utf-8" omit-xml-declaration="yes"
        doctype-public="http://www.w3.org/TR/xhtml-basic/xhtml-basic11.dtd"
        doctype-system="-//W3C//DTD XHTML Basic 1.1//EN"/>

    <xsl:param name="parm_cat_num" select="'5978'"/>
    <xsl:param name="relativepath"/>

    <xsl:key name="course_cat_table" match="course" use="@cat_num"/>
    <xsl:variable name="cn" select="key('course_cat_table',$parm_cat_num)"/>
    <xsl:variable name="title"
        select="concat($cn/course_group,' ',$cn/course_number/num_int, '- Course Details')"/>

    <xsl:template match="/fas_courses">
        <div id="wrap">
            <xsl:call-template name="g_brdcrumbs"/>
            <xsl:call-template name="course_details"/>
        </div>
    </xsl:template>

    <xsl:template name="g_brdcrumbs">
        <div>
            <a href="{$relativepath}mobile/index.xhtml">
                <xsl:text>Departments</xsl:text>
            </a>
            <img src="{$relativepath}images/arrow.gif" alt="->" height="5" width="10"/>
            <xsl:text> </xsl:text>
            <a href="{$relativepath}mobile/course_groups/{$cn/course_group/@code}page1.xhtml">
                <xsl:value-of select="$cn/course_group"/>
            </a>
        </div>
    </xsl:template>

    <xsl:template name="course_details">
        <h3>
            <xsl:call-template name="check_course">
                <xsl:with-param name="cur_course" select="$cn"/>
            </xsl:call-template>
            <!--            <xsl:value-of select="$cn/department/dept_short_name"/>-->
        </h3>
        <div>
            <xsl:text> Catalog Number: </xsl:text>
            <xsl:value-of select="$cn/@cat_num"/>
        </div>
        <div>
            <xsl:value-of select="$cn/faculty_text"/>
        </div>
        <div>
            <xsl:value-of select="concat($cn/credit,' (',$cn/term,'). ',$cn/meeting_text)"/>
        </div>
        <div>
            <xsl:value-of select="$cn/course_level"/>
            <xsl:text>/</xsl:text>
            <xsl:value-of select="$cn/course_type"/>
        </div>
        <p>
            <xsl:value-of select="$cn/description"/>
        </p>
        <xsl:if test="normalize-space($cn/notes)">
            <div class="sml">
                <div class="sml1">
                    <xsl:text>Note: </xsl:text>
                </div>
                <xsl:value-of select="$cn/notes"/>
            </div>
        </xsl:if>
        <div>
            <xsl:if test="normalize-space($cn/prerequisites)">
                <div class="sml">
                    <div class="sml1">
                        <xsl:text>Prerequisites: </xsl:text>
                    </div>
                    <xsl:value-of select="$cn/prerequisites"/>
                </div>
            </xsl:if>
        </div>
    </xsl:template>
</xsl:stylesheet>