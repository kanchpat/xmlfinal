<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns="http://www.w3.org/1999/xhtml">
    <xsl:import href="common_mo.xsl"/>
    <xsl:output method="xml" encoding="utf-8" omit-xml-declaration="yes"
        doctype-public="http://www.w3.org/TR/xhtml-basic/xhtml-basic11.dtd"
        doctype-system="-//W3C//DTD XHTML Basic 1.1//EN"/>
    <xsl:param name="parm_cgroup" select="'ECON'"/>
    <xsl:param name="relativepath"/>
    <xsl:param name="page_linked" select="'x'"/>

    <xsl:variable name="cg_page" select="substring-after($parm_cgroup,'page')"/>
    <xsl:variable name="parm_cgroup1" select="substring-before($parm_cgroup,'page')"/>

    <xsl:variable name="title" select="concat('Course Catalog -', $course_name)"/>
    <xsl:key name="dept_course_group" match="course_group" use="@code"/>
    <xsl:key name="course_grp" match="course" use="course_group/@code"/>

    <xsl:variable name="course_name" select="key('course_grp',$parm_cgroup1)[1]/course_group"/>

    <xsl:template match="/fas_courses">

        <div>
            <a href="{$relativepath}mobile/index.xhtml">
                <xsl:text>Departments</xsl:text>
            </a>
        </div>
        <h2>
            <xsl:value-of select="$course_name"/>
        </h2>
        <div id="wrap">
            <xsl:call-template name="page_nav"/>
        </div>
        <xsl:call-template name="course_list"/>
    </xsl:template>

    <xsl:template name="course_list">
        <ul>
            <xsl:for-each
                select="key('course_grp',$parm_cgroup1)[@offered='Y'][./course_level/@code='P']">
                <xsl:sort select="number(course_number/num_int)"/>
                <xsl:choose>
                    <!--to view ALL pages-->
                    <xsl:when test="$cg_page='x'">
                        <li>
                            <a href="{$relativepath}mobile/courses/{@cat_num}.html">
                                <xsl:call-template name="check_course">
                                    <xsl:with-param name="cur_course" select="."/>
                                </xsl:call-template>
                            </a>
                        </li>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:if
                            test="(position() gt (number($cg_page)-1) * 10) and (position() le number($cg_page) * 10)">
                            <li>
                                <a href="{$relativepath}mobile/courses/{@cat_num}.html">
                                    <xsl:call-template name="check_course">
                                        <xsl:with-param name="cur_course" select="."/>
                                    </xsl:call-template>
                                </a>
                            </li>
                        </xsl:if>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:for-each>
        </ul>
    </xsl:template>

    <xsl:template name="page_nav">
        <!--to spilt the cousrses in to pages and provide correspoinding links based on the positions -->
        <xsl:variable name="course_cnt"
            select="count(key('course_grp',$parm_cgroup1)[@offered='Y'][./course_level/@code='P'])"/>

        <xsl:if test="$course_cnt gt 10">
            <xsl:text>Pages: </xsl:text>
            <a href="{$relativepath}mobile/course_groups/{$parm_cgroup1}pagex.xhtml">
                <xsl:if test="$cg_page = 'x'">
                    <xsl:attribute name="id">sectcurrent</xsl:attribute>
                </xsl:if>
                <xsl:value-of select="'All '"/>
            </a>| <xsl:for-each
                select="key('course_grp',$parm_cgroup1)[@offered='Y'][./course_level/@code='P']">
                <xsl:sort select="number(course_number/num_int)"/>
                <xsl:if test="position() mod 10 = 1">
                    <xsl:variable name="page_no" select="((position() - 1) div 10)+1"/> <a
                        href="{$relativepath}mobile/course_groups/{$parm_cgroup1}page{$page_no}.xhtml">
                        <xsl:if test="number($cg_page) = number($page_no)">
                            <xsl:attribute name="id">sectcurrent</xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="$page_no"/>
                    </a>
                    <xsl:if test="$page_no*10 lt $course_cnt"> | </xsl:if>
                </xsl:if>
            </xsl:for-each>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>