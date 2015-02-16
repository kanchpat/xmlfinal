<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns="http://www.w3.org/1999/xhtml">
    <xsl:output method="xml" encoding="utf-8" omit-xml-declaration="yes"
        doctype-public="http://www.w3.org/TR/xhtml-basic/xhtml-basic11.dtd"
        doctype-system="-//W3C//DTD XHTML Basic 1.1//EN"/>
    <xsl:param name="relativepath"/>

    <xsl:variable name="evencolor">#efefef</xsl:variable>
    <xsl:variable name="oddcolor">#cccccc</xsl:variable>
    <xsl:variable name="title" select="'Departments '"/>
    <xsl:variable name="displaytitle">
        <xsl:value-of select="$title"/>
    </xsl:variable>
    
    <xsl:template match="/">
        <html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
            <head>
                <link href="{$relativepath}css/mobile.css" rel="stylesheet" type="text/css"/>
                <link rel="stylesheet" type="text/css" media="all and (max-device-width: 480px)"
                href="{$relativepath}css/mobile.css"/>
                <title>
                    <xsl:value-of select="$displaytitle"/>
                </title>
            </head>
            <body>
                    <xsl:apply-templates/>
            </body>
        </html>
    </xsl:template>

    <!--    common procedure to check the course properties like if it is bracketted,asterisked or both-->
    <xsl:template name="check_course">
        <xsl:param name="cur_course"/>
        <xsl:choose>
            <xsl:when test="$cur_course/@offered='Y'">
                <xsl:choose>
                    <xsl:when test="$cur_course/instructor_approval_required='N'">
                        <xsl:value-of
                            select="concat($cur_course/course_group,' ',$cur_course/course_number/num_int,$cur_course/course_number/num_char,'. ',$cur_course/title)"
                        />
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of
                            select="concat('*',$cur_course/course_group,' ',$cur_course/course_number/num_int,$cur_course/course_number/num_char,'. ',$cur_course/title)"
                        />
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
                <xsl:choose>
                    <xsl:when test="$cur_course/instructor_approval_required='N'">
                        <xsl:value-of
                            select="concat('[',$cur_course/cur_course/course_group,' ',$cur_course/course_number/num_int,$cur_course/course_number/num_char,'. ',$cur_course/title,']')"
                        />
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of
                            select="concat('[*',$cur_course/course_group,' ',$cur_course/course_number/num_int,$cur_course/course_number/num_char,'. ',$cur_course/title,']')"
                        />
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
</xsl:stylesheet>